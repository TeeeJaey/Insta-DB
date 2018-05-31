import cx_Oracle as oracle
con = oracle.connect('system/tejas2304@localhost/xe')
con.autocommit = True
cur = con.cursor()
print("Enter your choice:")
print("1-- Max likes")
print("2-- Min likes")
print("3-- Who liked the most")
print("4-- Music pictures")
print("5-- Popular Tag")
print("6-- Most liked user")
print("7-- Old Tagging")
print("8-- Delete inactive users")
print("9-- Exit")
while True:

    ch = int(input("Enter Choice: "))

    if ch == 1:
        cur.execute("""select pic_id from INSTA_LIKES group by pic_id having count(*)=(select max(count(*)) from INSTA_LIKES group by pic_id)""")

        for result in cur:
            print("Pic id: ", result[0])
            
    elif ch == 2:
        cur.execute("select pic_id from INSTA_LIKES group by pic_id having count(*)=(select min(count(*)) from INSTA_LIKES group by pic_id)")

        for result in cur:
            print("Pic id: ", result[0])

    elif ch == 3:
        cur.execute("select user_id from INSTA_LIKES group by user_id having count(user_id)=(select max(count(*)) from INSTA_LIKES group by user_id)")
        for result in cur:
            print("User id: ", result[0])

    elif ch == 4:
        cur.execute("select pic_id from INSTA_PICS where music=1")
        
        for result in cur:
            print("Pic id: ", result[0])

    elif ch == 5:
        max = 0
        mm = "All"
        cur.execute("select count(*) from INSTA_PICS where arts=1")
        ft = cur.fetchall()[0][0]
        if max < ft:
            max = ft
            mm = "Arts"
        cur.execute("select count(*) from INSTA_PICS where history=1")
        ft = cur.fetchall()[0][0]
        if max < ft:
            max = ft
            mm = "History"
        cur.execute("select count(*) from INSTA_PICS where engineering=1")
        ft = cur.fetchall()[0][0]
        if max < ft:
            max = ft
            mm = "Engineering"
        cur.execute("select count(*) from INSTA_PICS where science=1")
        ft = cur.fetchall()[0][0]
        if max < ft:
            max = ft
            mm = "Science"
        cur.execute("select count(*) from INSTA_PICS where music=1")
        ft = cur.fetchall()[0][0]
        if max < ft:
            max = ft
            mm = "Music"
        print("Most Popular tag is: ", mm)
    elif ch == 6:
        users=[]
        cur.execute("select user_id from INSTA_USERS")
        for result in cur:
            users.append(int(result[0]))
        mx = 0
        us = 0
        for user in users:
            cur.execute("select count(*) from INSTA_LIKES where pic_id in (select pic_id from INSTA_PICS where user_id=" +str(user) + ")")
            fx = cur.fetchall()[0][0]
            if fx > mx:
                mx = fx
                us = user
        print("Most liked user is: ", us)
    elif ch == 7:
        cur.execute("select pic_id from INSTA_PICS where extract(year from sysdate)-extract(year from pic_date)>=3")
        print("Old Pics (Pic ids): ")
        for result in cur:
            print(result[0])

    elif ch == 8:
        cur.execute("SELECT user_id from INSTA_PICS where extract(year from sysdate)-extract(year from pic_date)<=1")
        result = cur.fetchall()
        for res in result:
            temp = str(res[0])
            cur.execute("Delete from INSTA_LIKES where user_id=" + str(res[0]))
            con.commit()
            cur.execute("SELECT * FROM INSTA_LIKES")
            print(cur.fetchall())
            con.commit()
            cur.execute("Delete from INSTA_PICS where user_id=" + str(res[0]))
            con.commit()
            cur.execute("Delete from INSTA_USERS where user_id=" + str(res[0]))
            
            print("User ", res[0], " deleted")
    elif ch == 9:
        break

con.commit()
con.close()

def highorders():
    import pymysql
    connection = pymysql.connect(host = "localhost",
                                 user = "root",
                                 password = "worldcup7!",
                                 database = "madang",
                                 cursorclass = pymysql.cursors.DictCursor)

    try:
        with connection.cursor() as cursor:
            sql="""
            create view Highorders (bookid, bookname, name, publisher, saleprice)
            as select o.bookid, b.bookname, c.name, b.publisher, o.saleprice
            from book b, customer c, orders o
            where b.bookid = o.bookid and c.custid = o.custid and o.saleprice>=20000;
            """
            cursor.execute(sql)

    finally:
        cursor.close()
        connection.close()


def modify_highorders():
    import pymysql
    connection = pymysql.connect(host = "localhost",
                                 user = "root",
                                 password = "worldcup7!",
                                 database = "madang",
                                 cursorclass = pymysql.cursors.DictCursor)

    try:
        with connection.cursor() as cursor:
            sql="""
            create or replace view Highorders (bookid, bookname, name, publisher)
            as select o.bookid, b.bookname, c.name, b.publisher
            from book b, customer c, orders o
            where b.bookid = o.bookid and c.custid = o.custid and o.saleprice>=20000;
            """
            cursor.execute(sql)

    finally:
        cursor.close()
        connection.close()


def print_view():
    import pymysql
    connection = pymysql.connect(host="localhost",
                                 user="root",
                                 password="worldcup7!",
                                 database="madang",
                                 charset='utf8',
                                 port=3306)

    try:
        cursor = connection.cursor()
        sql = """
        select bookname, name
        from Highorders;
        """
        res = cursor.execute(sql)
        data = cursor.fetchall()
        
        print('{0}\t{1:<}'.format("bookname", "name"))
        for rowdata in data:
            print('{0}\t{1:<}'.format(rowdata[0], rowdata[1]))

    finally:
        cursor.close()
        connection.close()


if __name__ == "__main__":
    highorders()
    print_view()
    modify_highorders()
    print_view()
import pymysql

# def customer_saleprice():
conn = pymysql.connect(host="localhost",
                    user="root",
                    passwd="worldcup7!",
                    database="madang",
                    charset="utf8")

try:
    cursor = conn.cursor()
    sql1="""
    select name, sum(saleprice)
    from customer, orders
    where customer.custid = orders.custid
    group by customer.name;
    """
    cursor.execute(sql1)
    customers = cursor.fetchall()
    print("<보기1> 고객의 이름과 고객별 구매액: ")
    for customer in customers:
        print(customer)

    print()

    sql2 = """
    select name, avg(saleprice)
    from customer, orders
    where customer.custid = orders.custid
    group by customer.name
    having avg(saleprice) >
            (select avg(saleprice) from orders);
    """
    cursor.execute(sql2)
    prices = cursor.fetchall()
    print("<보기2> 도서의 총판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름: ")
    for price in prices:
        print(price)

finally:
    cursor.close()
    conn.close()
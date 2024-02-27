import pymysql

conn = pymysql.connect(host='localhost',
                       user='root',
                       passwd='worldcup7!',
                       database='madang',
                       charset='utf8')

try:
    cursor = conn.cursor()
    insertBooksql = "insert into Book values(16, '야구의 정석', \
        '국민서점', 9000);"
    cursor.execute(insertBooksql)
    selectBook = "select * from book;"
    cursor.execute(selectBook)
    books = cursor.fetchall()
    for book in books:     # 튜플로 나옴
        print(book)

    # 고객 정보 업데이트
    update_customer_sql = "UPDATE customer SET address ='대한민국 인천' WHERE custid=5"
    cursor.execute(update_customer_sql)
    
    # 모든 고객 정보 조회
    select_customer_sql = "SELECT * FROM customer"
    cursor.execute(select_customer_sql)
    customers = cursor.fetchall()
    for customer in customers:
        print(customer)
    
    # 책 삭제
    #delete_orders_sql = "DELETE FROM Orders WHERE orderid = '2'"
    delete_orders_sql = "DELETE FROM orders WHERE orderid = 4"
    cursor.execute(delete_orders_sql)
    
    # 모든 책 조회
    select_orders_sql = "SELECT * FROM orders"
    cursor.execute(select_orders_sql)
    orders = cursor.fetchall()
    for order in orders:
        print(order)

    conn.commit()

except Exception as e:
    print(f"에러가 발생함: {e}")
    conn.rollback()

finally:
    cursor.close()
    conn.close()
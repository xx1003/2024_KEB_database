import  pymysql

def getTotal( ):
    # MySQL 서버 연결 정보
    connection = pymysql.connect(host='localhost',  # MySQL 서버 주소 (예: 'localhost')
                    user='root',  # MySQL 사용자 이름
                    password='worldcup7!',  # MySQL 비밀번호
                    database='madang',  # 사용할 데이터베이스 이름
                    cursorclass=pymysql.cursors.DictCursor)

    try:
        with connection.cursor() as cursor:
            # SQL 쿼리 실행
            sql = """
            SELECT	SUM(saleprice) AS total
            FROM	Orders od
            WHERE	EXISTS (SELECT *
                    FROM	Customer cs
                    WHERE	address LIKE '%대한민국%' AND 
                    cs.custid=od.custid);
            """
            cursor.execute(sql)
            result = cursor.fetchone()
            print(f"총 판매 가격: {result['total']}")

    finally:
        cursor.close()
        connection.close()

if __name__ == "__main__":
   getTotal()


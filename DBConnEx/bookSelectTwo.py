import pymysql

def get_book_by_id(pbookid):
    #데이터베이스 접속 관련 변수들 초기화
    host = "localhost"
    port = 3306
    database = "madang"
    username = "root"
    password = "worldcup7!"

    #접속 상태 확인
    conflag = True

    try:
        print("데이터베이스 연결 준비...")
        conn = pymysql.connect(host=host, user=username, passwd=password, 
                            db=database, port=port, charset='utf8')
        print("데이터베이스 연결 성공")
    except Exception as err:
        print ("데이터베이스 연결 실패")
        conflag = False


    if conflag == True:
        cursor = conn.cursor()
        # sqlString = f'select * from book where bookid = {pbookid};'
        sqlString = 'select * from book where bookid = %s;'
        res = cursor.execute(sqlString, str(pbookid))
        data = cursor.fetchall() # tuple로 반환
        print("data의 타입 = ", type(data))

        print('{0}\t{1:<} \t{2:<} \t{3:>}'.format(
            "bookid", "bookname", "publisher", "price"))
        #레코드들 출력
        for rowdata in data:
            if rowdata[3] is None:
                print('{0}\t{1:<} \t{2:<} \t{3:>}'.format(
                    rowdata[0], rowdata[1], rowdata[2], 0))
            else: 
                print('{0}\t{1:<} \t{2:<} \t{3:>}'.format(
                    rowdata[0], rowdata[1], rowdata[2], rowdata[3]))

        cursor.close()

        conn.close()


def getBookByName(pbookname):
    #데이터베이스 접속 관련 변수들 초기화
    host = "localhost"
    port = 3306
    database = "madang"
    username = "root"
    password = "worldcup7!"

    #접속 상태 확인
    conflag = True

    try:
        print("데이터베이스 연결 준비...")
        conn = pymysql.connect(host=host, user=username, passwd=password, 
                            db=database, port=port, charset='utf8')
        print("데이터베이스 연결 성공")
    except Exception as err:
        print ("데이터베이스 연결 실패")
        conflag = False


    if conflag == True:
        cursor = conn.cursor()
        sqlString = 'select * from book where bookname = %s;'
        # sqlString = f'select * from book where bookname = {pbookname};'
        res = cursor.execute(sqlString, pbookname)
        data = cursor.fetchall() # tuple로 반환
        print("data의 타입 = ", type(data))

        print('{0}\t{1:<} \t{2:<} \t{3:>}'.format(
            "bookid", "bookname", "publisher", "price"))
        #레코드들 출력
        for rowdata in data:
            if rowdata[3] is None:
                print('{0}\t{1:<} \t{2:<} \t{3:>}'.format(
                    rowdata[0], rowdata[1], rowdata[2], 0))
            else: 
                print('{0}\t{1:<} \t{2:<} \t{3:>}'.format(
                    rowdata[0], rowdata[1], rowdata[2], rowdata[3]))

        cursor.close()

        conn.close()

if __name__ == "__main__":
    bookid = int(input("원하는 bookid를 입력 => "))
    get_book_by_id(bookid)

    bookname = input("원하는 bookname을 입력 => ")
    getBookByName(bookname)



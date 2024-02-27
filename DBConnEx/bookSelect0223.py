import pymysql
print("Hello")

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
    sqlString = 'select * from book;'
    res = cursor.execute(sqlString)
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

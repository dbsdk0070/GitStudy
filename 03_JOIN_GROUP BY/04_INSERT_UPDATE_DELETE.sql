--INSERT, UPDATE, DELETE
/* *********************

■ INSERT 문
INSERT INTO 테이블명
       (컬럼명1, 컬럼명2, ..., 컬럼명n)
VALUES (값1, 값2, ..., 값n);


■ UPDATE 문
UPDATE 테이블명
   SET 컬럼명1 = 값1, 컬럼명2 = 값2, ..., 컬럼명n = 값n
[WHERE 대상조건]  


■ DELETE 문
DELETE FROM 테이블명
[WHERE 대상조건]


**************************/
SELECT * FROM BOOK ORDER BY BOOKID DESC;
INSERT INTO BOOK
            (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (30, '자바란 무엇인가?', 'ITBOOK', 30000);
COMMIT;

INSERT INTO BOOK
            (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (31, '자바란 무엇인가2?', 'ITBOOK', 30000);
ROLLBACK;
COMMIT;

/* INSERT : 컬럼명을 나열하지 않고 입력
-- 테이블 생성시 작성된 컬럼의 값을 모두 입력(누락시 오류)
-- 테이블 생성시 작성된 컬럼의 순서에 따라 데이터 입력 입력하지 않는 경우
   (입력성공) 논리적 오류 - 잘못된 위치에 데이터 입력
************************************/
INSERT INTO BOOK
VALUES (32, '자바란 무엇인가3?');
COMMIT;






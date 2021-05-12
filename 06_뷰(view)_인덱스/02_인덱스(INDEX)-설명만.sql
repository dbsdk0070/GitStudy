/* *********************************
<인덱스 - INDEX>
테이블에 있는 데이터(로우, 레코드)를 빠르게 찾기 위해 만들어진 데이터 구조
- 자동인덱스 : PRIMARY KEY 선언시 또는 UNIQUE 제약조건 설정시 생성되는 인덱스
- 수동인덱스 : CREATE INDEX 명령문을 사용해서 만드는 인덱스

<인덱스 생성시 고려사항>
-- [인덱스 사용의 장점]
-인덱스는 WHERE절에 자주 사용되는 컬럼에 적용
-조인조건에 자주 사용되는 컬럼에 적용
-컬럼의 데이터 분포도가 낮을 때 효율 증가(10~15%)
-인덱스는 기본적으로 정렬이 되어있어서(오름차순) 데이터를 좀 더 빠르게 찾을 수 있음 

-- [인덱스 사용시 고려사항]
-단일 테이블에 인덱스가 너무 많아도 속도 저하 문제 발생(테이블당 4~5정도)
-컬럼의 데이터가 변경(입력,수정,삭제)되는 경우가 많으면 인덱스 사용량 검토
--(데이터 입력, 수정, 삭제시 인덱스에 대한 입력, 수정, 삭제 작업 발생)

<인덱스 생성 문법>
CREATE INDEX 인덱스명 ON 테이블명 (컬럼명1[, 컬럼명2, ..., 컬럼명n]); -- 인덱스는 기본적으로 오름차순 정렬이 되어있음
CREATE [UNIQUE] INDEX ON 테이블명 (컬럼명1 [ASC|DESC], 컬럼명2, .., 컬럼명n);

<인덱스 수정 문법>
ALTER [UNIQUE] INDEX 인덱스명 ON 테이블명 (컬럼명1[, 컬럼명2, ..., 컬럼명n]);

<인덱스 삭제 문법>
DROP INDEX 인덱스명;

<인덱스 재구성 문법>
ALTER INDEX 인덱스명 REBUILD;
ALTER [UNIQUE] INDEX 인덱스명 [ON 테이블명 (컬럼명, ...)] REBUILD;
************************************/

--인덱스 생성 : BOOK 테이블의 출판사(PUBLISHER)컬럼에 IX_BOOK 인덱스 만들기
CREATE INDEX IX_BOOK ON BOOK (PUBLISHER);
SELECT * FROM BOOK WHERE PUBLISHER = '굿스포츠';  --인덱스가 있거나 없거나 결과는 똑같음 그러나 인덱스를 만들면 
                                                 -- 자동으로 정렬이되기 때문에 데이터를 좀 더 빠르게 찾을 수 있음
SELECT PUBLISHER, BOOKID FROM BOOK ORDER BY PUBLISHER ASC;
SELECT * FROM BOOK WHERE BOOKNAME = '축구의 이해'; -- 인덱스를 만들지 않으면 건건이 조회해야됨 1000만건 . . . 이상일 땐 오래걸리니까

--인덱스 생성 : 2개 컬럼 기준
--BOOK 테이블의 PUBLISHER, PRICE 컬럼을 대상으로 IX_BOOK2
CREATE INDEX IX_BOOK2 ON BOOK (PUBLISHER, PRICE);
--DROP INDEX IX_BOOK2;
SELECT PUBLISHER, PRICE FROM BOOK ORDER BY PUBLISHER, PRICE;

SELECT * FROM BOOK WHERE PUBLISHER = '대한미디어';
SELECT * FROM BOOK WHERE PRICE > 10000;
-- DROP INDEX IX_BOOK;

--WHERE 절에서 PUBLISHER, PRICE 동시 사용시 IX_BOOK2 인덱스 적용
SELECT * FROM BOOK WHERE PUBLISHER = '굿스포츠' AND PRICE = 7000;
SELECT * FROM BOOK WHERE PRICE = 7000 AND PUBLISHER = '굿스포츠';
-- 두 개의 SQL 문장의 결과는 같음 

--인덱스가 있는데 사용이 안되는 경우
--LIKE 절에는 사용 불가능하지만 '대한%' 처럼 % 문자열이 뒤에 있으면 인덱스 사용이 가능하다
SELECT * FROM BOOK WHERE PUBLISHER LIKE '대한%'; --인덱스 사용 가능
SELECT * FROM BOOK WHERE PUBLISHER LIKE '%대한%'; --인덱스 사용 불가능(앞에 %문자가 있으면 X) FULL SCAN : 인덱스 사용 안된거임 / 인덱스 적용안함(전체비교)
SELECT * FROM BOOK WHERE PUBLISHER LIKE '%대한'; --인덱스 적용안함(전체비교)

--원본 데이터를 가공하는 경우(인덱스 적용 안됨)
--SUBSTR (컬럼명, 1, 2) = '대한' : 문자 자르기
SELECT * FROM BOOK WHERE SUBSTR(PUBLISHER,1,2) = '대한';

--인덱스 삭제 (DROP)
DROP INDEX IX_BOOK2;

/* *** 인덱스 실습 ****************************
마당서점 데이터베이스에서 다음 SQL 문을 수행하고 
데이터베이스가 인덱스를 사용하는 과정을 확인하시오.
**********************************************/

--(1) 다음 SQL 문을 수행해본다.
SELECT name FROM Customer WHERE name LIKE '박세리';
    
--(2) 실행 계획을 살펴본다. 실행 계획은 [F10]키를 누른 후 
--[계획 설명]탭을 선택하면 표시된다.
--(3) Customer 테이블에 name으로 인덱스(ix_customber_name)를 생성하시오.
CREATE INDEX IX_CUSTOMER_NAME ON Customer(NAME);
--생성 후 (1)번의 질의를 다시 수행하고 실행 계획을 살펴보시오.
--(4) 같은 질의에 대한 두 가지 실행 계획을 비교해보시오.
--(5) (3)번에서 생성한 인덱스를 삭제하시오.
DROP INDEX IX_CUSTOMER_NAME;








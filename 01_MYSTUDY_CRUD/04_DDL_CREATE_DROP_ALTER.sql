/*(실습) 테이블(TABLE) 만들기(테이블명: TEST2)
    NO : 숫자타입 5자리, PRIMARY KEY  선언
    ID : 문자타입 10자리(영문10자리), 값이 반드시 존재(NULL 허용안함)
    NAME : 한글 10글자까지 저장가능하게 설정, 값이 반드시 존재
    EMAIL : 영문,숫자,특수문자 포함 30자리
    ADDRESS : 한글 100자
    IDNUM : 숫자타입 정수부 7자리, 소수부 3자리(1234567.123)
    REGDATE : 날짜타입
*************************/
CREATE TABLE TEST2 (
    NO NUMBER(5) PRIMARY KEY,
    ID VARCHAR2(10) NOT NULL,
    NAME VARCHAR2(30) NOT NULL,
    EMAIL VARCHAR2(30),
    ADDRESS VARCHAR2(300),
    IDNUM NUMBER(10, 3),
    REGDATE DATE
);
SELECT * FROM TEST2;
INSERT INTO TEST2
VALUES (11111, 'TEST1', '홍길동1', 'test1@test.com',
       '서울시 강남구', 1234567.123, sysdate);
INSERT INTO TEST2 (NO, ID, NAME)
VALUES (22, 'TEST2', '홍길동2');
INSERT INTO TEST2 (NO, NAME, ID)
VALUES (33, '홍길동3', 'TEST3');
COMMIT;
--===========================
-- 특정 테이블의 데이터와 함께 테이블 구조를 함께 복사
CREATE TABLE TEST3
AS
SELECT * FROM TEST2;
--
SELECT * FROM TEST2;
SELECT * FROM TEST3;
----------------------
--특정 테이블의 특정컬럼과 특정 데이터만 복사하면서 테이블 생성
CREATE TABLE TEST4
AS
SELECT NO, ID, NAME, EMAIL FROM TEST2 WHERE NO = 11111;
-------
--특정 테이블의 구조만 복사(데이타는 복사하지 않음)
CREATE TABLE TEST5
AS 
SELECT * FROM TEST2 WHERE 1 = 2;
--==================
SELECT * FROM TEST2;
DELETE FROM TEST2 WHERE ID = 'TEST3';
DELETE FROM TEST2; --테이블 전체데이터 삭제
ROLLBACK; --취소 처리 가능

--TRUNCATE 명령문 : 테이블 전체 데이터 삭제(ROLLBACK 복구 안됨)
TRUNCATE TABLE TEST2;
SELECT * FROM TEST2;
/* 테이블을 삭제 : DROP TABLE - 데이터와 함께 테이블구조 모두 삭제처리
    DROP TABLE 유저명.테이블명;
    drop table 유저명.테이블명 cascade constraints PURGE
    - cascade constraints : 참조데이터가 있어도 삭제 처리
    - PURGE : 휴지통에 백업없이 완전히 삭제
*/
DROP TABLE TEST2;
--==============================
/* 테이블 수정 : 컬럼 추가, 수정, 삭제
DDL : ALTER TABLE
- ADD : 추가
- MODIFY : 수정 - 데이터 상태에 따라 적용 가능여부 결정
    --컴럼사이즈 작은 -> 큰 : 언제나 가능
    --컬럼사이즈 큰 -> 작은 : 저장된 데이터 상태에 따라 다름
- DROP COLUMN : 삭제
**************************/
SELECT * FROM TEST3;
--컬럼추가 TEST3 테이블에 ADDCOL 컬럼 추가
ALTER TABLE TEST3 ADD ADDCOL VARCHAR2(10);

-- 컬럼수정 TEST3 테이블의 ADDCOL 크기 -> VARCHAR2(20)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(20);
UPDATE TEST3 SET ADDCOL = '123456789012345';
SELECT * FROM TEST3;

-- 컬럼수정 TEST3 테이블의 
-- ADDCOL 크기 -> VARCHAR2(10), VARCHAR2(15)
--오류 : ORA-01441: cannot decrease column length because some value is too big
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(10); --오류발생
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(15); --수정처리됨

--컬럼 삭제 : DROP COLUMN
ALTER TABLE TEST3 DROP COLUMN ADDCOL;
-------------------
alter table "MYSTUDY"."TEST3" rename to AAAA;
alter table AAAA rename to TEST3;
ALTER TABLE TEST3 RENAME COLUMN ADDCOL TO ADDCOL2;
ALTER TABLE TEST3 MODIFY (ADDCOL2 NOT NULL);


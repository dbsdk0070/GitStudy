--==========================================
/*(실습)프로시저 작성하고 실행하기
고객테이블(SUSTOMER)에 있는 데이터 조회 프로시저 작성
- 프로시저명 : GET_CUSTINFO
- 입력받는 값 : 고객ID
- 처리 : 입력받은 고객ID에 해당하는 데이터를 찾아서 화면출력
- 출력항목 : 고객ID, 고객명, 주소, 전화번호
*******************************/

CREATE OR REPLACE PROCEDURE GET_CUSTOMER
(
    IN_CUSTID IN NUMBER
)
AS
    V_CUSTID NUMBER(2);
    V_NAME VARCHAR2(40);
    V_ADDRESS VARCHAR2(50);
    V_PHONE VARCHAR2(20);
BEGIN
    SELECT CUSTID, NAME, ADDRESS, PHONE
      INTO V_CUSTID, V_NAME, V_ADDRESS, V_PHONE
      FROM CUSTOMER
     WHERE CUSTID = IN_CUSTID;
     
     DBMS_OUTPUT.PUT_LIKE(V_CUSTID || ',' || V_NAME
                          || ',' || V_ADDRESS || ',' || V_PHONE);
END;
------------------------------------------
--프로시저 실행: EXCUTE 프로시저명
EXECUTE GET_CUSTOMER(1);


--==========================================
/*(�ǽ�)���ν��� �ۼ��ϰ� �����ϱ�
�����̺�(SUSTOMER)�� �ִ� ������ ��ȸ ���ν��� �ۼ�
- ���ν����� : GET_CUSTINFO
- �Է¹޴� �� : ��ID
- ó�� : �Է¹��� ��ID�� �ش��ϴ� �����͸� ã�Ƽ� ȭ�����
- ����׸� : ��ID, ����, �ּ�, ��ȭ��ȣ
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
--���ν��� ����: EXCUTE ���ν�����
EXECUTE GET_CUSTOMER(1);


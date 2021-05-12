/* ��ȣ���� ��������(�����������)
- ���������� ���� ���������� ����ϰ�, ���������� ������� ���������� ���
- ���������� ���������� ���� ���ε� ���·� ����
************************/
SELECT O.ORDERID, O.CUSTID, O.BOOKID, 
       (SELECT NAME FROM CUSTOMER WHERE CUSTID = O.CUSTID) CUSTNAME,
       (SELECT BOOKNAME FROM BOOK WHERE BOOKID = O.BOOKID) BOOKNAME,
       O.SALEPRICE, O.ORDERDATE
  FROM ORDERS O
;  
---------------
--���ǻ纰�� ���ǻ纰 ��� �������ݺ��� ��� ���� ����� ���Ͻÿ�
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����';
SELECT AVG(PRICE) FROM BOOK WHERE PUBLISHER = '�½�����';
SELECT * FROM BOOK
 WHERE PUBLISHER = '�½�����'
   AND PRICE > (SELECT AVG(PRICE) FROM BOOK WHERE PUBLISHER = '�½�����')
;
SELECT * 
  FROM BOOK B
 WHERE B.PRICE > (SELECT AVG(PRICE) FROM BOOK WHERE PUBLISHER = B.PUBLISHER)
;  
-- ���ι�(JOIN��)
SELECT PUBLISHER, AVG(PRICE) AVG_PRICE
  FROM BOOK 
 GROUP BY PUBLISHER
;
-----
SELECT *
  FROM BOOK B,
       (SELECT PUBLISHER, AVG(PRICE) AVG_PRICE
          FROM BOOK 
         GROUP BY PUBLISHER
       ) AVG
 WHERE B.PUBLISHER = AVG.PUBLISHER  
   AND B.PRICE > AVG.AVG_PRICE
;
----------------------
--EXISTS : ���翩�� Ȯ�ν� ���(������ TRUE)
--NOT EXISTS : �������� ������ TRUE
SELECT * FROM BOOK WHERE BOOKNAME LIKE '%�౸%';
SELECT *
  FROM BOOK
 WHERE BOOKNAME IN (SELECT BOOKNAME FROM BOOK
                     WHERE BOOKNAME LIKE '%�౸%')
;
SELECT *
  FROM BOOK B
 WHERE EXISTS (SELECT BOOKNAME FROM BOOK
                WHERE B.BOOKNAME LIKE '%�౸%');
--------------
--�ֹ������� �ִ� ���� �̸��� ��ȭ��ȣ Ȯ��
SELECT *
  FROM CUSTOMER
 WHERE CUSTID IN (SELECT DISTINCT CUSTID FROM ORDERS)
;
-- ===> EXISTS ����
SELECT *
  FROM CUSTOMER C
 WHERE EXISTS (SELECT 1 FROM ORDERS
                WHERE CUSTID = C.CUSTID)
;
---NOT EXISTS
SELECT *
  FROM CUSTOMER C
 WHERE NOT EXISTS (SELECT 1 FROM ORDERS
                WHERE CUSTID = C.CUSTID)
;








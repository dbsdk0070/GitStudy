--�������� ������ å�� �հ�ݾ�
SELECT CUSTID FROM CUSTOMER WHERE NAME = '������'; --CUSTID:1
--���� ���� Ȯ��
SELECT * FROM ORDERS WHERE CUSTID = 1;

--��������(SUB QUERY) ���
SELECT * FROM ORDERS 
WHERE CUSTID = (SELECT CUSTID FROM CUSTOMER WHERE NAME = '������');
---------------------

--���̺� ����(JOIN) ���
SELECT * FROM CUSTOMER WHERE CUSTID = 1;
SELECT * FROM ORDERS WHERE CUSTID = 1;

--CUSTOMER, ORDERS ���̺� ������ ���� ��ȸ
SELECT *
FROM CUSTOMER, ORDERS
WHERE CUSTOMER.CUSTID = ORDERS.CUSTID --��������
AND CUSTOMER.NAME = '������' --ã������(WHERE)
;

--���̺� ��Ī ������� �����ϰ� ǥ���ϰ� ���
--WHERE�� �������� ��� - ����Ŭ �����
SELECT *
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID --��������
AND C.NAME = '������' --ã������(WHERE)
;
--ANSI ǥ�� ���� ����
SELECT *
FROM CUSTOMER C INNER JOIN ORDERS O --���ι�� ����
     ON C.CUSTID = O.CUSTID --�������� ����
WHERE C.NAME = '������' --�˻�����
;
-------------------
--�������� ������ å�� �հ�ݾ�
SELECT SUM(O.SALEPRICE) AS SUM_SALEPRICE
--SELECT *
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID
AND C.NAME = '������'
;
--���ε� �����Ϳ��� �÷���ȸ�� : ���̺��(��Ī).�÷��� ���·� ���
SELECT C.CUSTID --���� ���̺� ���� �÷��� �����ϴ� ��� ��ġ ���� �ʼ�
     , C.NAME, C.ADDRESS
     , O.CUSTID AS ORD_CUSTID --��ȸ�� �÷��� �ߺ��� ��Ī���� �ٸ��� ����
     , O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C, ORDERS O --������ ���̺�
WHERE C.CUSTID = O.CUSTID --���� ����
AND C.NAME = '������' --�˻� ����
;
--------------
SELECT * FROM BOOK;
SELECT * FROM ORDERS;
--������ å�� �Ǹŵ� å ���(�̵��� ������ ���ǻ�)
SELECT *
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID --��������
AND PUBLISHER LIKE '%�̵��'
--AND PUBLISHER = '�½�����'
ORDER BY B.PUBLISHER, B.BOOKNAME 
;
--==========================
--(�ǽ�) ���̺� ������ ���� ������ ã��
--1. '�߱��� ��Ź��'��� å�� �ȸ� ���� Ȯ��(å����, �Ǹűݾ�, �Ǹ�����)
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID --���� ����
AND B.BOOKNAME = '�߱��� ��Ź��'
;
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
FROM BOOK B INNER JOIN ORDERS O
     ON B.BOOKID = O.BOOKID
WHERE B.BOOKNAME = '�߱��� ��Ź��'
;

--2. '�߱��� ��Ź��'��� å�� �� ���� �ȷȴ��� Ȯ��
SELECT COUNT(*) AS CNT
--SELECT *
FROM BOOK B, ORDERS O
WHERE B.BOOKID = O.BOOKID
AND B.BOOKNAME = '�߱��� ��Ź��'
;
-----
--   CUSTOMER  ORDERS
--3. '�߽ż�'�� ������ å���� �������ڸ� Ȯ��(å��, ��������)
SELECT '�߽ż�' NAME, 
       O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID --��������
AND C.NAME = '�߽ż�'
;
SELECT '�߽ż�' NAME, 
       O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C INNER JOIN ORDERS O
     ON C.CUSTID = O.CUSTID --��������
WHERE C.NAME = '�߽ż�'
;
--4. '�߽ż�'�� ������ �հ�ݾ� Ȯ��
SELECT '�߽ż�' AS CUST_NAME, 
       SUM(O.SALEPRICE) SUM_PRICE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID --��������
AND C.NAME = '�߽ż�'
;
--5. ������, �߽ż��� ������ ������ Ȯ��(�̸�, �Ǹűݾ�, �Ǹ�����)
SELECT C.NAME, O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID 
AND (C.NAME = '������' OR C.NAME = '�߽ż�')
;

SELECT C.NAME, O.SALEPRICE, O.ORDERDATE
FROM CUSTOMER C, ORDERS O
WHERE C.CUSTID = O.CUSTID 
AND C.NAME IN ('������', '�߽ż�')
ORDER BY C.NAME, O.ORDERDATE
;
--==============================
--CUSTOMER, BOOK, OREDERS ���̺� ����
--����, å����, �ǸŰ���, �Ǹ�����(3�� ���̺� ����)
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID --��������
   AND O.CUSTID = C.CUSTID --��������
--   AND C.NAME = '������'
;
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE B.BOOKID = O.BOOKID  --��������
   AND O.CUSTID = C.CUSTID --��������
--   AND C.NAME = '������'
;
--ANSI ǥ�� SQL
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
  FROM ORDERS O 
       INNER JOIN BOOK B
       ON B.BOOKID = O.BOOKID  --��������
       INNER JOIN CUSTOMER C
       ON O.CUSTID = C.CUSTID --��������
 WHERE C.NAME = '������'
;
----------------------------
--(�ǽ�) BOOK, CUSTOMER, ORDERS ���̺� ������ ��ȸ
--1.��̶��� ������ å����, ���԰���, ��������, ���ǻ�
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE, B.PUBLISHER
--SELECT *
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID
   AND O.CUSTID = C.CUSTID
   AND C.NAME = '��̶�'
;

--2.��̶��� ������ å �߿� 2014-01-01 ~ 2014-07-08 ���� ������ ����
SELECT ORDERDATE, TO_CHAR(ORDERDATE, 'YYYY-MM-DD HH24:MI:SS')
  FROM ORDERS
; 
SELECT * FROM ORDERS WHERE ORDERDATE = '2014-07-01'; --�˻���
SELECT * FROM ORDERS WHERE ORDERDATE = '2014/07/01'; --�˻���
SELECT * FROM ORDERS WHERE ORDERDATE = '2014.07.01'; --�˻���
SELECT * FROM ORDERS WHERE ORDERDATE = '20140701'; --�˻���
--���� : ��¥ ������ ��ȸ�� ��¥Ÿ������ �����ؼ� ��ȸ�ؾ� �Ǽ��� ����
SELECT * FROM ORDERS WHERE ORDERDATE = TO_DATE('2014-07-01', 'YYYY-MM-DD');

SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE, B.PUBLISHER
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID
   AND O.CUSTID = C.CUSTID
   AND C.NAME = '��̶�'
   AND O.ORDERDATE >= TO_DATE('2014-01-01', 'YYYY-MM-DD')
   AND O.ORDERDATE < TO_DATE('2014-07-09', 'YYYY-MM-DD')--�ð��� �־ �˻�OK
;
SELECT B.BOOKNAME, O.SALEPRICE, O.ORDERDATE, B.PUBLISHER
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID
   AND O.CUSTID = C.CUSTID
   AND C.NAME = '��̶�'
   AND O.ORDERDATE BETWEEN TO_DATE('20140101', 'YYYYMMDD')
                       AND TO_DATE('2014/07/08', 'YYYY/MM/DD')
;

--3.'�߱��� ��Ź��'��� å�� ������ ����� �������ڸ� Ȯ��
SELECT B.BOOKNAME, C.NAME, O.ORDERDATE
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID -- ��������
   AND B.BOOKNAME = '�߱��� ��Ź��'
;

--4.�߽ż�, ��̶��� ������ å����, ���Աݾ�, �������� Ȯ��
----(���� : ����, �������� ������)
SELECT C.NAME, B.BOOKNAME, O.SALEPRICE, O.ORDERDATE
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID -- ��������
   AND C.NAME IN ('�߽ż�', '��̶�')
 ORDER BY C.NAME, O.ORDERDATE   
;
--5.�߽ż��� ������ å����,�հ�ݾ�,��հ�,������å�ݾ�, �����å�ݾ�
SELECT C.NAME, COUNT(*), SUM(O.SALEPRICE), ROUND(AVG(O.SALEPRICE)),
       MAX(O.SALEPRICE), MIN(O.SALEPRICE)
  FROM ORDERS O, BOOK B, CUSTOMER C
 WHERE O.BOOKID = B.BOOKID AND O.CUSTID = C.CUSTID -- ��������
 GROUP BY C.NAME
--   AND C.NAME = '�߽ż�'
;





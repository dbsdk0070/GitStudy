/* �����Լ� : ����Ŭ DBMS���� �����ϴ� �Լ�(FUNCTION)
�׷��Լ� : �ϳ� �̻��� ���� �׷����� ��� ����
COUNT(*) : ������ ���� ��ȸ(��ü �÷��� ���Ͽ�)
COUNT(�÷���) : ������ ���� ��ȸ(������ �÷��� �������)
SUM(�÷���) : �հ谪 ���ϱ�
AVG(�÷���) : ��հ� ���ϱ�
MAX(�÷���) : �ִ밪 ���ϱ�
MIN(�÷���) : �ּҰ� ���ϱ�
******************************/
SELECT COUNT(*) FROM BOOK; --���̺� ������ �Ǽ� Ȯ��

SELECT * FROM CUSTOMER; --����Ÿ �Ǽ� 5��
SELECT COUNT(*) FROM CUSTOMER; --5 �� Ȯ��
SELECT COUNT(NAME) FROM CUSTOMER; --5 �� Ȯ��
SELECT COUNT(PHONE) FROM CUSTOMER;--4 �� Ȯ��: NULL ���ܵ�
---------------
--SUM(�÷���) : �հ谪 ���ϱ�
SELECT * FROM BOOK;
SELECT SUM(PRICE) FROM BOOK; --144500
--���ѹ̵��, �̻�̵�� ���ǻ翡�� ������ å �ݾ� �հ�
SELECT SUM(PRICE) 
--SELECT *
FROM BOOK
WHERE PUBLISHER IN ('���ѹ̵��', '�̻�̵��') --90000
;
----
--AVG(�÷���) : ��հ� ���ϱ�
SELECT AVG(PRICE) FROM BOOK; --14450
SELECT AVG(PRICE)
--SELECT *
FROM BOOK
WHERE PUBLISHER IN ('���ѹ̵��', '�̻�̵��') --22500
;
--MAX(�÷���) : �ִ밪 ���ϱ�
--MIN(�÷���) : �ּҰ� ���ϱ�
SELECT * FROM BOOK;
SELECT MAX(PRICE), MIN(PRICE) FROM BOOK;
--(�ǽ�)�½����� ������ å�� �ְ�, ������ ���ϱ�
SELECT MAX(PRICE), MIN(PRICE) FROM BOOK
WHERE PUBLISHER = '�½�����'
;

--(�ǽ�)���ǵ� å�� ����, �հ�ݾ�, ��հ�, �ְ�, ������
SELECT COUNT(*), SUM(PRICE), AVG(PRICE), MAX(PRICE), MIN(PRICE)
FROM BOOK;
--==========================
--(�ǽ�����)
--1. ���ǵ� å ��ü ��ȸ(����: ���ǻ�, �ݾ׼�)
SELECT * FROM BOOK ORDER BY publisher, price;
SELECT BOOKNAME, PRICE FROM BOOK ORDER BY publisher, price;

--2. �½��������� ������ å�� å���� ������ ��ȸ
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����'
 ORDER BY BOOKNAME;

--3. ���ǵ� å �� 10000�� �̻��� å(���ݼ� - ū�ݾ׺���)
SELECT * FROM BOOK WHERE PRICE >= 10000
ORDER BY PRICE DESC;

--4. �������� �� ���ž�(CUSTID = 1)
SELECT CUSTID, NAME FROM CUSTOMER WHERE NAME = '������'; -- CUSTID: 1
SELECT * FROM ORDERS WHERE CUSTID = 1;
SELECT SUM(SALEPRICE) FROM ORDERS WHERE CUSTID = 1; --39000

--5. �������� ������ ������ ��(COUNT)
SELECT COUNT(*) FROM ORDERS WHERE CUSTID = 1;
SELECT COUNT(ORDERID) FROM ORDERS WHERE CUSTID = 1;

--6. ���� '��'���� ���� �̸� �ּ�
SELECT NAME, ADDRESS FROM CUSTOMER WHERE NAME LIKE '��%';

--7. ���� '��'���̰� �̸��� '��'���� ������ ���� �̸� �ּ�
SELECT NAME, ADDRESS FROM CUSTOMER WHERE NAME LIKE '��%��';

--8. å ������ '�߱�' ���� '�౸' ������ �˻�
----(��, '����' ���õ����� �����ϰ� å�������� ����)
SELECT * FROM BOOK
 WHERE BOOKNAME BETWEEN '�߱�' AND '�౸'
   AND BOOKNAME NOT LIKE '%����%' 
 ORDER BY BOOKNAME
;




/* *********************************
<�ε��� - INDEX>
���̺� �ִ� ������(�ο�, ���ڵ�)�� ������ ã�� ���� ������� ������ ����
- �ڵ��ε��� : PRIMARY KEY ����� �Ǵ� UNIQUE �������� ������ �����Ǵ� �ε���
- �����ε��� : CREATE INDEX ��ɹ��� ����ؼ� ����� �ε���

<�ε��� ������ �������>
-- [�ε��� ����� ����]
-�ε����� WHERE���� ���� ���Ǵ� �÷��� ����
-�������ǿ� ���� ���Ǵ� �÷��� ����
-�÷��� ������ �������� ���� �� ȿ�� ����(10~15%)
-�ε����� �⺻������ ������ �Ǿ��־(��������) �����͸� �� �� ������ ã�� �� ���� 

-- [�ε��� ���� �������]
-���� ���̺� �ε����� �ʹ� ���Ƶ� �ӵ� ���� ���� �߻�(���̺�� 4~5����)
-�÷��� �����Ͱ� ����(�Է�,����,����)�Ǵ� ��찡 ������ �ε��� ��뷮 ����
--(������ �Է�, ����, ������ �ε����� ���� �Է�, ����, ���� �۾� �߻�)

<�ε��� ���� ����>
CREATE INDEX �ε����� ON ���̺�� (�÷���1[, �÷���2, ..., �÷���n]); -- �ε����� �⺻������ �������� ������ �Ǿ�����
CREATE [UNIQUE] INDEX ON ���̺�� (�÷���1 [ASC|DESC], �÷���2, .., �÷���n);

<�ε��� ���� ����>
ALTER [UNIQUE] INDEX �ε����� ON ���̺�� (�÷���1[, �÷���2, ..., �÷���n]);

<�ε��� ���� ����>
DROP INDEX �ε�����;

<�ε��� �籸�� ����>
ALTER INDEX �ε����� REBUILD;
ALTER [UNIQUE] INDEX �ε����� [ON ���̺�� (�÷���, ...)] REBUILD;
************************************/

--�ε��� ���� : BOOK ���̺��� ���ǻ�(PUBLISHER)�÷��� IX_BOOK �ε��� �����
CREATE INDEX IX_BOOK ON BOOK (PUBLISHER);
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����';  --�ε����� �ְų� ���ų� ����� �Ȱ��� �׷��� �ε����� ����� 
                                                 -- �ڵ����� �����̵Ǳ� ������ �����͸� �� �� ������ ã�� �� ����
SELECT PUBLISHER, BOOKID FROM BOOK ORDER BY PUBLISHER ASC;
SELECT * FROM BOOK WHERE BOOKNAME = '�౸�� ����'; -- �ε����� ������ ������ �ǰ��� ��ȸ�ؾߵ� 1000���� . . . �̻��� �� �����ɸ��ϱ�

--�ε��� ���� : 2�� �÷� ����
--BOOK ���̺��� PUBLISHER, PRICE �÷��� ������� IX_BOOK2
CREATE INDEX IX_BOOK2 ON BOOK (PUBLISHER, PRICE);
--DROP INDEX IX_BOOK2;
SELECT PUBLISHER, PRICE FROM BOOK ORDER BY PUBLISHER, PRICE;

SELECT * FROM BOOK WHERE PUBLISHER = '���ѹ̵��';
SELECT * FROM BOOK WHERE PRICE > 10000;
-- DROP INDEX IX_BOOK;

--WHERE ������ PUBLISHER, PRICE ���� ���� IX_BOOK2 �ε��� ����
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����' AND PRICE = 7000;
SELECT * FROM BOOK WHERE PRICE = 7000 AND PUBLISHER = '�½�����';
-- �� ���� SQL ������ ����� ���� 

--�ε����� �ִµ� ����� �ȵǴ� ���
--LIKE ������ ��� �Ұ��������� '����%' ó�� % ���ڿ��� �ڿ� ������ �ε��� ����� �����ϴ�
SELECT * FROM BOOK WHERE PUBLISHER LIKE '����%'; --�ε��� ��� ����
SELECT * FROM BOOK WHERE PUBLISHER LIKE '%����%'; --�ε��� ��� �Ұ���(�տ� %���ڰ� ������ X) FULL SCAN : �ε��� ��� �ȵȰ��� / �ε��� �������(��ü��)
SELECT * FROM BOOK WHERE PUBLISHER LIKE '%����'; --�ε��� �������(��ü��)

--���� �����͸� �����ϴ� ���(�ε��� ���� �ȵ�)
--SUBSTR (�÷���, 1, 2) = '����' : ���� �ڸ���
SELECT * FROM BOOK WHERE SUBSTR(PUBLISHER,1,2) = '����';

--�ε��� ���� (DROP)
DROP INDEX IX_BOOK2;

/* *** �ε��� �ǽ� ****************************
���缭�� �����ͺ��̽����� ���� SQL ���� �����ϰ� 
�����ͺ��̽��� �ε����� ����ϴ� ������ Ȯ���Ͻÿ�.
**********************************************/

--(1) ���� SQL ���� �����غ���.
SELECT name FROM Customer WHERE name LIKE '�ڼ���';
    
--(2) ���� ��ȹ�� ���캻��. ���� ��ȹ�� [F10]Ű�� ���� �� 
--[��ȹ ����]���� �����ϸ� ǥ�õȴ�.
--(3) Customer ���̺� name���� �ε���(ix_customber_name)�� �����Ͻÿ�.
CREATE INDEX IX_CUSTOMER_NAME ON Customer(NAME);
--���� �� (1)���� ���Ǹ� �ٽ� �����ϰ� ���� ��ȹ�� ���캸�ÿ�.
--(4) ���� ���ǿ� ���� �� ���� ���� ��ȹ�� ���غ��ÿ�.
--(5) (3)������ ������ �ε����� �����Ͻÿ�.
DROP INDEX IX_CUSTOMER_NAME;








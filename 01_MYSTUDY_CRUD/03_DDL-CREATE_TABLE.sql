/* *************************
����Ÿ ���Ǿ�
- DDL(Data Definition Language) : ����Ÿ�� �����ϴ� ���
- CREATE(����), DROP(����), ALTER(����)
- {}�ݺ�����, []��������, | �Ǵ�(����)
CREATE TABLE ���̺�� (
{�÷��� ����ŸŸ��
    [NOT NULL | UNIQUE | DEFAULT �⺻�� | CHECK üũ����]
}
    [PRIMARY KEY]
    {[FOREIGN KEY �÷��� REFERENCES ���̺��(�÷���)]
    [ON DELETE [CASCADE | SET NULL]
    }
);
--------
�÷��� �⺻ ����Ÿ Ÿ��
VARCHAR2(n) : ���ڿ� ��������
CHAR(n) : ���ڿ� ��������
NUMBER(p, s) : ����Ÿ�� p:��ü����, s:�Ҽ������� �ڸ���
  ��) (5,2) : ������ 3�ڸ�, �Ҽ��� 2�ڸ� - ��ü 5�ڸ�
DATE : ��¥�� ��,��,�� �ð� �� ����

���ڿ� ó�� : UTF-8 ���·� ����
- ����, ���ĺ� ����, Ư������ : 1 byte ó��(Ű���� ���� ���ڵ�)
- �ѱ� : 3 byte ó��
***************************/
CREATE TABLE MEMBER (
    ID VARCHAR2(20) PRIMARY KEY, --NOT NULL + UNIQUE
    NAME VARCHAR2(30) NOT NULL,
    PASSWORD VARCHAR2(20) NOT NULL,
    PHONE VARCHAR2(20),
    ADDRESS VARCHAR2(300)
);
-------------------------
INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG', 'ȫ�浿', '1234');

INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', 'ȫ�浿', '1234');

--unique �����÷� �ߺ� ����Ÿ �Է½� ���� �߻�
--ORA-00001: unique constraint (MYSTUDY.SYS_C006999) violated
INSERT INTO MEMBER (ID, NAME, PASSWORD)
VALUES ('HONG2', 'ȫ�浿', '1234');
------------------------------------------
SELECT * FROM MEMBER;

--�Է� : �÷����� ��������� �ۼ����� ���� ��� ��� �÷��� �Է� �ʼ�
-- ���̺� �ִ� �÷��� ������ �°� ������ �Է�
INSERT INTO MEMBER
VALUES ('HONG5', 'ȫ�浿5', '1234', '010-1111-1111', '�����');

--�Ǽ� : ��ȭ��ȣ ��ġ�� �߸��ؼ� �ּҰ� �Է��� ��� 
INSERT INTO MEMBER
VALUES ('HONG6', 'ȫ�浿6', '1234', '�����', '010-1111-1111');
-----------------------------------------
INSERT INTO MEMBER (ID, NAME, PASSWORD, PHONE, ADDRESS)
VALUES ('HONG7', 'ȫ�浿7', '7777', '010-7777-7777', '�λ��');
COMMIT;

SELECT * FROM MEMBER WHERE ID = 'HONG6';
--------------------------
--���� : HONG6 ��ȭ��ȣ - 010-6666-6666 ����
--���� : HONG6 �ּ� '�����'�� ����
UPDATE MEMBER SET PHONE = '010-6666-6666' WHERE ID = 'HONG6';
UPDATE MEMBER SET ADDRESS = '�����' WHERE ID = 'HONG6';
UPDATE MEMBER 
   SET PHONE = '010-6666-6666',
       ADDRESS = '�����'
 WHERE ID = 'HONG6';
----------------------------
--���� : HONG7 ������ ����
--���� : �̸��� ȫ�浿�� ��� ����
DELETE FROM MEMBER WHERE ID = 'HONG7';
SELECT * FROM MEMBER;
SELECT * FROM MEMBER WHERE NAME = 'ȫ�浿';
SELECT COUNT(*) FROM MEMBER WHERE NAME = 'ȫ�浿';
DELETE FROM MEMBER WHERE NAME = 'ȫ�浿';
-----------------------
/* (�ǽ�) CRUD - �Է�,��ȸ,����,����
�Է� : ���̵�-hong8, �̸�-ȫ�浿8, ��ȣ-1111, �ּ�-����� ���ʱ�
��ȸ(�˻�) : �̸��� 'ȫ�浿8'�� ����� ���̵�, �̸�, �ּ� �����͸� ��ȸ
���� : ���̵� hong8 ����� 
    ��ȭ��ȣ : 010-8888-8888
    ��ȣ : 8888
    �ּ� : ����� ������
���� : ���̵� hong8 �� ���
******************************/
INSERT INTO MEMBER (ID, NAME, PASSWORD, ADDRESS)
VALUES ('hong8', 'ȫ�浿8', '1111', '����� ���ʱ�');
SELECT * FROM MEMBER WHERE ID = 'hong8';
SELECT ID, NAME, ADDRESS FROM MEMBER WHERE ID = 'hong8';

UPDATE MEMBER
SET PHONE = '010-8888-8888',
    PASSWORD = '8888',
    ADDRESS = '����� ������'
WHERE ID = 'hong8';

DELETE FROM MEMBER WHERE ID = 'hong8';
commit;

--=============================
--�÷� Ư���� Ȯ���ϱ� ���� ���̺�
CREATE TABLE TEST (
    NUM NUMBER(5,2), --��ü�ڸ��� 5, ������ 3, �Ҽ��� 2�ڸ�
    STR1 CHAR(10), --��������
    STR2 VARCHAR2(10), --��������
    DATE1 DATE --��¥����Ÿ : ����Ͻú���
);
INSERT INTO TEST VALUES (100.454, 'ABC', 'ABC', SYSDATE);
INSERT INTO TEST VALUES (100.455, 'ABC', 'ABC', SYSDATE);
INSERT INTO TEST VALUES (100.456, 'ABC', 'ABC', SYSDATE);
SELECT * FROM TEST;
SELECT '-' || STR1 || '-', '-' ||STR2|| '-' FROM TEST;
INSERT INTO TEST VALUES (100.456, 'DEF', 'DEF ', SYSDATE);
SELECT LENGTHB(STR1), LENGTHB(STR2) FROM TEST;

-----------------------------------------------
SELECT * FROM TEST WHERE NUM = 100.45; --���� VS ����
SELECT * FROM TEST WHERE NUM = '100.45'; --���� VS ����(����ŬOK)
SELECT * FROM TEST WHERE NUM = '100.45A'; --���� VS ����(ORA-01722: invalid number)
------------------------------------
--��¥Ÿ�� DATE�� ���ο� ����Ͻú��� ������ ����
SELECT DATE1, TO_CHAR(DATE1, 'YYYY-MM-DD HH24:MI:SS') FROM TEST;

--�ѱ۵����� : 3 byte, ASCII�ڵ� : 1 byte
SELECT * FROM TEST;
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', 'ABCDEFGHIJ');
--�ѱ� 4���� * 3BYTE = 12 : ORA-12899: value too large for column
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', '���ѹα�');
INSERT INTO TEST (STR1, STR2) VALUES ('ABCDEFGHIJ', 'ȫ�浿');
--=====================================
--NULL(��) : �����Ͱ� ���� ����
--NULL�� ��ó���� �ȵ� : =, <>,!=, >, <, >=, <= ��ó�� �ǹ� ����
--NULL ���� ���� ����� �׻� NULL(�����ǹ� ����)
--NULL ���� ���� ��ȸ�� IS NULL, IS NOT NULL Ű����� ó��
----
SELECT * FROM TEST WHERE NUM = NULL; --��ȸ�ȵ�(NULL �񱳿��� �ǹ̾���)
SELECT * FROM TEST WHERE NUM IS NULL;
SELECT * FROM TEST WHERE NUM <> NULL; --��ȸ�ȵ�: <>, != : �����ʴ�(�ٸ���)
SELECT * FROM TEST WHERE NUM IS NOT NULL;
--------------------
--NULL ���� ���� ó�� ���
SELECT * FROM DUAL; --DUAL : DUMMY ���̺� �÷�1��, ������ 1��
SELECT 100 + 200, 111 + 222 FROM DUAL;
SELECT NUM, NUM + 100 FROM TEST; --NULL ���� �������� �׻� NULL
---------------
--���� NULL
SELECT * FROM TEST ORDER BY STR2; --�⺻ ������������, ASC Ű���� ���� ����
SELECT * FROM TEST ORDER BY STR2 DESC; --DESC : �������� ����
-- ���Ľ� ����Ŭ������ NULL ���� ���� ū ������ ó��(�Ǹ����� ���)
-- NULL���� ��ȸ ���� ���� : NULLS FIRST, NULLS LAST
SELECT * FROM TEST ORDER BY NUM;
SELECT * FROM TEST ORDER BY NUM DESC;
SELECT * FROM TEST ORDER BY NUM NULLS FIRST; --NULL���� �տ�ǥ��
SELECT * FROM TEST ORDER BY NUM DESC NULLS LAST; --NULL���� �� �ڷ�
-- NULL �� ó��
SELECT NUM FROM TEST;
SELECT NUM, NUM + 10, NVL(NUM,0), NVL(NUM,0) + 10 FROM TEST;
------------------------
INSERT INTO TEST (NUM, STR1, STR2) VALUES (200, '', NULL);
SELECT * FROM TEST WHERE STR1 = ''; --������ ��ȸ �ȵ�
--------------
--DDL
--���� : CREATE
--���� : ALTER
--���� : DROP



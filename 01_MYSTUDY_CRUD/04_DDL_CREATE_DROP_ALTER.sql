/*(�ǽ�) ���̺�(TABLE) �����(���̺��: TEST2)
    NO : ����Ÿ�� 5�ڸ�, PRIMARY KEY  ����
    ID : ����Ÿ�� 10�ڸ�(����10�ڸ�), ���� �ݵ�� ����(NULL ������)
    NAME : �ѱ� 10���ڱ��� ���尡���ϰ� ����, ���� �ݵ�� ����
    EMAIL : ����,����,Ư������ ���� 30�ڸ�
    ADDRESS : �ѱ� 100��
    IDNUM : ����Ÿ�� ������ 7�ڸ�, �Ҽ��� 3�ڸ�(1234567.123)
    REGDATE : ��¥Ÿ��
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
VALUES (11111, 'TEST1', 'ȫ�浿1', 'test1@test.com',
       '����� ������', 1234567.123, sysdate);
INSERT INTO TEST2 (NO, ID, NAME)
VALUES (22, 'TEST2', 'ȫ�浿2');
INSERT INTO TEST2 (NO, NAME, ID)
VALUES (33, 'ȫ�浿3', 'TEST3');
COMMIT;
--===========================
-- Ư�� ���̺��� �����Ϳ� �Բ� ���̺� ������ �Բ� ����
CREATE TABLE TEST3
AS
SELECT * FROM TEST2;
--
SELECT * FROM TEST2;
SELECT * FROM TEST3;
----------------------
--Ư�� ���̺��� Ư���÷��� Ư�� �����͸� �����ϸ鼭 ���̺� ����
CREATE TABLE TEST4
AS
SELECT NO, ID, NAME, EMAIL FROM TEST2 WHERE NO = 11111;
-------
--Ư�� ���̺��� ������ ����(����Ÿ�� �������� ����)
CREATE TABLE TEST5
AS 
SELECT * FROM TEST2 WHERE 1 = 2;
--==================
SELECT * FROM TEST2;
DELETE FROM TEST2 WHERE ID = 'TEST3';
DELETE FROM TEST2; --���̺� ��ü������ ����
ROLLBACK; --��� ó�� ����

--TRUNCATE ��ɹ� : ���̺� ��ü ������ ����(ROLLBACK ���� �ȵ�)
TRUNCATE TABLE TEST2;
SELECT * FROM TEST2;
/* ���̺��� ���� : DROP TABLE - �����Ϳ� �Բ� ���̺��� ��� ����ó��
    DROP TABLE ������.���̺��;
    drop table ������.���̺�� cascade constraints PURGE
    - cascade constraints : ���������Ͱ� �־ ���� ó��
    - PURGE : �����뿡 ������� ������ ����
*/
DROP TABLE TEST2;
--==============================
/* ���̺� ���� : �÷� �߰�, ����, ����
DDL : ALTER TABLE
- ADD : �߰�
- MODIFY : ���� - ������ ���¿� ���� ���� ���ɿ��� ����
    --�ķ������� ���� -> ū : ������ ����
    --�÷������� ū -> ���� : ����� ������ ���¿� ���� �ٸ�
- DROP COLUMN : ����
**************************/
SELECT * FROM TEST3;
--�÷��߰� TEST3 ���̺� ADDCOL �÷� �߰�
ALTER TABLE TEST3 ADD ADDCOL VARCHAR2(10);

-- �÷����� TEST3 ���̺��� ADDCOL ũ�� -> VARCHAR2(20)
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(20);
UPDATE TEST3 SET ADDCOL = '123456789012345';
SELECT * FROM TEST3;

-- �÷����� TEST3 ���̺��� 
-- ADDCOL ũ�� -> VARCHAR2(10), VARCHAR2(15)
--���� : ORA-01441: cannot decrease column length because some value is too big
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(10); --�����߻�
ALTER TABLE TEST3 MODIFY ADDCOL VARCHAR2(15); --����ó����

--�÷� ���� : DROP COLUMN
ALTER TABLE TEST3 DROP COLUMN ADDCOL;
-------------------
alter table "MYSTUDY"."TEST3" rename to AAAA;
alter table AAAA rename to TEST3;
ALTER TABLE TEST3 RENAME COLUMN ADDCOL TO ADDCOL2;
ALTER TABLE TEST3 MODIFY (ADDCOL2 NOT NULL);


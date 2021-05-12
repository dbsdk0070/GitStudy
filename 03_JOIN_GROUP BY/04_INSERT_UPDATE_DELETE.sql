--INSERT, UPDATE, DELETE
/* *********************

�� INSERT ��
INSERT INTO ���̺��
       (�÷���1, �÷���2, ..., �÷���n)
VALUES (��1, ��2, ..., ��n);


�� UPDATE ��
UPDATE ���̺��
   SET �÷���1 = ��1, �÷���2 = ��2, ..., �÷���n = ��n
[WHERE �������]  


�� DELETE ��
DELETE FROM ���̺��
[WHERE �������]


**************************/
SELECT * FROM BOOK ORDER BY BOOKID DESC;
INSERT INTO BOOK
            (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (30, '�ڹٶ� �����ΰ�?', 'ITBOOK', 30000);
COMMIT;

INSERT INTO BOOK
            (BOOKID, BOOKNAME, PUBLISHER, PRICE)
VALUES (31, '�ڹٶ� �����ΰ�2?', 'ITBOOK', 30000);
ROLLBACK;
COMMIT;

/* INSERT : �÷����� �������� �ʰ� �Է�
-- ���̺� ������ �ۼ��� �÷��� ���� ��� �Է�(������ ����)
-- ���̺� ������ �ۼ��� �÷��� ������ ���� ������ �Է� �Է����� �ʴ� ���
   (�Է¼���) ���� ���� - �߸��� ��ġ�� ������ �Է�
************************************/
INSERT INTO BOOK
VALUES (32, '�ڹٶ� �����ΰ�3?');
COMMIT;






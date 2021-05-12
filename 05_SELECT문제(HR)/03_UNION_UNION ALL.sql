/* UNION, UNION ALL : 합집합 처리
--UNION : 중복데이터를 제거하고 하나만 표시형태로 합해줌
--UNION ALL : 중복데이터 포함해서 합해줌
단, 조회하는 컬럼의 이름, 순서, 갯수, 타입이 일치하도록 작성
    ORDER BY 절은 맨 마지막에 작성
****************************/
--UNION 사용예제
SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (1, 2, 3);

SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (3, 4, 5);

----UNION 으로 합하기(중복데이터 하나만 표시)
SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (1, 2, 3)
UNION
SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (3, 4, 5); 

-- UNION ALL 합하기(중복데이터 모두 사용)
SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (1, 2, 3)
UNION ALL
SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (3, 4, 5)
ORDER BY NAME --ORDER BY 절은 맨 마지막에 작성
; 
--------------------------------
--MINUS : 차집합(빼기 연산)
SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (1, 2, 3)
MINUS
SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (3, 4, 5); 

--------------------------- 
--INTERSECT : 교집합(중복데이터 조회) - 조인문의 동등비교 결과와 동일
SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (1, 2, 3)
INTERSECT
SELECT CUSTID, NAME FROM CUSTOMER
 WHERE CUSTID IN (3, 4, 5); 
---조인문(JOIN문)
SELECT A.*
  FROM (SELECT CUSTID, NAME FROM CUSTOMER
         WHERE CUSTID IN (1, 2, 3)) A,
       (SELECT CUSTID, NAME FROM CUSTOMER
         WHERE CUSTID IN (3, 4, 5)) B 
 WHERE A.CUSTID = B.CUSTID        
;         
 
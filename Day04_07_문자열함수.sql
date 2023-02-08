-- 문자열 함수


--1. 대소문자 변환 함수
SELECT
       UPPER(EMAIL)  -- 대문자로 변환하는 함수
     , LOWER(EMAIL)  -- 소문자로 변환하는 함수
     , INITCAP(EMAIL) -- 첫 글자는 대문자, 나머지는 소문자
  FROM
       EMPLOYEES;
       
--2. 글자 수(바이트 수) 반환 함수
SELECT
       LENGTH('HELLO')  -- 글자 수   : 5글자
     , LENGTH('안녕')   -- 글자 수   : 2글자
     , LENGTHB('HELLO') -- 바이트 수 : 5바이트
     , LENGTHB('안녕') -- 바이트 수 : 6바이트
  FROM
       DUAL;
       
--3. 문자열 연결 함수/ 연산자
--   1) 함수   :  CONCAT(A,B) 주의! 인수가 2개만 전달 가능히다.(CONCAT(A, B, C) 같은 형태는 불가능하다.)
--   2) 연산자 : || 주의! OR 연산 아닙니다!!!오라클 전용으로만 사용!
SELECT
       CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME)
     , FIRST_NAME || ' ' || LAST_NAME
  FROM
       EMPLOYEES;


--4. 문자열 일부 반환하기
--   SUBSTR(칼럼, BEGIN, LENGTH) : BEGIN부터 LENGTH 개를 반환
--   주의!BEGIN은 1에서 시작한다.
SELECT
       SUBSTR(EMAIL, 1 , 3)  -- 1번째 글자부터 3글자를 가져오시오.
  FROM
       EMPLOYEES;
       
--5. 특정 문자열의 위치 반환하기
--   INSTR(칼럼, 찾을문자열)
--   주의! 반환되는 위치 정보는 인덱스가 아니므로 0부터 시작하지 않고, 1부터 시작한다.
--   못 찾으면 0을 반환한다.
SELECT 
       INSTR(EMAIL, 'A')   -- 'A'의 위치를 반환
  FROM
       EMPLOYEES;
       
--6. 문자열 채우기(PADDING)
--왼쪽부터 채우기     1) LPAD(칼럼, 전체폭, 체울문자)
--오른쪽부터 채우기   2) RPAD(칼럼, 전체폭, 체울문자)
SELECT
      LPAD(NVL(DEPARTMENT_ID, 0), 3, '0')
    , RPAD(SUBSTR(EMAIL, 1 , 2), 5, '*')   
    
  FROM
       EMPLOYEES;
       
       
--7. 불필요한 공백 제거
--   1) LTRIM(칼럼) --왼쪽에 불필요한 공백을 제거하시오.
--   2) RTRIM(칼럼) --오른쪽에 불필요한 공백을 제거하시오.
--   3) TRIM (칼럼) -- 왼쪽, 오른쪽 공백 모두 제거
SELECT
       '['|| LTRIM('     HELLO') ||']'
     , '['|| RTRIM('HELLO     ') ||']'  
     , '['|| TRIM ('   HELLO  ') ||']'
  FROM
       DUAL;
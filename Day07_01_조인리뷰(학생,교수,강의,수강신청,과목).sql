--연습문제1. 학생 이름,담당 교수 이름 조회하기
-- 기본문법
SELECT S.S_NAME, P.P_NAME
  FROM PROFESSOR_TBL P INNER JOIN STUDENT_TBL S
    ON P.P_NO = S.P_NO;

-- 오라클 문법
    SELECT S.S_NAME, P.P_NAME
    FROM PROFESSOR_TBL P, STUDENT_TBL S
    WHERE P.P_NO = S.P_NO;
    
--연습문제2. 교수 번호,교수이름,교수전공,강의이름,강의실위치를 조회하시오.  

--기본문법
SELECT P.P_NO, P.P_NAME, P_MAJOR, L.L_NAME, L.L_LOCATION
  FROM PROFESSOR_TBL P INNER JOIN LECTURE_TBL L 
    ON P.P_NO = L.P_NO;
    
-- 오라클문법
SELECT P.P_NO, P.P_NAME,P_MAJOR,L.L_NAME,L.L_LOCATION
  FROM PROFESSOR_TBL P , LECTURE_TBL L 
 WHERE P.P_NO = L.P_NO;     
 
 
-- 연습문제3. 학번, 학생이름, 수강 신청한 과목 이름을 조회하시오.(3개 테이블 조인)
-- 기본 문법
SELECT S.S_NO, S.S_NAME, C.C_NAME
  FROM STUDENT_TBL S INNER JOIN ENROLL_TBL E
    ON S.S_NO = E.S_NO INNER JOIN COURSE_TBL C
    ON E.C_NO = C.C_NO;
    
-- 오라클 문법
SELECT S.S_NO, S.S_NAME, C.C_NAME
  FROM STUDENT_TBL S , ENROLL_TBL E,COURSE_TBL C
 WHERE S.S_NO = E.S_NO 
   AND E.C_NO = C.C_NO;
   
-- 연습문제4. 모든 교수들의 교수이름, 교수전공, 강의이름을 조회하시오.(교수는 총 3명이다.)

-- 기본문법
SELECT P.P_NAME,P.P_MAJOR, L.L_NAME
  FROM PROFESSOR_TBL P LEFT OUTER JOIN  LECTURE_TBL L
    ON P.P_NO = L.P_NO;
  
-- 오라클 문법
SELECT P.P_NAME AS 교수이름 ,P.P_MAJOR AS 교수전공 , L.L_NAME AS강의이름 ,NVL(L.L_NAME,'강의없음')
 FROM PROFESSOR_TBL P ,  LECTURE_TBL L
 WHERE P.P_NO = L.P_NO(+);
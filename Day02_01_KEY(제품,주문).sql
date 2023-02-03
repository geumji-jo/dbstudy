/*
  KEY 제약조건
    1. 기본키(PK : PRIMARY KEY)
      1) 개체 무결성
      2) PK는 NOT NULL + UNIQUE 해야 한다.
    2. 외래키(FK :FOREIGN KEY)
      1) 참조무결성
      2) FK는 참조하는 값만 가질 수 잇다.
*/
    
/*
    일대다(1:M) 관계
    1. PK와 FK를 가진 테이블 간의 관계이다.
        1) 부모테이블 : 1, PK 를 가진 테이블
        2) 자식 테이블 : M,FK를 가진 테이블
    2. 생성과 삭제 규칙
        1) 생성 규칙 : "반드시" 부모 테이블을 먼저 생성한다.
        2) 삭제 규칙 : "반드시" 자식 테이블을 먼저 삭제한다.
*/

-- 제품 삭제
DROP TABLE ORDER_TBL;
DROP TABLE PRODUCT_TBL;

-- 제품 테이블(부모 테이블)
CREATE TABLE PRODUCT_TBL (
    PROD_NO NUMBER NOT NULL ,
    PROD_NAME VARCHAR2(10 BYTE),
    RROD_PRICE NUMBER,
    PROD_STOCK NUMBER,
    CONSTRAINT PK_PROD PRIMARY KEY(PROD_NO)
);
    
-- 주문 테이블(자식 테이블)
CREATE TABLE ORDER_TBL (
    ORDER_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(10 BYTE),
    PROD_NO NUMBER,
    ORDER_DATE DATE,
    CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_NO),
    CONSTRAINT FK_ORDER_PROD FOREIGN KEY(PROD_NO) REFERENCES PRODUCT_TBL(PROD_NO)
);    
        
/*
    제약조건 테이블( 오라클에 의해 만들어지고 관리되는 테이블)
    1. SYS, SYSTEM 관리 계정으로 접속해서 확인한다.
    2. 종류(앞에 종류_뒤에 대상)
        1) ALL_CONSTRAINTS(모든제약조건)
        2) USER_CONSTRAINTS(사용자제약조건)
        3) DBA_CONSTRAINTS(관리자제약조건)
*/

-- 테이블 구조를 확인하는 쿼리문 (설명) 
-- DESCRIBE ALL_CONSTRAINTS;
-- SELECT * FROM ALL_CONSTRAINTS  WHERE CONSTRAINT_NAME LIKE 'PK%';

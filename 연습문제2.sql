DROP TABLE ORDER_TBL;
DROP TABLE CUSTOMER_TBL;
DROP TABLE BOOK_TBL;

-- 1) BOOK_TBL 테이블
--    (1) BOOK_ID : 책번호, 숫자 (최대 11자리), 필수
--    (2) BOOK_NAME : 책이름, 가변 길이 문자 (최대 100 BYTE)
--    (3) PUBLISHER : 출판사, 가변 길이 문자 (최대 50 BYTE)
--    (4) PRICE : 가격, 숫자 (최대 6자리)
CREATE TABLE BOOK_TBL (
    BOOK_ID   NUMBER(11) NOT NULL,
    BOOK_NAME VARCHAR2(100 BYTE),
    PUBLISHER VARCHAR2(50 BYTE),
    PRICE     NUMBER(6)
);

-- 2) CUSTOMER_TBL 테이블
--    (1) CUSTOMER_ID : 고객번호, 숫자 (최대 11자리), 필수
--    (2) CUSTOMER_NAME : 고객명, 가변 길이 문자 (최대 20 BYTE)
--    (3) ADDRESS : 주소, 가변 길이 문자 (최대 50 BYTE)
--    (4) PHONE : 전화, 가변 길이 문자 (최대 20 BYTE)
CREATE TABLE CUSTOMER_TBL (
    CUSTOMER_ID   NUMBER(11) NOT NULL,
    CUSTOMER_NAME VARCHAR2(20 BYTE),
    ADDRESS       VARCHAR2(50 BYTE),
    PHONE         VARCHAR2(20 BYTE)
);

-- 3) ORDER_TBL 테이블
--    (1) ORDER_ID : 주문번호, 가변 길이 문자 (최대 20 바이트), 필수
--    (2) CUSTOMER_ID : 고객번호, 숫자 (최대 11자리)
--    (3) BOOK_ID : 책번호, 숫자 (최대 11자리)
--    (4) AMOUNT : 판매수량, 숫자 (최대 2자리)
--    (5) ORDER_DATE : 주문일, 날짜
CREATE TABLE ORDER_TBL (
    ORDER_ID    VARCHAR2(20 BYTE) NOT NULL,
    CUSTOMER_ID NUMBER(11),
    BOOK_ID     NUMBER(11),
    AMOUNT      NUMBER(2),
    ORDER_DATE  DATE
);

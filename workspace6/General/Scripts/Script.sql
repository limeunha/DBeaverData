--내가 실행시킬 쿼리문에 커서가 있는상태에서 ctrl+enter를 누르면 쿼리문 실행
--쿼리문은 대소문자 상관 X

select * from nls_database_parameters where parameter = 'NLS_CHARACTERSET';

--직원 테이블
CREATE TABLE emp (
	NO NUMBER,
	NAME VARCHAR2(20), --20바이트:영문자 기준으로 최대 20자까지 저장가능, 한글은 1자 = 3byte이므로 최대 6글자 저장가능
	AGE NUMBER
);

--고객 테이블
CREATE TABLE customer(
--PRIMARY KEY 테이블의 데이터를 구분하기 위한 컬럼에 지정, 컬럼의 값은 중복 X, 컬럼의 값은 not null
	id NUMBER PRIMARY KEY, --최대 38자리 까지 지정가능(소수점 포함)
	name varchar2(20) NOT NULL, --컬럼의 값에 null을 넣을 수 X
	address varchar2(100) --한글 최대 33자리
);

--주문 테이블
CREATE TABLE orders(
order_id NUMBER PRIMARY KEY,
salesman_id NUMBER,
order_date DATE NOT NULL
);



-- ALTER: 생성한 테이블의 컬럼 수정,  삭제, 추가

-- customer 테이블에 성별 컬럼 추가
ALTER TABLE CUSTOMER ADD gender varchar2(9);

-- 컬럼 이름 바꾸기
ALTER TABLE CUSTOMER RENAME COLUMN gender TO gen;
ALTER TABLE CUSTOMER RENAME COLUMN gen TO gender; --원복

-- 컬럼 크기 바꾸기
ALTER TABLE CUSTOMER MODIFY gender varchar2(100);
ALTER TABLE CUSTOMER MODIFY gender varchar2(100)  DEFAULT 'NONE' NOT NULL;

-- 컬럼 자료형/ 제약조건 바꾸기
ALTER TABLE CUSTOMER MODIFY gender NUMBER;
ALTER TABLE CUSTOMER MODIFY gender NUMBER NOT NULL;
ALTER TABLE CUSTOMER MODIFY gender NUMBER NOT NULL; -- NULL 허용

--컬럼에 설명 달기
COMMENT ON COLUMN customer.GENDER  IS '성별';

--컬럼 삭제
ALTER TABLE CUSTOMER DROP COLUMN name;
ALTER TABLE CUSTOMER DROP COLUMN address;
ALTER TABLE CUSTOMER DROP COLUMN gender;
--ALTER TABLE CUSTOMER DROP COLUMN id;

--테이블 삭제
DROP TABLE emp;

CREATE TABLE CATEGORIES (
CATEGORY_ID NUMBER,
CATEGORY_NAME VARCHAR2(100 BYTE)
);



DROP TABLE CATEGORIES;

CREATE TABLE CATEGORIES (
CATEGORY_ID NUMBER,
CATEGORY_NAME VARCHAR2(100 BYTE)
);


CREATE TABLE LOCATION(
LOCATION_ID NUMBER NOT NULL,
ADDRESS VARCHAR2(255 BYTE) NOT NULL,
POSTAL_CODE VARCHAR2(20 BYTE) NULL,
CITY VARCHAR2(50 BYTE) NULL
);

CREATE TABLE emp (
	NO NUMBER ,
	NAME VARCHAR2(20),
	AGE NUMBER
);
--퀴즈4. ORDERS 테이블에 VARCHAR2(50) 자료형이고 NOT NULL제약사항을 가진 CUSTOMER_NAME 컬럼을 추가하시오
ALTER TABLE ORDERS ADD CUSTOMER_NAME VARCHAR2(50) NOT NULL;

--퀴즈5. ORDERS 테이블의 SALESMAN_ID의 자료형을 VARCHAR2(50)로 변경하시오
ALTER TABLE ORDERS MODIFY saleman_id VARCHAR2(50);

--퀴즈6. ORDERS 테이블의 SALESMAN_ID 컬럼의 이름을 SALESMAN_NAME으로 변경하시오
ALTER TABLE ORDERS RENAME COLUMN saleman_id TO saleman_name;

--퀴즈7. ORDERS 테이블의 ORDER_DATE 컬럼에 NULL 제약조건을 적용하시오
ALTER TABLE ORDERS MODIFY order_date DATE NULL;

--퀴즈8. ORDERS 테이블의 모든 컬럼의 코멘트를 작성하시오
COMMENT ON COLUMN orders.ORDER_ID IS '주문아이디';
COMMENT ON COLUMN orders.SALEMAN_NAME IS '판매원이름';
COMMENT ON COLUMN orders.ORDER_DATE IS '주문날짜';
COMMENT ON COLUMN orders.CUSTOMER_NAME IS '고객이름';


DROP  TABLE CUSTOMER;
DROP  TABLE LOCATION;
DROP  TABLE EMP;
DROP  TABLE CATEGORIES;
DROP  TABLE ORDERS;




--퀴즈1. EMP 테이블에 NUMBER 자료형을 가진 SALARY 컬럼을 추가하시오
ALTER TABLE EMP ADD salary NUMBER;
--
--퀴즈2. EMP 테이블의 SALARY 컬럼에 NOT NULL 제약조건을 적용하시오
ALTER TABLE EMP MODIFY salary NOT NULL;
--
--퀴즈3. EMP 테이블의 모든 컬럼의 코멘트를 작성하시오
COMMENT ON COLUMN emp."NO" IS '직원번호';
COMMENT ON COLUMN emp.NANE"NO" IS '직원이름';
COMMENT ON COLUMN emp.AGE"NO" IS '직원나이';
COMMENT ON COLUMN emp.SALARY"NO" IS '급여';











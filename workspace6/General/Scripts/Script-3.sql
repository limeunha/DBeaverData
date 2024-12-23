-- 모든 데이터 조회
-- *: 모든 컬럼
SELECT * FROM CUSTOMER;

--특정 컬럼만 조회
SELECT NAME , ADDRESS FROM CUSTOMER;

--컬럼의 순서를 바꿔서 조회
SELECT NAME, ID, ADDRESS FROM CUSTOMER;

-- 순서대로 정렬해서 조회
SELECT * FROM CUSTOMER ORDER BY ID ASC; --오름차순 정렬
SELECT * FROM CUSTOMER ORDER BY ADDRESS;

--역정렬해서 조회
SELECT * FROM CUSTOMER ORDER BY ID DESC; --내림차순 정렬
SELECT * FROM CUSTOMER ORDER BY ADDRESS DESC;

SELECT  * FROM GIFT;

--gift 테이블에서 type 컬럼으로 그룹화(같은 컬럼값끼리 묶는다)
SELECT TYPE FROM gift GROUP BY TYPE; 

--group by 한 컬럼외에 다른 컬럼은 가져올 수 X
SELECT * FROM gift GROUP BY TYPE; 

--group by를 사용해 선물의 건수와 합계를 조회
SELECT  * FROM GIFT;
SELECT TYPE, COUNT(TYPE) AS cnt FROM GIFT GROUP BY TYPE; 
SELECT TYPE, COUNT(TYPE) AS 선물갯수 FROM GIFT GROUP BY TYPE; 

SELECT TYPE, COUNT(TYPE) cnt FROM GIFT GROUP BY TYPE;
SELECT TYPE, COUNT(TYPE) 선물갯수 FROM GIFT GROUP BY TYPE; 

-- 별칭에 공백이나 특수문자가 있을 경우 쌍따옴표 사용
SELECT TYPE, COUNT(TYPE) "선물갯수" FROM GIFT GROUP BY TYPE;


SELECT TYPE, SUM(PRICE) FROM GIFT GROUP BY TYPE; 


--where절 비교연산자
SELECT * FROM CUSTOMER WHERE ID = 1;
SELECT * FROM CUSTOMER WHERE ID > 1;
SELECT * FROM CUSTOMER WHERE ID < 4;
SELECT * FROM CUSTOMER WHERE ID >= 1;
SELECT * FROM CUSTOMER WHERE ID <= 4;
SELECT * FROM CUSTOMER WHERE ID != 1; --아이디가 1이아닌것을

--논리 연산자
SELECT * FROM CUSTOMER;


--name이 둘리이고, 주소가 서울인 데이터를 뽑아라
SELECT * FROM CUSTOMER WHERE NAME = '둘리' AND ADDRESS = '서울';

--주소가 인천이거나 서울인 데이터를 뽑아라
SELECT *FROM CUSTOMER WHERE ADDRESS = '인천' OR ADDRESS ='서울';

--주소가 서울이 아닌 데이터만 뽑아라
SELECT NAME, CUSTOMER WHERE NOT ADDRESS = '서울';

--산술 연산자(number, date타입의 컬럼에서 사용가능)
SELECT * FROM ORDERS;

SELECT ORDER_ID + (SALESMAN_ID * ORDER_ID) FROM ORDERS;
SELECT ORDER_ID / SALESMAN_ID FROM ORDERS;

--합성연산자(문자와 문자를 연결)
SELECT 'SQL' || '개발자' FROM dual; --dual은 test할때 많이 씀
SELECT '이름:' || NAME || '입니다.' AS intro FROM CUSTOMER;

--범위연산자
SELECT * FROM CUSTOMER;
SELECT * FROM CUSTOMER WHERE ID >=2 AND  ID <=4;
SELECT * FROM CUSTOMER WHERE ID BETWEEN 2 AND 4;
SELECT * FROM CUSTOMER WHERE ID NOT BETWEEN 2 AND 4;

--SELECT * FROM CUSTOMER WHERE ID =1 OR ID =2 OR ID =3;
SELECT * FROM CUSTOMER WHERE ID IN(1,2,3);
SELECT * FROM CUSTOMER WHERE ID NOT IN(1,2,3);

--패턴 연산자(LIKE) : 어떤 특정 문자를 포함해서 검색

-- '둘'로 시작하는 모든 이름으로 데이터 검색
SELECT * FROM CUSTOMER WHERE NAME LIKE '둘%';

--'길'을 포함한 이름을 가진 데이터 검색
SELECT * FROM CUSTOMER WHERE NAME LIKE '%길%';

--'치'로 끝나는 이름을 가진 데이터 검색
SELECT * FROM CUSTOMER WHERE NAME LIKE '%치';

--null값(빈값) 체크 연산자
SELECT * FROM CUSTOMER WHERE ADDRESS IS NULL;

SELECT * FROM CUSTOMER WHERE ADDRESS IS NOT NULL;







--퀴즈1. BOOK 테이블에서 가격이 11000원, 25000원 도서를 각각 찾으시오
SELECT * FROM BOOK WHERE PRICE = 11000;
SELECT * FROM BOOK WHERE PRICE = 25000;
--퀴즈2. BOOK 테이블에서 30000원 보다 비싼 도서를 찾으시오
SELECT * FROM BOOK WHERE PRICE  > 30000;
--퀴즈3. BOOK 테이블에서 10000이상 30000이하인 사이인 도서를 찾으시오
SELECT * FROM BOOK WHERE PRICE>=10000 AND PRICE  <= 30000;
--퀴즈4. BOOK 테이블에서 출판사가 한빛미디어 또는 생능출판인 도서를 찾으시오
WHERE PUBLISHER = '한빛미디어' OR PUBLISHER = '생능출판';
--퀴즈5. ORDERS 테이블에서 2022년 1월 2일 이후에 들어온 주문를 찾으시오
SELECT * FROM BOOK WHERE ORDERS_DATA = '2022-01-02';
--퀴즈6. ORDERS 테이블에서 2022년 1월 1일에 들어온 주문를 찾으시오
SELECT * FROM BOOK WHERE ORDERS_DATA = '2022-01-01';

 


SELECT * FROM BOOK;
--퀴즈1. BOOK 테이블에서 10000이상 30000이하인 사이인 도서를 찾으시오
SELECT * FROM BOOK WHERE PRICE BETWEEN 10000 AND 30000;
--퀴즈2. CONTACTS 테이블에서 김씨나 최씨 성을 가진 사람을 찾으시오
SELECT * FROM CONTACTS WHERE FIRST_NAME IN ('김','최');
--퀴즈3. GIFT 테이블에서 노트북, 벽걸이TV, 양쪽문냉장고를 찾으시오
SELECT * FROM GIFT WHERE NAME IN ('노트북', '벽걸이TV', '양쪽문냉장고');
--퀴즈4. GIFT 테이블에서 생활용품이거나 운동장비인 선물을 찾으시오
SELECT * FROM GIFT WHERE TYPE IN ('생활용품', '운동장비');
--퀴즈5. GIFT 테이블에서 가격이 300000원과 600000원 사이인 선물을 찾으시오
SELECT * FROM BOOK WHERE PRICE BETWEEN 300000 AND  600000;






SELECT * FROM CONTACTS;
--퀴즈1. CONTACTS 테이블에서 전화번호가 2341로 끝나는 사람을 찾으시오
SELECT * FROM CONTACTS WHERE PHONE LIKE '%2341';
--퀴즈2. CONTACTS 테이블에서 전화번호가 3171을 포함하는 사람을 찾으시오
SELECT * FROM CONTACTS WHERE PHONE LIKE '%3171%';
--퀴즈3. CONTACTS 테이블에서 이메일을 네이버를 사용하면서 전화번호가 없는 사람을 찾으시오
SELECT * FROM CONTACTS WHERE EMAIL LIKE '%@naver.com%' AND PHONE IS NULL ;
--퀴즈4. GIFT 테이블에서 이름에 용품이 포함된 선물을 찾으시오
SELECT * FROM GIFT WHERE NAME LIKE '%용품%';
--퀴즈5. GIFT 테이블에서 이름이 세트로 끝나면서 300000원이하인 선물을 찾으시오
SELECT * FROM GIFT WHERE NAME LIKE '%세트' AND PRICE <= 300000;


























































































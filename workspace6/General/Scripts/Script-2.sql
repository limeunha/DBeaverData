CREATE TABLE BOOK(
BOOK_NO NUMBER PRIMARY KEY,
TITLE VARCHAR2(100),
PUBLISHER VARCHAR2(100),
PRICE NUMBER
);

SELECT * FROM BOOK;

INSERT INTO BOOK(BOOK_NO,TITLE,PUBLISHER,PRICE)
VALUES(1, '역사1', '상상마당', '30000');

INSERT INTO BOOK VALUES(2, '역사2', '상상마당', '30000');
INSERT INTO BOOK VALUES(3, '스프링웹프로젝트', '한빛미디어', '50000');
INSERT INTO BOOK VALUES(4, '자바개발도서', '생능출판', '');

SELECT * FROM EMP;

INSERT INTO EMP VALUES(NULL,NULL,NULL);
INSERT INTO EMP VALUES(NO) VALUES(1);
INSERT INTO EMP (NAME,AGE) VALUES('둘리',10);
INSERT INTO EMP VALUES(1,'둘리',10);
INSERT INTO EMP VALUES(1,'둘리',10);

CREATE TABLE contacts(
contact_no NUMBER PRIMARY KEY,
FIRST_name varchar2(255),
LAST_name varchar2(255),
email varchar2(255),
phone varchar2(20)
);

INSERT INTO CONTACTS VALUES(1, '이', '서연', 'flor.stone@gmail.com', '010-3171-2341');

SELECT * FROM CONTACTS;


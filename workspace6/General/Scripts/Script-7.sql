--                                            테이블 생성, 추가, 삭제



-- ■ 1. EMP 테이블에서 부서별로 인원수, 평균, 급여, 급여의 합, 최소 급여, 최대 급여를 포함하는 EMP_DEPTNO 테이블을 생성하라. ■

CREATE TABLE EMP_DEPTNO( DEPNO, E_COUNT, E_AVG, E_SUM, E_MIN, E_MAX )
AS (
    SELECT DEPTNO, COUNT(DEPTNO), TRUNC(AVG(SAL), 3), SUM(SAL), MIN(SAL), MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO
);

SELECT * FROM EMP_DEPTNO;
  SELECT DEPARTMENT_ID DEPTNO, 
  COUNT(DEPARTMENT_ID), --부서별 직원수
  TRUNC(AVG(SALARY), 3),--부서별 평균 연봉
  SUM(SALARY), --부서별 연봉 합산
  MIN(SALARY), --부서에서 가장 작은 연봉
  MAX(SALARY) --부서에서 가장 높은 연봉
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID;
    
   SELECT DEPTNO, COUNT(DEPTNO), TRUNC(AVG(SAL), 3), SUM(SAL), MIN(SAL), MAX(SAL)
    FROM EMP
    GROUP BY DEPTNO;
    
   SELECT * FROM EMP;
   
  
  -- ■ 2. EMP_DEPTNO 테이블에 ETC COLUMN을 추가하라. 단 자료형은 VARCHAR2(50) 사용하라. ■
 	 SELECT * FROM EMP_DEPTNO;
  
  	ALTER TABLE EMP_DEPTNO ADD ETC VARCHAR2(50);
 
 
  -- ■ 3. EMP_DEPTNO 테이블에 ETC COLUMN을 수정하라. 자료형은 VARCHAR2(15)로 하라. ■
 	 ALTER TABLE EMP_DEPTNO MODIFY ETC VARCHAR2(15);


-- ■ 4. EMP_DEPTNO 테이블에 있는 ETC을 삭제하고 확인하라. ■
  	ALTER TABLE EMP_DEPTNO DROP COLUMN ETC;


-- ■ 5. 이전에 생성한 EMP_DEPTNO 테이블의 이름을 EMP_DEPT로 변경하라. ■

  RENAME EMP_DEPTNO TO EMP_DEPT;
 
  DESCRIBE EMP_DEPT;
-- ■ 6. EMP_DEPT 테이블을 삭제하라. ■
    DROP TABLE  EMP_DEPT;
  
   
   --                                          select 구문
   
   

-- ■ 1. emp 테이블에서 사원번호, 사원이름, 월급을 출력하시오. 
 	SELECT * FROM EMP;
   
	SELECT EMPNO,ENAME,SAL
	FROM EMP;

-- ■ 2. emp 테이블에서 사원이름과 월급을 출력하는데 컬럼명은 이 름, 월 급으로 바꿔서 출력하시오. 

	SELECT RENAME "이름", SAL "월급"
	FROM EMP;


-- ■ 3. emp 테이블에서 사원번호, 사원이름, 월급, 연봉을 구하고 각각 컬럼명은 사원번호, 사원이름, 월급, 연봉으로 출력하시오, 
	
	SELECT EMPNO "사원번호",ENAME "사원이름",SAL "월급", SAL*12 "연봉"
	FROM EMP;


-- ■ 4. emp 테이블  의 업무(job)를 중복되지 않게 표시하시오. 

	SELECT DISTINCT job
	FROM EMP;


-- ■ 5. emp 테이블의 사원명과 업무로 연결(SMITH, CHECK)해서 표시하고 컬럼명은 Employee and job으로 표시하시오. 
	SELECT * FROM EMP;

	SELECT ENAME || 'AND' || JOB AS  Employee and job
	FROM EMP
	WHERE ENAME ='SMITH' AND JOB= 'CHECK';
	


-- ■ 1. EMPLOYEES table의 모든 자료를 출력하라  

SELECT * FROM EMPLOYEES;


-- ■ 2. EMPLOYEES table의 컬럼들을 모두 출력하라.

DESCRIBE EMPLOYEES;




	--                                                    INSERT INTO 



-- ■ 3. EMPLOYEES에서 사원번호, 이름, 급여, 담당업무를 출력하라. 
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, LAST_NAME, SALARY,JOB_ID
FROM EMPLOYEES;

-- ■ 4. 모든 종업원의 급여를 $300증가 시키기 위해서 덧셈 연산자를 사용하고 결과에 SALARY+300 디스플레이 합니다. 

SELECT SALARY +300 AS "SALARY+300"
FROM EMPLOYEES;

-- ■ 5. EMP 테이블에서 사원번호, 이름, 급여, 보너스, 보너스 금액을 출력여라 (참고로 보너스는 월급 + (월급 * 커미션)) 
SELECT * FROM EMP;

SELECT EMPNO, ENAME, SAL, SAL+(SAL*COMM) AS "BONUS"
FROM EMP;


-- ■ 6. EMPLOYEES 테이블에서 LSAT_NAME을 이름으로 SALARY을 급여로 출력하여라. 
SELECT * FROM EMPLOYEES; 

SELECT LAST_NAME AS '이름' AND SALARY AS '급여'
FROM EMPLOYEES;


-- ■ 7. EMPLOYEES 테이블에서 LAST_NAME을 Name으로 SALARY*12를 Annual Salary(연봉)로 출력하여라.
SELECT LAST_NAME AS 'Name' , SALARY*12 AS "Annual Salary"
FROM EMPLOYEES;


-- ■ 8. EMPLOYEES 테이블에서 이름과 업무를 연결하여 출력하여라. 
SELECT LAST_NAME || '-' || JOB_ID AS "Name and Job"
FROM EMPLOYEES;

-- ■ 9. EMPLOYEES 테이블에서 이름과 업무를 "KING is a PRESIDENT" 형식으로 출력하여라. 
SELECT LAST_NAME || 'is a' || JOB_ID AS "KING IS A PRESIDENT"
FROM EMPLOYEES;


-- ■ 10. EMPLOYEES 테이블에서 이름과 연봉을 "KING: 1 Year salary = 60000" 형식으로 출력하여라. 
SELECT LAST_NAME || ': 1 Year salary ' || SALARY*12 AS "KING : 1 Year salary = 60000"
FROM EMPLOYEES;


-- ■ -- 11. EMPLOYESS 테이블에서 JOB을 모두 출력하라.

SELECT JOB
FROM EMPLOYEES;



--                                                        select 구문



-- ■ 1. EMPLOYEES 테이블에서 급여가 3000이상인 사원읜 정보를 사원번호, 이름, 담당업무, 급여를 출력하라. ■
SELECT EMPLOYEE_ID,LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY >= 3000;


-- ■ 2. EMPLOYEES 테이블에서 담당 업무가 ST_MAN 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라. ■
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, LAST_NAME,JOB_ID,SALARY
FROM EMPLOYEES
WHERE JOB_ID = 'ST_MAN';


-- ■ 3. EMPLOYEES 테이블에서 입사일자가 2006년 1월 1일 이후에 입사한 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. ■

SELECT  EMPLOYEE_ID,LAST_NAME,JOB_ID,SALARY,HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE =>'2006.01.01';


-- ■ 4. EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를 성명, 담당업무, 급여, 부서번호를 출력하라. ■
SELECT * FROM EMPLOYEES;

SELECT LAST_NAME, JOB_ID,SALARY,DEPARTMENT_ID 
FROM EMPLOYEES
WHERE SALARY BETWEEN 3000 AND 5000; 

-- ■ 5. EMPLOYEES 테이블에서 사원번호가 145, 152, 203 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자를 출력하라. ■

SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,DEPARTMENT_ID,SALARY,HIRE_DATE
FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (145,152,203);

-- ■ 6. EMPLOYEES 테이블에서 입사일자가 05년도에 입사한 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. ■
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,SALARY,HIRE_DATE,DEPARTMENT_ID
FROM EMPLOYEES
WHERE EXRACT( YEAR FROM HIRE_DATE) = '2005';

-- ■ 7. EMPLOYEES 테이블에서 보너스가 NULL인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 보너스, 부서번호를 출력하라. ■


SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,SALARY,HIRE_DATE,DEPARTMENT_ID,BONUS
FROM EMPLOYEES
WHERE BONUS IS NULL;


-- ■ 8. EMPLOYEES 테이블에서 급여가 1100이상이고 JOB이 ST_MAN 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. ■
SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,SALARY,HIRE_DATE,DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >=1100 AND JOB_ID = 'ST_MAN';


-- ■ 9. EMPLOYEES 테이블에서 급여가 10000이상이거나 JOB이 Manager 인 사원의 정보를 사원번호, 성명, 담당업무, 급여, 입사일자, 부서번호를 출력하라. ■
SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,SALARY,HIRE_DATE,DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY >=10000 OR JOB_ID = 'Manager';


-- ■ 10. EMPLOYEES 테이블에서 JOB이 ST_MAN, SA_MAN, SA_REP가 아닌 사원의 정보를 사원번호, 성명, 담당업무, 급여, 부서번호를 출력하라. ■
SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,SALARY,DEPARTMENT_ID
FROM EMPLOYEES
WHERE JOB_ID = NOT IN ('ST_MAN', 'SA_MAN', 'SA_REP');


-- ■ 11. 업무가 PRESIDENT(AD_PRES) 이고 급여가 12000이상이거나 업무가 SA_MAN인 사원의 정보를 사원번호, 이름, 업무, 급여를 출력하라. ■
SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,SALARY 
FROM EMPLOYEES
WHERE JOB_ID = 'AD_PRES' AND SALARY >=12000 OR JOB_ID ='SA_MAN';

-- ■ 12. 업무가 PRESIDENT(AD_PRES) 또는 SA_MAN 이고 급여가 12000이상이거나 사원의 정보를 사원번호, 이름, 업무, 급여를 출력하라. ■
SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,SALARY 
FROM EMPLOYEES
WHERE (JOB_ID = 'AD_PRES' OR JOB_ID='SA_MAN') AND SALARY >=12000;



--                                      select 구문



-- ■ 1. emp 테이블에서 사원번호가 7698 인 사원의 이름, 업무, 급여를 출력하시오. ■
SELECT * FROM EMP;

SELECT ENAME,JOB,SAL
FROM EMP
WHERE EMPNO = '7698';


-- ■ 2. emp 테이블에서 사원이름이 SMITH인 사람의 이름과 월급, 부서번호를 구하시오. ■
SELECT ENAME,SAL,DEPTNO
FROM EMP
WHERE ENAME = 'SMITH';


-- ■ 3. 월급이 2500이상 3500미만인 사원의 이름, 입사일, 월급을 구하시오. ■

SELECT ENAME,HIREDATE,SAL
FROM EMP
WHERE SAL >=2500  AND  SAL < 3500;

-- ■ 4. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하시오. ■
SELECT ENAME,HIREDATE,SAL
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;


-- ■ 5. 81년05월01일과 81년12월03일 사이에 입사한 사원의 이름, 급여, 입사일을 출력하시오. ■

SELECT ENAME,HIREDATE,SAL
FROM EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-05-01','YYYY-MM-DD')  AND TO_DATE('1981-12-03','YYYY-MM-DD');


-- ■ 6. emp테이블에서 사원번호가 7566,7782,7934인 사원을 제외한 사람들의 사원번호,이름, 월급을 출력하시오. ■

SELECT EMPNO,ENAME,SAL
FROM EMP
WHERE EMPNO NOT IN('7566','7782','7934');


-- ■ 7. 부서번호 30(deptno)에서 근무하며 월2,000달러 이하를 받는 81년05월01일 이후에 입사한 사원의 이름, 급여, 부서번호, 입사일을 출력하시오. ■

SELECT ENAME, SAL, DEPTNO,HIREDATE
FROM EMP
WHERE deptno = 30 AND SAL <= 2000  AND HIREDATE > TO_DATE('1981-05-01', 'YYYY-MM-DD'); 

-- ■ 8. emp테이블에서 급여가 2,000와 5,000 사이고 부서번호가 10 또는 30인 사원의 이름과 급여,부서번호를 나열하시오. ■

SELECT ENAME,SAL,DEPTNO
FROM EMP
WHERE SAL BETWEEN 2000 AND 5000 AND DEPTNO IN ('10' ,'30'); 


-- ■ 9. 업무가 SALESMAN 또는 MANAGER이면서 급여가 1,600, 2,975 또는 2,850이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오. ■

SELECT ENAME,JOB,SAL
FROM EMP
WHERE JOB IN('SALESMAN' , 'MANAGER') AND SAL NOT IN (1,600, 2,975 , 2,850);

-- ■ 11. emp테이블에서 이름에 A와 E가 있는 모든 사원의 이름을 표시하시오. ■
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%A%' AND ENAME LIKE '%E%';

-- ■ 12. emp테이블에서 관리자가 없는 모든 사원의 이름과 업무를 표시하시오. ■
SELECT ENAME,JOB
FROM EMP
WHERE MGR IS NULL;


-- ■ 13. emp테이블에서 커미션 항목이 입력된 사원들의 이름과 급여, 커미션을 구하시오. ■

SELECT ENAME,SAL,COMM
FROM EMP
WHERE COMM IS NOT NULL;


--                                        select 구문 + 함수 



-- ■ 1. EMPLOYEES 테이블에서 입사일자 순으로 정렬하여 사원번호, 이름, 업무, 급여, 입사일자, 부서번호를 출력하라. ■
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,HIRE_DATE,DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;


-- ■ 2. EMPLOYEES 테이블에서 가장 최근에 입사한 순으로 사원번호, 이름, 업무, 급여, 입사일자, 부서번호를 출력하라. ■
SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,HIRE_DATE,DEPARTMENT_ID,SALARY 
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;


-- ■ 3. EMPLOYEES 테이블에서 부서번호로 정렬한 후 부서번호가 같을 경우 급여가 많은 순으로 정렬하여 사원번호, 성명, 업무, 부서번호, 급여를 출력하여라. ■
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID,LAST_NAME,JOB_ID,


-- ■ 4. EMPLOYEES 테이블에서 첫번째 정렬은 부서번호로 두번째 정렬은 업무로 세번째정렬은 급여가 많은 순으로 정렬하여 사원번호, 성명, 입사일자, 부서번호, 업무, 급여를 출력하여라. ■


-- ■ 5. EMPLOYEES 테이블에서 King의 정보를 소문자로 검색하고 사원번호, 성명, 담당업무(소문자로), 부서번호를 출력하라. ■


-- ■ 6. EMPLOYEES 테이블에서 King의 정보를 대문자로 검색하고 사원번호, 성명, 담당업무(대문자로), 부서번호를 출력하라. ■


-- ■ 7. DEPARTMENTS 테이블에서 부서번호와 부서이름, 부서이름과 위치번호를 합하여 출력하도록 하라. ■


-- ■ 8. EMPLOYEES 테이블에서 이름의 첫 글자가 'K' 보다 크고 'Y' 보다 적은 사원의 정보를 사원번호, 이름, 업무, 급여, 부서번호를 출력하라. 단 이름순으로 정렬하여라. ■


-- ■ 9. EMPLOYEES 테이블에서 20번 부서 중 이름의 길이 및 급여의 자릿수를 사원번호, 이름, 이름의 자릿수, 급여 급여의 자릿수를 출력하라. ■


-- ■ 10. EMPLOYEES 테이블에서 이름 중 'e' 자의 위치를 출력하라. ■


-- ■ 11. 다음 쿼리를 실행하고 결과를 분석하라. ■
select round(4567.678), round(4567.678,0), round(4567.678,2), round(4567.678, -2) from dual;


-- 소수점을 짜른다. 뒤에 숫자는 해당 소수점 자리까지 짜르지 않도록 한다. ( - ) 인경우 해당 정수 인자까지 짜른다.

-- ■ 12. EMPLOYEES 테이블에서 부서번호가 80인 사람의 급여를 30으로 나눈 나머지를 구하여 출력하라. ■

-- ■ 13. EMPLOYEES 테이블에서 30번 부서 중 이름과 담당 업무를 연결하여 출력하여라. 단 담당 업무를 한 줄 아래로 출력하라. ■

-- ■  14. EMPLOYEES 테이블에서 현재까지 근무일 수가 몇월 몇일 인가를 출력하여라. 단 근무 일수가 많은 사람 순으로 출력하여라. ■

-- ■ 15. EMPLOYEES 테이블에서 부서 50에서 급여 앞에 $를 삽입하고 3자리마다 , 를 출력하라. ■


-- ■ 16. EMPLOYEES 테이블에서 모든 SALESMAN(SA_MAN)에 대하여 급여의 평균,최고액,최저액,합계를 구하여 출력하여라. ■


-- ■ 17. EMPLOYEES 테이블에 등록되어 있는 인원수, 보너스가 NULL이 아닌 인원수, 보너스의 평균, 등록되어 있는 부서의 수를 구하여 출력하라. ■


-- ■ 18. EMPLOYEES 테이블에서 부서별로 인원수, 평균 급여, 최저급여, 최고급여, 급여의 합을 구하여 출력하라. ■


-- ■ 19. EMPLOYEES 테이블에서 각 부서별로 인원수, 급여의 평균, 최저 급여, 최고 급여, 급여의 합을 구하여 급여의 합이 많은 순으로 출력하여라. ■


-- ■ 20. EMPLOYEES 테이블에서 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하여라. ■


-- ■ 21. EMPLOYEES 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 구하여 출력하여라(GROUP BY, HAVING) ■


-- ■ 22. EMPLOYEES 테이블에서 급여가 최대 10000이상인 부서에 대해서 부서번호, 평균급여, 급여의 합을 구하여 출력하여라. ■


-- ■ 23. EMPLOYEES 테이블에서 업무별 급여의 평균이 10000 이상인 업무에 대해서 업무명, 평균 급여, 급여의 합을 구하여 출력하여라. ■


-- ■ 24. EMPLOYEES 테이블에서 전체 월급이 10000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하라. 단 판매원은 제외하고 월 급여 합계로 정렬(내림차순) 하라. (SA_) ■


-- ■ 25. 테이블에서 사원번호, 사원이름, 입사일을 출력하는데 입사일이 빠른 사람순으로 정렬하시오. ■


-- ■ 27. 10번 부서와 20번부서에서 근무하고 있는 사원의 이름과 부서번호를 출력하는데 이름을 영문자순으로 표시하시오. ■


-- ■ 28 .커미션을 받는 모든 사원의 이름,급여 및 커미션을 커미션을 기준으로 내림차순으로 정렬하여 표시하십시오. ■



-- ■ 1. emp테이블의 업무(job)을 첫글자는 대문자 나머지는 소문자로 출력하시오. ■


-- ■ 2. emp테이블에서 사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출하여 출력 ■


-- ■ 3. 이름의 세번째 문자가 A인 모든 사원의 이름을 표시하시오. ■


-- ■ 4. 이름이 J,A 또는 M으로 시작하는 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 이름의 길이를 표시하시오.(열 레이블은 name과 length로 표시) ■


-- ■ 5. 이름의 글자수가 6자 이상인 사원의 이름을 소문자로 이름만 출력하시오 ■


-- ■ 6. 이름의 글자수가 6자 이상인 사람의 이름을 앞에서 3자만 구하여 소문자로 출력하시오. ■


-- ■ 7. 모든 사원의 이름과 급여를 표시하시오. 급여는 15자 길이로 왼쪽에 $기호가 채워진 형식으로 표기하고 열레이블을 SALARY로 지정하시오. ■




--                                                          조인(join)



-- ■ 1. Steven King의 부서명을 출력하라. ■


-- ■ 2. IT 부서에서 근무하고 있는 사람들을 출력하라. ■


-- ■ 3. EMPLOYEES 테이블과 DEPARTMENTS 테이블의 부서번호를 조인하고 SA_MAN 사원만의 사원번호, 이름, 급여, 부서명, 근무지를 출력하라. (Alias를 사용) ■


-- ■ 4. EMPLOYEES 테이블과 DEPARTMENTS 테이블에서 DEPARTMENTS 테이블에 있는 모든 자료를 사원번호, 이름, 업무, EMPLOYEES 테이블의 부서번호, DEPARTMENTS 테이블의 부서번호, 부서명, 근무지를 출력하여라. ■


-- ■ 5. EMPLOYEES 테이블에서 join하여 관리자(매니저)를 출력하여라. ■


-- ■ 6. EMPLOYEES 테이블에서 left join하여 관리자(매니저)를 출력하고 매니저 아이디가 없는 사람은 배제하고 하향식으로 하며, 급여는 역순으로 출력하여라. ■


-- ■ 7. EMPLOYEES 테이블에서 right join 하여 관리자(매니저)가 108번 상향식으로 급여는 역순으로 출력하라. ■


-- ■ 8. 모든 사원의 이름, 부서번호, 부서이름을 표시하시오. (emp, dept) ■


-- ■ 9. 업무가 MANAGER인 사원의 정볼르 이름, 업무, 부서명, 근무지 순으로 출력하시오. ( emp, dept) ■


-- ■ 10. 커미션을 받고 급여가 1,600이상인 사원의 사원이름, 부서명, 근무지를 출력하시오. ■


-- ■ 11. 근무지가 CHICAGO인 모든 사원의 이름, 업무, 부서번호 및 부서이름을 표시하시오. ■


-- ■ 12. 근무지별로 근무하는 사원의 수가 5명 이하인 경우, 인원이 적은 도시순으로 정렬하시오. (근무 인원이 0 명인 곳도 표시 ) ■


-- ■ 13. 사원의 이름 및 사원 번호를 관리자의 이름과 관리자 번호와 함께 표시하고 각각의 열레이블은 employee, emp#, manager, mag#로 지정하시오. ■


-- ■ 14. 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함꼐 표시하고 열 레이블을 각각 employee, emp hired, manger, mgr hired로 지정 ■


-- ■ 15. SMITH 사원과 동일한 부서에서 근무하고 사원번호는 같지 않은 모든 사원을 표시하도록 질의를 작성하고 동일한 부서에서 근무하는 사원은 colleague로 표시하시오.(부서번호, 사원이름,동료 순으로 오름차순 정렬) ■


-- ■ 16. 10번부서에서 근무하는 사원들의 부서번호, 부서이름, 사원이름,월급,급여등급을 출력하시오. ■




--                                  서브쿼리




-- ■ 1. BLAKE와 같은 부서에 있는 사원들의 이름과 입사일을 구하는데 BLAKE는 제외하고 출력하시오.(BLAKE가 여러명일 수 있음) ■


-- ■ 2. (평균급여보다 많은 급여)를 받는 사원들의 사원번호, 이름, 월급을 출력하는데 (월급이 높은 사람순으로 출력 하시오.) ■


-- ■ 3. (10번부서에서 급여를 가장 적게 받는 사원)과 동일한 급여를 받는 사원의 이름을 출력하시오. ■


-- ■ 4. 사원수가 3명이 넘는 부서의 부서명과 사원수를 출력하시오. ■


-- ■ 5. 사원번호가 7844인 사원보다 빨리 입사한 사원의 이름과 입사일을 출력하시오. ■


-- ■ 6. 직속상사(MGR)가 KING인 모든 사원의 이름과 급여를 출력하시오. ■


-- ■ 7. 20번 부서에서 가장 급여를 많이 받는 사원과 동일한 급여를 받는 사원의 이름과 부서명, 급여, 급여등급을 출력하시오. (emp, dept, salgrade) ■


-- ■ 8. 총급여(sal+comm)가 평균 급여보다 많은 급여를 받는 사람의 부서번호, 이름, 총급여, 커미션을 출력하시오. ■


-- ■ 9. CHICAGO 지역에서 근무하는 사원의 평균 급여보다 높은 급여를 받는 사원의 이름과 급여, 지역명을 출력하시오. ■


-- ■ 10. 업무가 SALESMAN인 직원이 2명 이상인 부서의 이름, 근무하는 사원의 이름, 업무를 출력 하시오.(컬럼명은 부서명, 사원명, 업무로 출력) ■


-- ■ 11. 커미션이 없는 사원들 중 월급이 가장 높은 사원의 이름과 급여등급을 출력하시오. ■

-- ■ 12. SMITH의 관리자(MGR)의 이름과 부서명, 근무지역을 출력하시오. ■



-- ■ 1. EMPLOYEES 테이블에서 Kochhar 의 급여보다 많은 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력하라. ■


-- ■ 2. EMPLOYEES 테이블에서 급여의 평균보다 적은 사원의 정보를 사원번호, 이름, 담당업무, 급여, 부서번호를 출력하여라 ■


-- ■ 3. EMPLOYEES 테이블에서 100번 부서의 최소 급여보다 최소 급여가 많은 다른 모든 부서를 출력하라. ■


-- ■ 4. 업무별로 최소 급여를 받는 사원의 정보를 사원번호, 이름 업무, 부서번호를 출력하여라. 단 업무별로 정렬하여라. ■


-- ■ 5. EMPLOYEES 과 DEPARTMENTS 테이블에서 업무가 SA_MAN 사원의 정보를 이름, 업무, 부서명, 근무지를 출력하라. ■

-- ■ 6. EMPLOYEES 테이블에서 가장 많은 사원을 갖는 MANAGER의 사원번호를 출력하라. ■


-- ■ 7. EMPLOYEES 테이블에서 가장 많은 사원이속해 있는 부서번호와 사원수를 출력하라. ■


-- ■ 8. EMPLOYEES 테이블에서 사원번호가 123인 사원의 직업과 같고 사원번호가 192인 사원의 급여(SAL)보다 많은 사원의 사원번호, 이름, 직업, 급여를 출력하라. ■


-- ■ 9. 직업(JOB)별로 최소 급여를 받는 사원의 정보를 사원번호, 이름, 업무, 부서명을 출력하라. -- 조건 1 : 직업별로 내림차순 정렬 ■


-- ■ 10. EMPLOYEES 테이블에서 50번 부서의 최소 급여를 받는 사원 보다 많은 급여를 받는 사원의 정보를 사원번호, 이름, 업무, 입사일자, 급여, 부서번호를 출력하라 단 50번은 제외 ■


-- ■ 11. EMPLOYEES 테이블에서 50번 부서의 최고 급여를 받는 사원 보다 많은 급여를 받는 사원의 정보를 사원번호, 이름, 업무, 입사일자, 급여, 부서번호를 출력하라 단 50번은 제외 ■







  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
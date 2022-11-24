-- 사원 정보 테이블 
SELECT * FROM EMPLOYEES;

-- 부서 정보 테이블
SELECT * FROM DEPARTMENTS;

-- 직급/직무 테이블 
SELECT * FROM JOBS;

-- 지점 정보 테이블
SELECT * FROM LOCATIONS;

-- 국가 정보 테이블
SELECT * FROM COUNTRIES;

-- 대륙 정보 테이블 
SELECT * FROM REGIONS;

/*
 * 사원테이블에서 SALARY  정보가 3,000 이하인 사원은 사번, 이름을 조회하세요.
 */
SELECT FIRST_NAME || ' ' || LAST_NAME AS 이름
			, EMPLOYEE_ID AS 사번
	FROM EMPLOYEES 
	WHERE SALARY <= 3000;
	
/*
* 사원테이블에서 DEPARTMENT_ID 가 50 인 사원은 사번, 이름, 직무를 조회하세요. 
*/
SELECT  FIRST_NAME || ' ' || LAST_NAME AS 이름
			, EMPLOYEE_ID AS 사번
			, JOB_ID 
	FROM EMPLOYEES
	WHERE DEPARTMENT_ID = 50;
	
/*
* 부서 테이블에서 DEPARTMENT_NAME 의 값이 IT가 포함된 결과를 조회하세요.,
* 부서 ID, 부서명 컬럼만 Record Set 에 반환하세요.
*/
SELECT DEPARTMENT_ID
			, DEPARTMENT_NAME
	FROM DEPARTMENTS
	WHERE DEPARTMENT_NAME LIKE 'IT%'
	
/*
* 직무 테이블에서 JOB_TITLE 의 값에 Manager 가 포함된 결과를 조회하세요.
* 직무, 직무명 컬럼만 Record Set 에 반환하세요. 
*/
SELECT JOB_ID AS 직무ID
			, JOB_TITLE AS 직무명
	FROM JOBS 
	WHERE JOB_TITLE LIKE '%Manager';

/*
 * 사원 테이블에서 MANAGER_ID 칼럼만 조회 할 때 중복된 결과값이 나오지 않게 하세요.
 */
SELECT DISTINCT MANAGER_ID
FROM EMPLOYEES;

/*
 * 사원 테이블에서 EMAIL 칼럼만 출력할 때 "@emp.co.kr" 이 추가로 붙어서 나오게 하세요.
 */
SELECT EMAIL || '@emp.co.kr' AS 이메일
FROM EMPLOYEES;

/*
 * 사원 테이블에서 전화번호 형식이 xxx.xxx.xxxx에 해당하는 정보만 Record Set 으로 반환되어 나오도록 하세요.
 */
SELECT PHONE_NUMBER AS 전화번호
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '___.___.____';

/*
* 사원 테이블에서 COMMISIION_PCT 가 NULL 이 아닌 데이터들만 조회되게 하고 SALARY 를 출력할 때
* COMMISSION_PC가 포함된 SALARY 결과가 나오게 하세요. 
*/
SELECT SALARY AS 급여
			, SALARY *( 1+COMMISSION_PCT ) AS "급여(커미션 포함)"
			, COMMISSION_PCT AS 커미션
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;
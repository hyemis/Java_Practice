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
			, EMPLOYEE_ID 
			, SALARY
	FROM EMPLOYEES 
	WHERE SALARY <= 3000;
	
/*
* 사원테이블에서 DEPARTMENT_ID 가 50 인 사원은 사번, 이름, 직무를 조회하세요. 
*/
SELECT  FIRST_NAME || ' ' || LAST_NAME AS 이름
			, EMPLOYEE_ID
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
SELECT JOB_ID
			, JOB_TITLE
	FROM JOBS 
	WHERE JOB_TITLE LIKE '%Manager';

/*
 * 사원 테이블에서 MANAGER_ID 칼럼만 조회 할 때 중복된 결과값이 나오지 않게 하세요.
 */
SELECT DISTINCT MANAGER_ID
FROM EMPLOYEES;


	
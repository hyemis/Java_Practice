/*
 * Sub Query 
 * 		- SQL 구문에 SELECT 구문이 포함되어 실행되는 형태 
 * 		- 서브쿼리는 반드시 소괄호로 묶어야 함
 * 		- 서브쿼리와 비교하는 항목은 반드시 서브쿼리의 SELECT 절의 항목 갯수와 
 * 		 자료형을 일치시켜야 한다. 
*/
SELECT  EMPLOYEE_ID 
		 	, FIRST_NAME 
		 	, LAST_NAME 
		 	, (SELECT JOB_TITLE FROM JOBS WHERE JOB_ID = E.JOB_ID ) 
		 	, (SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID = E.DEPARTMENT_ID ) AS DEPT_NAME
		 	, MANAGER_ID 
FROM EMPLOYEES E;

SELECT *
FROM (SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES);

SELECT  EMPLOYEE_ID
			, FIRST_NAME
			, LAST_NAME
			, SALARY
			, COMMISSION_PCT
			, DEPARTMENT_ID 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DISTINCT DEPARTMENT_ID 
										 FROM EMPLOYEES 
										 WHERE COMMISSION_PCT IS NOT NULL 
										 AND COMMISSION_PCT > 0);
										 
/*
 * INSERT, UPDATE, DELETE 구문에서도 서브 쿼리 사용됨.
 */										
INSERT INTO 테이블명(
		SELECT * FROM 테이블명
);

UPDATE 테이블명
	  SET 컬럼명 = (SELECT 컬럼명 FROM 테이블명);
	 
DELETE FROM 테이블명 
WHERE 컬럼명 = (SELECT 컬럼명 FROM 테이블명);

/*
 * 서브 쿼리의 Result Set 의 Record 수와 Coulmn 수에 따라서 에러가 발생 할 수 있다. 
 */
SELECT  EMPLOYEE_ID 
		 	, FIRST_NAME 
		 	, LAST_NAME 
		 	, (SELECT JOB_TITLE FROM JOBS WHERE JOB_ID = E.JOB_ID ) 
		 	, (SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_ID = E.DEPARTMENT_ID ) AS DEPT_NAME
		 	, MANAGER_ID 
FROM EMPLOYEES E;

SELECT  EMPLOYEE_ID 
		 	, FIRST_NAME 
		 	, LAST_NAME 
FROM EMPLOYEES E
WHERE EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID		
									FROM EMPLOYEES
									WHERE MANAGER_ID IS NOT NULL);

SELECT  EMPLOYEE_ID 
		 	, FIRST_NAME 
		 	, LAST_NAME 
FROM EMPLOYEES E
WHERE ( JOB_ID,DEPARTMENT_ID ) IN (SELECT DISTINCT JOB_ID, DEPARTMENT_ID
													 FROM EMPLOYEES);
													 
/*
 *  단일 행
 * 		- 서브쿼리 결과 값이 1개 인 것 
 * 다중 행 
 * 		- 서브쿼리 결과 값이 N개 인 것 
 * 다중열 
 * 		- 서브쿼리 결과 열이 N개 인 것
 * 다중행/다중열
 * 		- 서브쿼리의 결과 열과 값이 N개 인 것 
 */													
	
/*
 * SELECT 절에 사용하는 서브쿼리는 반드시 단일행/ 단일열의 결과가 나와야한다.
 * WHERE 절에 사용하는 서브쿼리는 왼쪽 컬럼 수에 따라 단일 열 또는 다중 열이 사용될 수 있다. 
 * WHERE 절에 사용하는 서브쿼리는 연산자 종류에 따라 단일행 또는 다중열이 사용될 수 있다. 
 * (1개 값을 비교하는 형태면 단일행, 여러 값을 비교하는 형태면 다중열)
 * FROM 절에 사용하는 서브쿼리는 어떠한 형태이든 사용가능하다. 
 * FROM 절에 사용하는 서브쿼리는 INLINE VIEW 라고 한다. 
 * INLINE VIEW 를 사용할 때 WITH 구문을 사용해서 미리 서브쿼리에 대한 별칭을 부여할 수 있다. 
 */
WITH TEMP
AS (SELECT EMPLOYEE_ID
				, FIRST_NAME 
				, LAST_NAME
		FROM EMPLOYEES)
SELECT * FROM TEMP;

/*
 * TOP-N 분석 : 상/하위 N개 행만 조회. 
 */
SELECT ROWNUM 순위
			, EMPLOYEE_ID 
			, FIRST_NAME
			, LAST_NAME
			, SALARY
FROM  (SELECT EMPLOYEE_ID
				, FIRST_NAME 
				, LAST_NAME
				, SALARY
		FROM EMPLOYEES
		ORDER BY SALARY ASC)
WHERE ROWNUM <= 10;
	
SELECT 순위
			, EMPLOYEE_ID
			, FIRST_NAME
			, LAST_NAME
			, SALARY
FROM (SELECT EMPLOYEE_ID	
						, FIRST_NAME
						, LAST_NAME
						, SALARY
						, RANK() OVER(ORDER BY SALARY DESC) AS 순위
			FROM EMPLOYEES);
		
SELECT 순위
			, EMPLOYEE_ID
			, FIRST_NAME
			, LAST_NAME
			, SALARY
FROM (SELECT EMPLOYEE_ID	
						, FIRST_NAME
						, LAST_NAME
						, SALARY
						, DENSE_RANK () OVER(ORDER BY SALARY DESC) AS 순위
			FROM EMPLOYEES);
 
											
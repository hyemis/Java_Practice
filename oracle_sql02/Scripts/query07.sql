/*
 * 부서별 평균, 최대, 최소 급여를 집계한 DEPT_SALARY_STATIS 테이블을 만들어 
 * 데이터를 추가하시오.
*/
SELECT * FROM EMPLOYEES;
SELECT  * FROM DEPT_SALARY_STATICS;

CREATE TABLE DEPT_SALARY_STATICS
AS
SELECT FLOOR(AVG(SALARY)) AS AVGOFSALARY
			, MAX(SALARY) AS MAXOFSALARY
			, MIN(SALARY) AS MINOFSALARY
			, DEPARTMENT_ID AS DEPT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL 
GROUP BY DEPARTMENT_ID;

/*
 * 직급별 평균, 최대, 최소 급여를 집계한 JOB_SALARY_SATIS 테이블을 만들어 
 * 데이터를 추가하시오. 
 */
CREATE TABLE JOB_SALARY_STATICS
AS
SELECT FLOOR(AVG(SALARY)) AS AVGOFSALARY
			, MAX(SALARY) AS MAXOFSALARY
			, MIN(SALARY) AS MINOFSALARY
			, JOB_ID AS 직급
FROM EMPLOYEES
GROUP BY JOB_ID;

SELECT  * FROM JOB_SALARY_STATICS;
 /*
  * 직급 ID에 'MGR' 이 접두사로 붙은 JOB_SALARY_STATIS에 평균, 최대, 최소 급여를 +500 하세요.
*/
SELECT * FROM EMPLOYEES;
/*
 * 년도별 입사 인원을 파악하기 위한 HIRE_FOR_YEAR 테이블을 만들어 데이터를 추가하시오. 
 * (인원 파익이 주 목적이기 때문에 년도와 인원수만 저장할 수 있으면 됨)
 */
									 
/*
 * 부서별 / 직급별 평균, 최대, 최소 급여를 저장한 테이블에 COMMISSION_PCT 까지 반영한 
 * 데이터가 저장될 수 있도록 기존 정보를 수정하시오. 
 */									 

CREATE TABLE EMP_SAMPLE
AS
SELECT EMPLOYEE_ID
		 , 	 FIRST_NAME || ' ' || LAST_NAME AS EMP_NAME
		 , 	 EMAIL || '@emp.co.kr' AS EMAIL
		 , 	 HIRE_DATE
		 , 	 SALARY
		 ,	 COMMISSION_PCT 
		 ,	 DEPARTMENT_ID AS DEPT_ID
		 ,	 REPLACE (PHONE_NUMBER, '.', '-' ) AS PHONE
FROM EMPLOYEES;

UPDATE EMP_SAMPLE
	  SET (SALARY, COMMISSION_PCT) = (SELECT 5000 
	  																, 0.1
	  														FROM DUAL)
WHERE DEPT_ID = 10;

UPDATE EMP_SAMPLE
	  SET (SALARY, COMMISSION_PCT) = (SELECT SALARY + 1000
	  																, 0.1
	  														FROM EMP_SAMPLE
	  														WHERE DEPT_ID = 10)
WHERE DEPT_ID = 10;

SELECT * FROM EMP_SAMPLE WHERE DEPT_ID = 10;

/*
 * 107 번 사원 Diana Lorentz 의 급여를 자신이 속해 있는 부서의 평균 급여로 현재 급여를 
 * 수정하시오.
*/

SELECT * FROM EMP_SAMPLE;

UPDATE EMP_SAMPLE 
SET 		 SALARY = (SELECT FLOOR(AVG(SALARY))
							FROM EMP_SAMPLE 
							WHERE DEPT_ID = 60
							GROUP BY DEPT_ID)
WHERE EMPLOYEE_ID = 107;

SELECT*FROM EMP_SAMPLE WHERE EMPLOYEE_ID = 107;

SELECT * FROM EMPLOYEES;

/*
 * 1. 1980 년대 입사자, 1990 년대 입사자, 2000년대 입사자의 수를 구하시오.
 * 2.  DEPARTMENT_ID 가 50, 80, 100 인 부서의 평균 급여를 구하시오.
 * 3. 년도 구분 없이 1/ 4분기, 2/4 분기, 3/4 분기, 4/4 분기 별 입사자의 수를 구하시오.
 * 4. 급여액이 10000 이상인 사원이 어느 부서에 많이 있는지 확인할 수 있는 조회 구문을 작성하시오. 
*/

/*
 * 1. 1980 년대 입사자, 1990 년대 입사자, 2000년대 입사자의 수를 구하시오.
 */
SELECT SUBSTR(EXTRACT(YEAR FROM HIRE_DATE), 1, 3) AS 입사년도 
	 , COUNT(*) 입사자수 
FROM EMPLOYEES
GROUP BY SUBSTR(EXTRACT(YEAR FROM HIRE_DATE), 1, 3);

SELECT FLOOR(EXTRACT(YEAR FROM HIRE_DATE) / 10) * 10 AS 년도
		 , COUNT(*) 입사자수
FROM EMPLOYEES
GROUP BY FLOOR(EXTRACT(YEAR FROM HIRE_DATE) / 10) * 10;

/*
 *  2.  DEPARTMENT_ID 가 50, 80, 100 인 부서의 평균 급여를 구하시오.
 */
SELECT DEPARTMENT_ID 
	 , ROUND(AVG(SALARY),2) AS 평균급여 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (50, 80, 100)
GROUP BY DEPARTMENT_ID;

/*
 *  3. 년도 구분 없이 1/4 분기, 2/4분기, 3/4분기 4/4분기 별 입사자의 수를 구하시오.
 */

SELECT CASE WHEN EXTRACT(MONTH FROM HIRE_DATE) >= 1 AND EXTRACT(MONTH FROM HIRE_DATE) < 4 THEN '1/4분기'
		    WHEN EXTRACT(MONTH FROM HIRE_DATE) >= 4 AND EXTRACT(MONTH FROM HIRE_DATE) < 7 THEN '2/4분기'
		    WHEN EXTRACT(MONTH FROM HIRE_DATE) >= 7 AND EXTRACT(MONTH FROM HIRE_DATE) < 10 THEN '3/4분기'
		    WHEN EXTRACT(MONTH FROM HIRE_DATE) >= 10 AND EXTRACT(MONTH FROM HIRE_DATE) <= 12 THEN '4/4분기'
	 	END 분기 
	 ,  COUNT(*)
FROM EMPLOYEES
GROUP BY EXTRACT(MONTH FROM HIRE_DATE);

SELECT DECODE( EXTRACT(MONTH FROM HIRE_DATE))
							, 1, 1, 2, 1, 3, 1
							, 4, 2, 5, 2, 6, 2
							, 7, 3, 8, 3, 9, 3
							, 10, 4, 11, 4, 12,  4) AS 분기
		  , COUNT(*) AS 입사자수 
	FROM EMPLOYEES
GROUP BY DECODE( EXTRACT(MONTH FROM HIRE_DATE)
							, 1, 1, 2, 1, 3, 1
							, 4, 2, 5, 2, 6, 2
							, 7, 3, 8, 3, 9, 3
							, 10, 4, 11, 4, 12,  4)
ORDER BY 1;

SELECT DECODE(EXTRACT(MONTH FROM HIRE_DATE)
							, 1, 1, 2, 1, 3, 1
							, 4, 2, 5, 2, 6, 2
							, 7, 3, 8, 3, 9, 3
							, 10, 4, 11, 4, 12, 4) AS 분기
				, COUNT(*) AS 입사자수
FROM EMPLOYEES
GROUP BY DECODE(EXTRACT(MONTH FROM HIRE_DATE)
							, 1, 1, 2, 1, 3, 1
							, 4, 2, 5, 2, 6, 2
							, 7, 3, 8, 3, 9, 3
							, 10, 4, 11, 4, 12, 4) 
ORDER BY 1;

/*
 * 4. 급여액이 10000 이상인 사원이 어느 부서에 많이 있는지 확인할 수 있는 조회 구문을 작성하시오.
 */
SELECT DEPARTMENT_ID
	 , COUNT(*) AS 급여가10000이상인사원수
FROM EMPLOYEES
WHERE SALARY >= 10000
GROUP BY DEPARTMENT_ID
ORDER BY 2 DESC;
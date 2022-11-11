SELECT * FROM EMPLOYEES;

/*
 * 1. 1980 년대 입사자, 1990 년대 입사자, 2000년대 입사자의 수를 구하시오.
 * 2.  DEPARTMENT_ID 가 50, 80, 100 인 부서의 평균 급여를 구하시오.
 * 3. 년도 구분 없이 1/ 4분기, 2/4 분기, 3/4 분기, 4/4 분기 별 입사자의 수를 구하시오.
 * 4. 급여액이 10000 이상인 사원이 어느 부서에 많이 있는지 확인할 수 있는 조회 구문을 작성하시오. 
*/

SELECT EXTRACT (YEAR FROM HIRE_DATE) AS  년도
			, COUNT(*) AS 입사자수
FROM EMPLOYEES
GROUP BY EXTRACT (YEAR FROM HIRE_DATE);
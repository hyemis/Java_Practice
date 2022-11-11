/*
 * GROUP BY 절 
 * 		- 그룹 함수를 사용하여 특정 그룹에 대한 집계를 나타낼 때 전체 그룹이 아닌
 * 		  특정 그룹에 대한 집계가 이루어 질 수 있도록 그룹을 묶어주는 역할 수행 
*/
SELECT COUNT(DEPARTMENT_ID)
FROM EMPLOYEES

SELECT  DEPARTMENT_ID 
			, COUNT(DEPARTMENT_ID)  부서별 총원
			, MAX(SALARY) 부서별최고급여액
			, MIN(SALARY)  부서별최저급여약
			, ROUND(AVG(SALARY) , 2)  부서별평균급여액
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

SELECT SUBSTR(PHONE_NUMBER, 1, 3) AS 전화번호앞자리 
			, COUNT(*) AS 수량 
FROM EMPLOYEES
GROUP BY SUBSTR(PHONE_NUMBER, 1, 3); 

/*
 * 년도별 입사자 수를 구하시오.
*/
SELECT TO_CHAR(HIRE_DATE, 'YYYY"년"') AS 입사년도
			, COUNT(*) AS 입사자수
FROM EMPLOYEES
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY"년"');

/*
 * 날짜에서 해당 년, 월, 일 추출하는 함수 사용 
 */
SELECT EXTRACT(YEAR FROM HIRE_DATE) AS 년도
			, COUNT(*) AS 입사자수
FROM EMPLOYEES
GROUP BY EXTRACT(YEAR FROM HIRE_DATE);

/*
 * JOB_ID 별 최고급여액, 최저급여액을 구하시오.
 * COMMISSION_PCT가 있는 경우 COMMISSION_PCT를 포함한 급여액으로 구하세요.
*/

SELECT JOB_ID 
			, MAX(SALARY*(NVL(COMMISSION_PCT, 0) +1)) AS 최고급여액 
			, MIN(SALARY*(NVL(COMMISSION_PCT, 0) +1)) AS 최소급여액
FROM EMPLOYEES
GROUP BY JOB_ID;

/*
 * HAVING 절
 * 		- 그룹에 대한 조건절로 사용한다.
 * 	 	- WHERE 절에서 사용하는 조건은 GROUP 으로 묶이기 전의 조건으로 사용됨.
 */
SELECT DEPARTMENT_ID 
			, COUNT(DEPARTMENT_ID) 부서별총원 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(DEPARTMENT_ID) < 5; 

SELECT SUBSTR(PHONE_NUMBER, 1, 3) AS 전화번호앞자리 
			, COUNT(*) AS 수량 
FROM EMPLOYEES
GROUP BY SUBSTR(PHONE_NUMBER, 1, 3)
HAVING COUNT(*) >= 20; 

/*
 * 30명 이상이 근무하는 부서의 전화번호 앞자리 회선 수 집계
 */
SELECT DEPARTMENT_ID 
			, SUBSTR(PHONE_NUMBER, 1, 3) AS 전화번호앞자리
			, COUNT(PHONE_NUMBER)  AS 회선수
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, SUBSTR(PHONE_NUMBER, 1, 3)
HAVING COUNT(DEPARTMENT_ID) >= 30; 

/*
 *  커미션을 지급 받는 사원의 직무 분포 현황
 */ 
SELECT JOB_ID 
			, COUNT(*) AS 수  
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
GROUP BY JOB_ID;

SELECT JOB_ID 
			, COMMISSION_PCT 
			, COUNT(*) AS 수  
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
GROUP BY JOB_ID, COMMISSION_PCT ;

/*
 * ROLLUP : 그룹별 집계를 위한 함수
 * 				그룹으로 묶기 위한 조건이 1개 이상인 경우에 사용하여 
 * 				그룹별 집계 외에 단일 그룹별 집계 / 복수개의 그룹별 집계 / 총 집계
 * 				까지 나타낸다. 
 */
SELECT JOB_ID 
			, COMMISSION_PCT 
			, COUNT(*) AS 수  
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
GROUP BY ROLLUP (JOB_ID, COMMISSION_PCT) ;

/*
 * CUBE : 그룹별 집계를 위한 함수
 * 			그룹으로 묶기 위한 조건이 1개 이상인 경우에 사용하여
 * 			조합 가능한 모든 그룹에 대한 집계와 총 집계를 나타낸다. 
 */
 SELECT JOB_ID 
			, COMMISSION_PCT 
			, COUNT(*) AS 수  
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
GROUP BY CUBE  (JOB_ID, COMMISSION_PCT) 
ORDER BY 1  NULLS FIRST, 2  NULLS LAST;
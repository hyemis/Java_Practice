
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

SELECT * FROM EMP_SAMPLE;

/*
 * 홍길동 사원 정보를 추가 한다. 
 * 홍길동 사원의 EMP_ID 는 기존 EMP_ID의 값 중 가장 큰 EMP_ID + 1 한 값이 저장되게 한다. 
 * 홍길동 사원의 입사일은 2022년 03월 05일 이다. 
 * 홍길동 사원의 부서 ID는 80 이다. 
 * 홍길동 사원의 급여는 2800 이며 보너스(COMMISSION_PCT) 는 없다. 
 * 위에서 제시한 사항을 참고하여 데이터를 추가하며 없는 정보는 NULL 로 채워 넣는다. 
 */

SELECT * FROM EMP_SAMPLE;

SELECT  MAX( EMPLOYEE_ID ) FROM EMP_SAMPLE;

INSERT INTO EMP_SAMPLE VALUES(207, '홍길동',  NULL,TO_DATE('20220305', 'YYYYMMDD'), 2800, NULL, 80, NULL);

/*
 * 홍길동 사원의 직무코드를 'IT_PROG' 로 부서ID는 60으로 수정하세요.
 * 홍길동 사원의 EMAIIL 주소는 영문이름으로 만들어서 수정하세요.
 * 홍길동 사원의 전화번호는 590-423-4561 으로 수정해주세요.
*/
UPDATE EMP_SAMPLE SET DEPT_ID = 60 WHERE EMPLOYEE_ID = 207;
UPDATE EMP_SAMPLE SET EMAIL = 'GILDONG@emp.co.kr', PHONE = 5904234561 WHERE EMPLOYEE_ID = 207;


/*
 * 1990년 이전 입사자들의 퇴직신청을 위해 관련된 사원의 리스트를 조회하고 
 * 조회된 정보 중에서 급여가 10000 이상인 사원의 급여 25%를 삭감하세요. 
*/

UPDATE EMP_SAMPLE SET SALARY = SALARY - (SALARY*0.25) WHERE EXTRACT (YEAR FROM HIRE_DATE) < 1990 AND SALARY > 10000;

SELECT * FROM EMP_SAMPLE;


/*
 * 부서 ID가 50, 60, 70인 사원들에 대해 기존 급여에 10% 인상한 급여로 수정하세요.
*/
UPDATE EMP_SAMPLE SET SALARY = (SALARY + SALARY*0.1) WHERE DEPT_ID IN (50,60,70); 

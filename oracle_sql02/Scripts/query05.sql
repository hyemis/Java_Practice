CREATE TABLE COMMISSION_LIST(
			EMP_ID NUMBER
		,	EMP_NAME VARCHAR2(50)
		,	COMMISSION_PCT NUMBER(3,2)
);

/*
 * 다른 테이블의 데이터를 조회하고 그 조회 결과를 
 * 다른 테이블에 INSERT 하기 (테이블 컬럼 순서에 맞추어 SELECT 구문을 작성하게 됨 )
 */
INSERT INTO COMMISSION_LIST(
			SELECT EMPLOYEE_ID AS EMP_ID
						,FIRST_NAME || ' ' || LAST_NAME AS EMP_NAME
						,COMMISSION_PCT
			FROM EMPLOYEES
			WHERE COMMISSION_PCT IS NOT NULL 
);

CREATE TABLE INC_COMMISSION_SALARY(
			  EMP_ID NUMBER
			, EMP_NAME VARCHAR(20)
			, SALARY NUMBER
);

INSERT ALL  INTO COMMISSION_LIST VALUES(EMP_ID, EMP_NAME, COMMISSION_PCT)
				 	INTO INC_COMMISSION_SALARY VALUES(EMP_ID, EMP_NAME, SALARY)
SELECT EMPLOYEE_ID AS EMP_ID
			,FIRST_NAME || ' ' || LAST_NAME AS EMP_NAME
			,COMMISSION_PCT
			,SALARY * (1 + COMMISSION_PCT) AS SALARY
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

SELECT * FROM COMMISSION_LIST;
SELECT * FROM INC_COMMISSION_SALARY;

DELETE FROM COMMISSION_LIST;
DELETE FROM INC_COMMISSION_SALARY;

/*
 *  2000년 이전 입사자
 */
CREATE TABLE BEFORE_2000_YEAR(
			 EMP_ID NUMBER
			, EMP_NAME VARCHAR2(50)
			, HIRE_DATE DATE
);
/*
 * 2000년 이후 입사자 
 */
CREATE TABLE AFTER_2000_YEAR(
			 EMP_ID NUMBER
			, EMP_NAME  VARCHAR2(50)
			,  HIRE_DATE DATE
);
INSERT ALL
			WHEN HIRE_DATE < TO_DATE('20000101', 'YYYYMMDD') THEN 
				INTO  BEFORE_2000_YEAR(EMP_ID,  EMP_NAME, HIRE_DATE)
			WHEN HIRE_DATE >= TO_DATE('20000101', 'YYYYMMDD') THEN 
				   INTO  AFTER_2000_YEAR(EMP_ID,  EMP_NAME, HIRE_DATE)
SELECT EMPLOYEE_ID AS EMP_ID
		,	 FIRST_NAME || ' ' || LAST_NAME AS EMP_NAME 
		, 	HIRE_DATE
FROM EMPLOYEES;
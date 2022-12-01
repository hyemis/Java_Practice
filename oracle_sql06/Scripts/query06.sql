/* 부서의 사원이 얼마나 있냐...
 * DEPARTMENTS 테이블에 총원(EMP_TOTAL) 컬럼을 추가하여 부서별 인원을 기록할 수 있도록 수정한다. 
 * 
 * 사원 추가(PROC_ADD_EMPLOYEE) 프로시져를 생성하여 사원을 추가할 때 다음의 기능이 동작하도록 한다. 
 * 		- EMPLOYEE 테이블에 사원을 추가할 수 있는 최소한의 정보를 이용하여 프로시져가 동작하게 한다. 
 * 		- 추가된 사원의 부서에 맞추어 DEPARTMENTS 테이블의 EMP_TOTAL 컬럼의 총원을 증가시킨다.
 * 
 * 사원 수정(PROC_MOD_EMPLOYEE) 프로시져와 사원 삭제(PROC_DEL_EMPLOYEE) 프로시져를 생성하여 다음의 기능이
 * 동작하도록 한다.
 * 		- EMPLOYEES 테이블의 사원 정볼르 수정/삭제 할 수 있는 최소한의 정보를 이용하여 프로시져가 동작하게 한다. 
 * 		- 사원의 정보를 수정할 때는 급여, 직무, 부서 만 수정할 수 있게 한다. 
 * 		- 수정/삭제 된 사원의 부서에 맞추어 DEPARTMNETS 테이블의 EMP_TOTAL 컬럼의 총원을 증가 혹은 감소 시키도록 한다. 
 * 
 * TRIGGER 로도 생성하여 만들어 본다.  
*/

--DEPARTMENT 테이블의 트리거 생성 후 INSERT 사원 하면 DEPARTMENTS 테이블의 EMP_TOTAL 컬럼이 수정되도록 한다. 
-- DEMPARTMENT 테이블의 EMP_TOTAL 컬럼 추가 
SELECT * FROM DEPARTMENTS;
ALTER TABLE DEPARTMENTS ADD EMP_TOTAL NUMBER;

UPDATE DEPARTMENTS D1
SET EMP_TOTAL = (SELECT CNT
							FROM (SELECT   DEPARTMENT_ID AS DEPT_ID
													, COUNT(*) AS CNT
										FROM EMPLOYEES E1
										GROUP BY DEPARTMENT_ID)
							WHERE DEPT_ID = D1.DEPARTMENT_ID);

SELECT * FROM DEPARTMENTS D1;

UPDATE DEPARTMENTS D1
SET EMP_TOTAL = 0
WHERE EMP_TOTAL IS NULL;

CREATE OR REPLACE PROCEDURE PROC_ADD_EMPLOYEE(
			IN_FNAME IN VARCHAR2
		,	IN_LNAME IN VARCHAR2
		,	IN_EMAIL IN VARCHAR2
		, 	IN_JOB_ID IN VARCHAR2
		,	IN_DEPT_ID IN NUMBER
)
IS 
	VAR_EMP_ID NUMBER;
	VAR_SALARY NUMBER;
	EXISTS_JOB VARCHAR(30);
	EXISTS_DEPT NUMBER;
BEGIN 
	SELECT MAX(EMPLOYEE_ID) + 1 INTO VAR_EMP_ID FROM EMPLOYEES;
	SELECT JOB_ID, MIN_SALARY INTO EXISTS_JOB, VAR_SALARY FROM JOBS WHERE JOB_ID = IN_JOB_ID;
	SELECT DEPARTMENT_ID INTO EXISTS_DEPT FROM DEPARTMENTS WHERE DEPARTMENT_ID = IN_DEPT_ID;
	
	INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL
										  , HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
						VALUES(VAR_EMP_ID, IN_FNAME, IN_LNAME, IN_EMAIL
										, SYSDATE, VAR_SALARY, IN_JOB_ID, IN_DEPT_ID);
									
	UPDATE DEPARTMENTS
	SET EMP_TOTAL = EMP_TOTAL + 1
	WHERE DEPARTMENT_ID = IN_DEPT_ID;

 	COMMIT;
EXCEPTION  
		WHEN NO_DATA_FOUND THEN
					DBMS_OUTPUT.PUT_LINE('직무 코드 또는 부서 ID 가 존재하지 않습니다. ');
		ROLLBACK;
END;

SELECT * FROM USER_ERRORS;


BEGIN
	  PROC_ADD_EMPLOYEE('홍', '길동', 'GILL', 'IT_PROG', 60);
END;

SELECT * FROM EMPLOYEES;

--급여, 직무, 부서
CREATE OR REPLACE  PROCEDURE PROC_MOD_EMPLOYEE(
		IN_EMP_ID IN NUMBER
	,	IN_SALARY IN NUMBER
	,	IN_JOB_ID IN VARCHAR2
	, 	IN_DEPT_ID IN NUMBER
)
IS 
 	VAR_DEPT_ID NUMBER;
BEGIN 
	SELECT DEPARTMENT_ID INTO VAR_DEPT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = IN_EMP_ID;

	IF VAR_DEPT_ID != IN_DEPT_ID THEN 
			UPDATE DEPARTMENTS 
			SET EMP_TOTAL = EMP_TOTAL -1 
			WHERE DEPARTMENT_ID = VAR_DEPT_ID;
		
			UPDATE DEPARTMENTS 
			SET EMP_TOTAL = EMP_TOTAL +1 
			WHERE DEPARTMENT_ID = IN_DEPT_ID;
	END IF;
	
	UPDATE EMPLOYEES 
	SET SALARY = IN_SALARY
		,	JOB_ID = IN_JOB_ID
		,	DEPARTMENT_ID  = IN_DEPT_ID
	WHERE EMPLOYEE_ID = IN_EMP_ID;

	COMMIT;
EXCEPTION 
		WHEN NO_DATA_FOUND THEN
			DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다.');
			ROLLBACK;
END;

SELECT * FROM USER_ERRORS;

BEGIN
	PROC_MOD_EMPLOYEE(207, 4000, 'IT_PROG', 70);
END;

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 207;

CREATE OR REPLACE PROCEDURE PROC_DEL_EMPLOYEE(
       IN_EMP_ID IN NUMBER
)
IS
    VAR_DEPT_ID NUMBER;
BEGIN
	SELECT DEPARTMENT_ID INTO VAR_DEPT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = IN_EMP_ID;
    
    DELETE FROM EMPLOYEES WHERE EMPLOYEE_ID = IN_EMP_ID;
    
    UPDATE DEPARTMENTS
       SET EMP_TOTAL = EMP_TOTAL - 1
     WHERE DEPARTMENT_ID = VAR_DEPT_ID;
    
    COMMIT;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('해당 사원이 존재하지 않습니다.');
        ROLLBACK;
END;

BEGIN
	 PROC_DEL_EMPLOYEE(214);
END;

SELECT* FROM EMPLOYEES;

-- TRIGGER INSERT
CREATE OR REPLACE TRIGGER TRI_ADD_EMPLOYEE
AFTER INSERT ON EMPLOYEES FOR EACH ROW 
BEGIN 	
	UPDATE DEPARTMENTS
		 SET  EMP_TOTAL = EMP_TOTAL +1
		 WHERE DEPARTMENT_ID = :NEW.DEPARTMENT_ID;
END;

SELECT * FROM USER_ERRORS;

INSERT INTO EMPLOYEES(EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL
										  , HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
						VALUES(214, '홍', '길동', 'HGILL'
										, SYSDATE, 4000, 'IT_PROG', 60);
										
SELECT * FROM EMPLOYEES  WHERE EMPLOYEE_ID  = 214;
SELECT * FROM DEPARTMENTS;

-- TRIGGER UPDATE 
CREATE OR REPLACE TRIGGER TRI_MOD_EMPLOYEE
AFTER UPDATE OF DEPARTMENT_ID ON EMPLOYEES FOR EACH ROW  
BEGIN 
	UPDATE DEPARTMENTS 
	SET EMP_TOTAL = EMP_TOTAL - 1 
	WHERE DEPARTMENT_ID = :OLD.DEPARTMENT_ID;
	
	UPDATE DEPARTMENTS
	SET EMP_TOTAL = EMP_TOTAL + 1
	WHERE DEPARTMENT_ID = :NEW.DEPARTMENT_ID;
END;

SELECT * FROM USER_ERRORS;

-- DELETE TRIGGER
CREATE OR REPLACE TRIGGER TRI_DEL_EMPLOYEE
AFTER UPDATE OF DEPARTMENT_ID ON EMPLOYEES FOR EACH ROW  
BEGIN 
	UPDATE DEPARTMENTS 
	SET EMP_TOTAL = EMP_TOTAL - 1 
	WHERE DEPARTMENT_ID = :OLD.DEPARTMENT_ID;
END;
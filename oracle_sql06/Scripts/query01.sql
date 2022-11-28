/*
 * PL/SQL
 * 		- Procedural Language extesion to SQL
 * 		- SQL 문자에서 변수의 정의, 조건문, 반복문 등의 프로그램밍이 
 * 		  가능한 기능을 지원하는 것 
 * 	
 * PL/SQL 구조
 * 
 * DECLARE
 * 		- 변수 정의 영역(생략 가능)
 * BEGIN
 * 		- 실행 영역 
 * END;	
 * EXCEPTION
 * 		- 예외처리 영역 (생략 가능) 
 * END;
 *  / (SQL PLUS 작성 시 필수, 디비버 작성 시에는 작성하지 않음 ) 
*/
/* DBeaver 에서는 적용 안됨 sqlplus 에서 출력 기능을 사용하기 위해 필요함 */
SET SERVEROUTPUT ON;

BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END;

/*
 * 기본 변수 사용 방법
 */
DECLARE
	x NUMBER =: 10;
	y NUMBER =: 20;
BEGIN 
	DBMS_OUTPUT.PUT_LINE(x + y);
END;

DECLARE
	n1 NUMBER;
	n2 NUMBER;
BEGIN 
	n1 := 10;
	n2 := 20;
	DBMS_OUTPUT.PUT_LINE(n1 + n2);
END;

/*
 * 조회 구문 사용하기
*/
DECLARE
		EMP_ID NUMBER;
		FNAME VARCHAR2(30);
		LNAME VARCHAR2(30);
BEGIN 
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME 
		INTO EMP_ID, FNAME, LNAME
	   FROM EMPLOYEES
	 WHERE EMPLOYEE_ID = 100;
	DBMS_OUTPUT.PUT_LINE(EMP_ID || '|' || FNAME || '|' || LNAME);
END;

DECLARE
		EMP_ID NUMBER;
		FNAME VARCHAR2(30);
		LNAME VARCHAR2(30);
BEGIN 
	SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME 
		INTO EMP_ID, FNAME, LNAME
	   FROM web_admin.EMPLOYEES
	 WHERE EMPLOYEE_ID = :ID;  /*SQLplus 에서는 &ID 형식으로 사용해야함*/
	DBMS_OUTPUT.PUT_LINE(EMP_ID || '|' || FNAME || '|' || LNAME);
END;

/*
 * IF 문 사용하기 
 */
DECLARE
		NUM NUMBER;
BEGIN
		NUM := :NUM;
		IF(NUM > 10) THEN 
				DBMS_OUTPUT.PUT_LINE('변수 NUM 에 저장된 값은 10보다 큽니다.');
		END IF;
END;


DECLARE
		NUM NUMBER;
BEGIN
		NUM := :NUM;
		IF(NUM > 10) THEN 
				DBMS_OUTPUT.PUT_LINE('변수 NUM 에 저장된 값은 10보다 큽니다.');
		ELSE IF(NUM = 10) THEN
				DBMS_OUTPUT.PUT_LINE('변수 NUM 에 저장된 값은 10 입니다.');
		ELSE 
				DBMS_OUTPUT.PUT_LINE('변수 NUM 에 저장된 값은 10보다 작습니다.');
		END IF;
END;


/*
 * 반복문 사용하기 
 */
BEGIN
	FOR N IN 1..5 LOOP 
			DBMS_OUTPUT.PUT_LINE(N);		
	END LOOP;
END;

BEGIN
	FOR N IN REVERSE 1..5 LOOP 
			DBMS_OUTPUT.PUT_LINE(N);		
	END LOOP;
END;

DECLARE
		NUM NUMBER := 0;
BEGIN 
		LOOP
				NUM := NUM + 1;
				DBMS_OUTPUT.PUT_LINE(NUM);
				IF NUM > 5 THEN 
						EXIT;
				END IF;
		END LOOP;
END;

DECLARE
	NUM NUMBER := 0;
BEGIN
	WHILE NUM < 5 LOOP
			NUM := NUM + 1;
			DBMS_OUTPUT.PUT_LINE(NUM);
		END LOOP;
END;

/*
 * 테스트용 테이블을 생성 후 데이터 추가/ 수정/ 삭제 하기
 */
CREATE TABLE TEST(
		  ID NUMBER PRIMARY KEY
		,  NAME VARCHAR2(30)
		,  AGE NUMBER
);
-- 예외 문구 발생시키기 
DECLARE
		VID NUMBER;
		NAME VARCHAR2(30);
		AGE NUMBER;
		CNT NUMBER;
BEGIN 
		VID := :ID;
		NAME := :NAME; /*작음 따옴표를 입력 창에 직접 입력할 것 PLSQL 에서는 '&NAME' 이 되기 때문에 필요 없음*/
	 	AGE := :AGE;
  	     SELECT COUNT(ID)
		 INTO CNT
		 FROM TEST 
		 WHERE ID = VID;
			 IF(CNT = 1) THEN 
	 				DBMS_OUTPUT.PUT_LINE('동일한 ID 가 존재합니다. ');
			ELSE 
			INSERT INTO TEST VALUES(VID, VNAME,VAGE);
		COMMIT;
	END IF;
END;

SELECT * FROM TEST;


-- EXCEPTION으로 중복 예외 처리하기 
DECLARE
		VID NUMBER;
		NAME VARCHAR2(30);
		AGE NUMBER;
BEGIN 
		VID := :ID;
		NAME := :NAME; /*작음 따옴표를 입력 창에 직접 입력할 것 PLSQL 에서는 '&NAME' 이 되기 때문에 필요 없음*/
	 	AGE := :AGE;
	 	INSERT INTO TEST VALUES(VID, NAME, AGE);
	 	COMMIT;
EXCEPTION
		WHEN DUP_VAL_ON_INDEX 
		THEN DBMS_OUTPUT.PUT_LINE('중복값이 있습니다.'); 
		ROLLBACK;
END;

-- 중복된 값 있으면 중복 값 위에 새로운 값으로 덮어쓰기 
SELECT * FROM TEST;

DECLARE
		VID NUMBER;
		VNAME VARCHAR2(30);
		VAGE NUMBER;
BEGIN 
		VID := :ID;
		VNAME := :NAME; /*작음 따옴표를 입력 창에 직접 입력할 것 PLSQL 에서는 '&NAME' 이 되기 때문에 필요 없음*/
	 	VAGE := :AGE;
	 	INSERT INTO TEST VALUES(VID,VNAME, VAGE);
	 	COMMIT;
EXCEPTION
		WHEN DUP_VAL_ON_INDEX 
		THEN 
				UPDATE TEST 
				SET NAME = VNAME
				 	,   AGE = VAGE
				 WHERE ID = VID;
		COMMIT;
END;

SELECT * FROM TEST;

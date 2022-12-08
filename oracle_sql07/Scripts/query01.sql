/*
 * 다음의 테이블을 생성한다. 
 * 		- 회원 테이블 : 회원으로 가입된 사용자 정보가 기록되는 테이블 
 * 		- 회원 요청 테이블 : 회원 가입을 위해 가입 요청을 한 사용자의 정보가 기록되는 테이블 
 * 		- 접속 이력 테이블 : 로그인 및 로그아웃한 회원의 접속 시간을 기록하기 위한 테이블 
 * 		
 *   1. 회원 가입 요청에는 최소한 "닉네임" 과 "이메일" 정보가 필요합니다. 
 *   2. 관리자가 회원 가입을 승낙하면 회원 가입 요청 테이블의 데이터를 기반으로 회원 테이블의 
 * 		데이터가 생성됩니다. 
 *   3. 회원 테이블의 데이터가 생성될 때 초기 패스워드로 "samplepassword" 가 저장되어야 합니다. 
 * 	4.  회원은 닉네임과 패스워드를 사용하여 로그인을 할 수 있으며 로그인 기록은 접수 이력 테이블에 
 * 		저장되어야 합니다. (로그아웃도 접속 이력 테이블에 저장되어야 합니다.)
 *   5.   접속 이력 정보는 최소한 누가, 언제, 접속 했는지 또는 접속 해제 했는지 기록될 수 있어야 합니다. 
 * 	6.  회원 테이블에 최근 로그인 날짜를 기록하여 로그인을 할 때 마다 "n일 만에 다시 접속하셨습니다." 
 * 		또는 "n개월 만에 다시 접속하셨습니다." 와 같은 정보가 생성될 수 있게 합니다. 
*/
-- 요청한 사용자에 대한 승낙 . 누가 요청했는지 확인해야함 최근 사용자 정보조회 쿼리문 필요 

-- 회원테이블 
CREATE TABLE ACCOUNTS (
				ID NUMBER 			PRIMARY KEY
			, 	NICKNAME VARCHAR2(50)	UNIQUE
			,	EMAIL VARCHAR2(75)
			, 	PASSWORD VARCHAR2(100) NOT NULL
			,	LOGINDATE DATE
);
CREATE SEQUENCE SEQ_ACCOUNTS NOCACHE;

-- 회원가입요청테이블 
CREATE TABLE  REQ_ACCOUNTS (
			 	ID NUMBER PRIMARY KEY
			,	NICKNAME VARCHAR2(50) UNIQUE 
			,	EMAIL VARCHAR2(75) UNIQUE
			,	ISALLOWED CHAR(1) DEFAULT('P') CHECK(ISALLOWED IN ('N', 'Y', 'P'))
			,	REQDATE DATE DEFAULT(SYSDATE)
);

CREATE SEQUENCE SEQ_REQ_ACCOUNTS NOCACHE;

-- 접속이력테이블 
CREATE TABLE ACCOUNT_ACCESS_LOGS(
				ID NUMBER PRIMARY KEY
			,	AID NUMBER REFERENCES ACCOUNTS(ID)
			, 	LOGTYPE VARCHAR2(8) CHECK(LOGTYPE IN ('LOGIN', 'LOGOUT'))
			,	LOGDATE DATE DEFAULT(SYSDATE)
);

CREATE SEQUENCE SEQ_ACCOUNT_ACCESS_LOGS NOCACHE;

INSERT INTO REQ_ACCOUNTS(ID, NICKNAME, EMAIL)
			VALUES(SEQ_REQ_ACCOUNTS.NEXTVAL, '홍길동', 'hong@gmail.com');
INSERT INTO REQ_ACCOUNTS(ID, NICKNAME, EMAIL)
			VALUES(SEQ_REQ_ACCOUNTS.NEXTVAL, '최가영', 'chio@gmail.com');
INSERT INTO REQ_ACCOUNTS(ID, NICKNAME, EMAIL)
			VALUES(SEQ_REQ_ACCOUNTS.NEXTVAL, '이정후', 'lee@gmail.com');
INSERT INTO REQ_ACCOUNTS(ID, NICKNAME, EMAIL)
			VALUES(SEQ_REQ_ACCOUNTS.NEXTVAL, '테스트1', 'test@gmail.com');
		

COMMIT;
SELECT * FROM REQ_ACCOUNTS;

-- 회원 가입 승낙을 위한 회원 요청 데이터 조회
SELECT ID 
			, NICKNAME
			, EMAIL
			, ISALLOWED
FROM REQ_ACCOUNTS
WHERE ISALLOWED = 'P';

-- 회원 가입 승낙 처리 
UPDATE REQ_ACCOUNTS
SET ISALLOWED = 'Y'
WHERE ISALLOWED = 'P' AND ID = 4;

UPDATE REQ_ACCOUNTS
SET ISALLOWED = 'Y'
WHERE ISALLOWED = 'P' AND ID IN (5, 6);

ROLLBACK;

-- 회원 가입 승낙 처리 된 데이터를 회원 테이블에 추가
-- REQ_ACCOUNTS 의 ID 와 ACCOUNTS의 ID 는 매치가 안되도 괜찮
INSERT INTO ACCOUNTS(
			SELECT SEQ_ACCOUNTS.NEXTVAL
						, RA.NICKNAME
						, RA.EMAIL
						, 'samplepassword'
						, NULL
			FROM REQ_ACCOUNTS RA
			LEFT OUTER JOIN ACCOUNTS A
			ON RA.NICKNAME = A.NICKNAME
			AND RA.EMAIL = A.EMAIL
			WHERE RA.ISALLOWED = 'Y'
			AND A.ID IS NULL
);

-- 회원이 로그인 요청을 할 때 닉네임과 암호 확인 하기 위한 조회
SELECT  ID
			, NICKNAME
			, PASSWORD
			, LOGINDATE
FROM ACCOUNTS 
WHERE NICKNAME = '최가영'
AND PASSWORD = 'samplepassword';

-- 위 아래 다 조회구문  
SELECT COUNT(*)
FROM ACCOUNTS 
WHERE NICKNAME = '최가영'
AND PASSWORD = 'password';

-- 회원 확인 후 최근 로그인 시간 기록  (LOG 테이블 포함)
UPDATE ACCOUNTS 
SET LOGINDATE = SYSDATE
WHERE NICkNAME = '최가영'
AND PASSWORD = 'samplepassword';

--회원의 ID 조회를 위한 구문 
INSERT INTO ACCOUNT_ACCESS_LOGS VALUES(SEQ_ACCOUNT_ACCESS_LOGS.NEXTVAL, 6, 'LOGIN', SYSDATE);

INSERT INTO ACCOUNT_ACCESS_LOGS VALUES(SEQ_ACCOUNT_ACCESS_LOGS.NEXTVAL
																		,(SELECT ID FROM ACCOUNTS WHERE NICKNAME = '최가영'
																		AND PASSWORD = 'samplepassword')
																		, 'LOGIN', SYSDATE);
-- AID : 9 찾기 
SELECT * 
FROM ACCOUNT_ACCESS_LOGS AAL
JOIN ACCOUNTS A 
ON AAL.AID = A.ID;

SELECT * FROM ACCOUNTS;
SELECT * FROM ACCOUNT_ACCESS_LOGS;

-- 회원 테이블과 동일한 계정일 경우 회원테이블의 로그인 시간 기록하기 

-- 로그 아웃 할  때 LOG 테이블에 기록
INSERT INTO ACCOUNT_ACCESS_LOGS VALUES(SEQ_ACCOUNT_ACCESS_LOGS.NEXTVAL, 6, 'LOGOUT', SYSDATE);
SELECT * FROM ACCOUNT_ACCESS_LOGS;

-- 로그인을 한 회원의 정보를 조회 할  때 몇 분 또는 몇 시간, 일, 개월, 년 만에 접속을 했는지 포함하여 조회 
SELECT CASE WHEN BEFORE_HOUR = 0 THEN
                TO_CHAR(BEFORE_MINUTE) || '분'
            WHEN BEFORE_DAY = 0 THEN
                TO_CHAR(BEFORE_HOUR) || '시간 ' ||
                TO_CHAR(BEFORE_MINUTE - (BEFORE_HOUR * 60)) || '분'
            WHEN BEFORE_MONTH = 0 THEN
                TO_CHAR(BEFORE_DAY) || '일 ' ||
                TO_CHAR(BEFORE_HOUR - (BEFORE_DAY * 24)) || '시간 ' ||
                TO_CHAR(BEFORE_MINUTE - ((BEFORE_DAY * 24 + BEFORE_HOUR - BEFORE_DAY * 24) * 60)) || '분'
            WHEN BEFORE_YEAR = 0 THEN
                TO_CHAR(BEFORE_MONTH) || '개월'
            ELSE
                TO_CHAR(BEFORE_YEAR) || '년 ' ||
                TO_CHAR(BEFORE_MONTH - BEFORE_YEAR * 12) || '개월'
         END AS X
  FROM (SELECT FLOOR(SYSDATE - TO_DATE('20221113', 'YYYYMMDD')) AS BEFORE_DAY
             , FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('20221113', 'YYYYMMDD'))) AS BEFORE_MONTH
             , FLOOR(MONTHS_BETWEEN(SYSDATE, TO_DATE('20221113', 'YYYYMMDD')) / 12) AS BEFORE_YEAR
             , FLOOR(TO_NUMBER(SYSDATE - TO_DATE('20221113', 'YYYYMMDD')) * 24) AS BEFORE_HOUR
             , FLOOR(TO_NUMBER(SYSDATE - TO_DATE('20221113', 'YYYYMMDD')) * 24 * 60) BEFORE_MINUTE
          FROM DUAL)
;

-- 회원이 암호 변경 요청을 했을 때 암호를 변경하기 위한 수정 구문 
UPDATE ACCOUNTS 
SET PASSWORD = 'replace'
WHERE NICKNAME = '최가영' AND PASSWORD = 'samplepassword';

SELECT * FROM ACCOUNTS;

-- 회원이 암호를 변경할 때 현재 사용했던 암호가 새로운 암호에 포함되지 않게 하기 위한 구문 
UPDATE ACCOUNTS 
SET PASSWORD ! = (SELECT PASSWORD
						   FROM ACCOUNTS
						   WHERE ID = 6 AND NICKNAME = '최가영')
WHERE NICKNAME = '최가영'  AND PASSWORD = 'samplepassword';








-- 회원테이블에 로그인하기
CREATE OR REPLACE PROCEDURE PROC_LOGIN(
			IN_회원아이디 IN VARCHAR2
		,	IN_회원패스워드 IN VARCHAR2
)
IS 
BEGIN
	IF EXISTS_USER = 0 THEN 
		DBMS_OUTPUT.PUT_LINE('해당 회원이 존재하지 않습니다.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('해당 회원이 존재합니다.');
END;


SELECT * FROM REQ_ACCOUNTS;
SELECT * FROM ACCOUNTS;
SELECT * FROM ACCOUNT_ACCESS_LOGS;

CREATE OR REPLACE FUNCTION FUNC_SAMPLE(
	NUM1 NUMBER 
	, STR1 VARCHAR2
) RETURN VARCHAR2
IS 
BEGIN 
		로직
		RETURN RES;
END;

SELECT * FROM USER_ERRORS;

/*
 * 지출내역서(가계부)를 위한 테이블을 만들어 본다. 
 * 			- 테이블 이름은 '지출내역서'로 한다. 
 * 			- 컬럼은 ID, 날짜, 출입구분, 금액, 비고 로 만들어 사용한다. 
 * 			- 비고의 경우 한글 100자까지 저장 가능하게 한다. 
 * 			- 출입구분은 '출', '입' 만 사용 가능하게 한다. 
 * 			- ID 는 해당 Record 를 식별하기 위한 식별자로 사용할 것이다. 
 * 
*/

CREATE TABLE TEST5 (
			  COL1 NUMBER 				
			, COL2 DATE
			, COL3 VARCHAR2(10)
			, COL4 NUMBER
			, COL5 VARCHAR2(10)
);

ALTER TABLE TEST5 RENAME TO 지출내역서;
SELECT * FROM USER_TABLES WHERE TABLE_NAME LIKE '지출%';

ALTER TABLE 지출내역서 RENAME COLUMN COL1 TO ID;
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME ='지출내역서';

ALTER TABLE 지출내역서 RENAME COLUMN COL2 TO 날짜;
ALTER TABLE 지출내역서 RENAME COLUMN COL3 TO 출입구분;
ALTER TABLE 지출내역서 RENAME COLUMN COL4 TO 금액;
ALTER TABLE 지출내역서 RENAME COLUMN COL5 TO 비고;
SELECT * FROM USER_TAB_COLUMNS WHERE TABLE_NAME ='지출내역서';

ALTER TABLE 지출내역서 ADD CONSTRAINT 지출내역서_PK PRIMARY KEY(ID);
ALTER TABLE 지출내역서 MODIFY 출입구분 CONSTRAINT 지출내역서_CK CHECK(출입구분 IN('출', '입'));
ALTER TABLE 지출내역서 MODIFY 비고 VARCHAR(30);
SELECT * FROM USER_CONSTRAINTS  WHERE TABLE_NAME = '지출내역서';

DROP TABLE 지출내역서;
/*
 * 강사님 코드 
*/
CREATE TABLE 지출내역서(
			ID NUMBER							/*CONSTRAINT 지출내역서_ID_PK PRIMARY KEY*/
		,	날짜 DATE
		, 	출입구분 CHAR(3)					/*CONSTRAINT 지출내역서_출입구분_CK CHECK(출입구분 IN('출',  '입'))*/
		, 	금액 NUMBER
		, 	비고 VARCHAR(100 CHAR)
		/*,  	CONSTRAINT 지출내역_ID_PK PRIMARY KEY(ID) */
		/*,	CONSTRAINT 지출내역_출입구분_CK CHECK(출입구분 IN('출', '입')) */
);

ALTER TABLE 지출내역서 ADD CONSTRAINT 지출내역서_ID_PK PRIMARY KEY(ID);
ALTER TABLE 지출내역서 ADD CONSTRAINT 지출내역서_출입구분_CK CHECK(출입구분 IN('출', '입'));

DROP TABLE 지출내역서;

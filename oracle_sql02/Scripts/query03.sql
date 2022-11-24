/*
 * DML :  데이터 조작어 
 * 			테이블에 데이터를 추가(INSERT), 수정(UPDATE), 삭제(DELETE) 하기 위한 
 * 			명령을 제공한다.
 * INSERT 
 * 		INSERT INTO <테이블명> VALUES(값1, 값2, 값3, ...);
 * 		주의 : 테이블의 컬럼 갯수와 순서가 VALUES 에 작성하는 값의 갯수와 순서가 매치되어야 한다. 
 * 
 * 		INSERT INTO <테이블명> (컬럼명1, 컬럼명2,..) VALUES(값1, 값2, ...);
 * 		주의 : 명시한 컬럼명과 VALUES의 값이 순서대로 매치되어야 한다. 
 * 		
 * UPDATE
 * 		UPDATE <테이블명> SET <컬럼명> = <값>;
 * 		주의 : 별도의 조건을 명시하지 않으면 테이블의 모든 Record 의 컬럼값이 수정된다. 
 * 
 * 		WHERE 절로 조건 부여 
 * 		UPDATE <테이블명> SET<컬럼명> = <값> WHERE <컬럼명> <연산자> <값>;
 * 		참고 : WHERE 절을 사용하여 데이터를 수정할 Record 를 선택할 수 있다. 
 * 
 * 		, 를 이용하여 여러 개의 컬럼 값 업데이트 가능 
 * 		UPDATE<테이블명> SET<컬럼명1> = <값1>, <컬럼명2> = <값2>; 
 * 		참고 : 여러 컬럼 값을 한번에 수정할 수 있다. 
 * 
 * DELETE
 * 		DELETE FROM <테이블명>;
 * 		주의 : 테이블의 모든 Record가 삭제된다.
 * 
 * 		UPDATE FROM <테이블명> WHERE <컬럼명>  <연산자> <값>;
 * 		참고  : WHERE절을 사용하여 데이터를 삭제할  Record 를 선택 할 수 있다. 
*/

CREATE TABLE 지출내역서(
			ID NUMBER							
		,	날짜 DATE
		, 	출입구분 CHAR(3)					
		, 	금액 NUMBER
		, 	비고 VARCHAR(100 CHAR)
		, 	CONSTRAINT 지출내역서_ID_PK PRIMARY KEY(ID)
		, 	CONSTRAINT 지출내역서_출입구분_CK CHECK(출입구분 IN('출', '입'))
);

INSERT INTO 지출내역서 VALUES(1, TO_DATE('20221101', 'YYYYMMDD'), '출', 1000, '식비');
INSERT  INTO 지출내역서(ID, 날짜, 출입구분, 금액, 비고)
							VALUES(2, TO_DATE('20221101', 'YYYYMMDD'), '출', 4000, 'GS25시 - 아메리카노 음료');
						
UPDATE 지출내역서 SET 금액 = 9000;
UPDATE 지출내역서 SET 금액 = 10000 WHERE ID = 1;
UPDATE 지출내역서 SET 금액 = 4000 WHERE ID = 2;
UPDATE 지출내역서 SET 금액 = 9000, 비고 = '식비 - 순대국' WHERE ID = 1;
UPDATE 지출내역서 SET 금액 = 금액 + 1000;

DELETE FROM 지출내역서 WHERE ID = 1;
DELETE FROM 지출내역서 WHERE 출입구분 = '출';

SELECT * FROM  지출내역서;








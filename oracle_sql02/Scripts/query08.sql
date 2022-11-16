/*
 * 가계부 작성을 위한 테이블을 생성하고 테이터를 추가하세요.
 * 
 * 가계부 테이블은 ID, 입금/출금구분, 금액, 날짜, 지출구분, 비고 정보가 저장될 수 있도록 합니다.
 * 	- ID 는 레코드를 식별하기 위한 식별 값으로 사용합니다. 
 *	- 입금/출금구분은 입금의 경우 'I', 출금의 경우 '0'으로 사용합니다.
 * 	- 지출구분은 식비, 교통비, 물품구입비 등 정해진 항목안에서 사용할 수 있게 합니다. 
 * 	  정해진 항목 안에서 사용할 수 있도록 지출구분 테이블을 별로로 만들어 참조할 수 있게 합니다.
 * 	- 비고에는 지출구분으로 작성할 수 없는 좀 더 상세한 내용을 작성하기 위해 사용합니다. 
 * 
 * 지출구분 테이블은 CODE, 항목 정보가 저장 될 수 있도록 합니다. 
 * 	- CODE 는 지출항목에 대응할 수 있는 5자리 영문자값으로 사용합니다. 
 * 	- 항목에는 식비, 교통비, 통신비 등 정해진 값을 작성합니다. 
 * 
 * 최근 1년간의(월마다 최소 5개 데이터를 뽑아서 ) 지출내역을 참고하여 데이터를 추가해봅니다.  
 * 
 * 모든 데이터를 추가 후에는 다음의 작업을 추가로 진행 합니다. 
 * 	1. 월별 지출액 합계 구하기.
 * 	2. 월별 지출항목별 합계를 구하세요. 
 * 	3. 고정지출비 테이블을 별도로 생성하여 식비, 교통비, 통신비에 해당하는 항목들만 따로 저장하기.
 * 	4. 통신비로 추가한 항목을 세분화하여 통신비(기기값) 항목을 새로 추가하고 모든 통신비에 통신비(기기값)에 
 * 		해당하는 비용을 따로 추가하도록 합니다. (기존 통신비에는 통신비(기기값)에 해당하는 금액을 제합니다.)
 * 		정해진 기기값이 없으면 통신비의 40% 가 기기값인 것으로 하세요. 
*/

CREATE TABLE 가계부 (
		ID NUMBER											
	,	입금출금구분 CHAR(10)
	,	금액 NUMBER
	, 	날짜 DATE
	,	지출구분 VARCHAR2(10 CHAR)					
	,	비고 VARCHAR2(10 CHAR)
);

ALTER TABLE 가계부 ADD CONSTRAINT 가계부_PK PRIMARY KEY(ID);
ALTER TABLE 가계부 MODIFY 입금출금구분 CONSTRAINT 가계부_CK CHECK(입금출금구분 IN('I', '0'));
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = '가계부';
ALTER TABLE 가계부 ADD CONSTRAINT 가계부_FK FOREIGN KEY(지출구분) REFERENCES 지출구분(항목);

CREATE TABLE 지출구분 (
		  CODE CHAR(10)
		, 항목 VARCHAR(10 CHAR) 
);

INSERT INTO 지출구분 VALUES ('FOOD', '식비');
INSERT INTO 지출구분 VALUES ('BUS', '교통비');
INSERT INTO 지출구분 VALUES ('PHONE', '통신비');
INSERT INTO 지출구분 VALUES ('THING', '물품구입비');
ALTER TABLE 지출구분 ADD CONSTRAINT 지출구분_PK PRIMARY KEY(항목);

SELECT * FROM 가계부;
DELETE FROM 가계부 WHERE ID = 2;


INSERT INTO 가계부 (ID, 입금출금구분, 금액, 날짜, 지출구분, 비고)
VALUES((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부) , 'I', 3000, TO_DATE('20220101', 'YYYYMMDD'), '식비', '붕어빵');
			()
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 45000, TO_DATE('20220115', 'YYYYMMDD'), '통신비', '핸드폰비용')
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 5000, TO_DATE('20220130', 'YYYYMMDD'), '물품구입비', '다이소')
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 4000, TO_DATE('20220131', 'YYYYMMDD'), '식비', '김밥')
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 5000, TO_DATE('20220201', 'YYYYMMDD'), '식비', '라면')
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 6500, TO_DATE('20220205', 'YYYYMMDD'), '교통비', '택시')
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 45500, TO_DATE('20220215', 'YYYYMMDD'), '통신비', '핸드폰비용')
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 15000, TO_DATE('20220225', 'YYYYMMDD'), '물품구입비', '쿠팡')
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 20000, TO_DATE('20220226', 'YYYYMMDD'), '식비', '치킨')
			
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 20000, TO_DATE('20220303', 'YYYYMMDD'), '식비', '치킨')
			((SELECT NVL(MAX(ID), 0) + 1 FROM 가계부), 'I', 20000, TO_DATE('20220205', 'YYYYMMDD'), '식비', '치킨')
			
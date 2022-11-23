/*
* EMPLOYEES의 HIRE_DATE 열의 값을 + 10 년 하여 수정한다.
*/

UPDATE EMPLOYEES
SET HIRE_DATE = ADD_MONTHS(HIRE_DATE, 120); 

SELECT HIRE_DATE FROM EMPLOYEES;

/*
 * JOBS 테이블과 동일한 구조의 KJOBS 테이블을 만들고 JOB_TITLE 열의 값을 
 * 한글로 번역하여 수정한다.
 * 단, MIN_SALARY, MAX_SALARY 컬럼은 만들 필요 없음.
*/
SELECT *
FROM JOBS;

CREATE TABLE KJOBS (
		  JOB_ID VARCHAR2(10)
		, JOB_TITLE VARCHAR2(50)
		, KJOB_TITLE VARCHAR2(50)
);

INSERT INTO KJOBS(JOB_ID, JOB_TITLE)
SELECT JOB_ID, JOB_TITLE
FROM JOBS;

UPDATE KJOBS SET KJOB_TITLE = '사장' WHERE JOB_TITLE = 'President';
UPDATE KJOBS SET KJOB_TITLE = '행정부사장' WHERE JOB_TITLE = 'Administration Vice President';
UPDATE KJOBS SET KJOB_TITLE = '행정보조' WHERE JOB_TITLE = 'Administration Assistant';
UPDATE KJOBS SET KJOB_TITLE = '재무관리자' WHERE JOB_TITLE = 'Finance Manager';
UPDATE KJOBS SET KJOB_TITLE = '회계사' WHERE JOB_TITLE = 'Accountant';
UPDATE KJOBS SET KJOB_TITLE = '회계관리자' WHERE JOB_TITLE = 'Accounting Manager';
UPDATE KJOBS SET KJOB_TITLE = '공인회계사' WHERE JOB_TITLE = 'Public Accountant';
UPDATE KJOBS SET KJOB_TITLE = '영업관리자' WHERE JOB_TITLE = 'Sales Manager';
UPDATE KJOBS SET KJOB_TITLE = '영업담당자' WHERE JOB_TITLE = 'Sales Representative';
UPDATE KJOBS SET KJOB_TITLE = '구매담당자' WHERE JOB_TITLE = 'Purchasing Manager';
UPDATE KJOBS SET KJOB_TITLE = '구매사무원' WHERE JOB_TITLE = 'Purchasing Clerk';
UPDATE KJOBS SET KJOB_TITLE = '재고관리자' WHERE JOB_TITLE = 'Stock Manager';
UPDATE KJOBS SET KJOB_TITLE = '재고담당자' WHERE JOB_TITLE = 'Stock Clerk';
UPDATE KJOBS SET KJOB_TITLE = '배송담당자' WHERE JOB_TITLE = 'Shipping Clerk';
UPDATE KJOBS SET KJOB_TITLE = '프로그래머' WHERE JOB_TITLE = 'Programmer';
UPDATE KJOBS SET KJOB_TITLE = '마켓팅매니저' WHERE JOB_TITLE = 'Marketing Manager';
UPDATE KJOBS SET KJOB_TITLE = '마켓팅담당자' WHERE JOB_TITLE = 'Marketing Representative';
UPDATE KJOBS SET KJOB_TITLE = '인사담당자' WHERE JOB_TITLE = 'Human Resources Representative';
UPDATE KJOBS SET KJOB_TITLE = '홍보담당자' WHERE JOB_TITLE = 'Public Relations Representative';

SELECT * FROM KJOBS;

/*
 * DEPARTMETN 테이블에 DEPARTMENT_NAME_KR 컬럼을 추가 후 DEARTMENT_NAME 을
 * 한글로 번역한 데이터가 수정되게 한다. 
 */
ALTER TABLE DEPARTMENTS ADD DEPARTMENT_NAME_KR VARCHAR2(50);

UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '관리' WHERE DEPARTMENT_NAME = 'Administration';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '마켓팅' WHERE DEPARTMENT_NAME = 'Marketing';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '구매' WHERE DEPARTMENT_NAME = 'Purchasing';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '인사' WHERE DEPARTMENT_NAME = 'Human Resources';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '배송' WHERE DEPARTMENT_NAME = 'Shipping';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = 'IT' WHERE DEPARTMENT_NAME = 'IT';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '공공관계' WHERE DEPARTMENT_NAME = 'Public Relations';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '판매' WHERE DEPARTMENT_NAME = 'Sales';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '경영' WHERE DEPARTMENT_NAME = 'Executive';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '재정' WHERE DEPARTMENT_NAME = 'Finance';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '회계' WHERE DEPARTMENT_NAME = 'Accounting';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '국고' WHERE DEPARTMENT_NAME = 'Treasury';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '법인세' WHERE DEPARTMENT_NAME = 'Corporate Tax';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '신용' WHERE DEPARTMENT_NAME = 'Control And Credit';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '주주서비스' WHERE DEPARTMENT_NAME = 'Shareholder Services';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '이익' WHERE DEPARTMENT_NAME = 'Benefits';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '제조' WHERE DEPARTMENT_NAME = 'Manufacturing';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '건설' WHERE DEPARTMENT_NAME = 'Construction';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '계약' WHERE DEPARTMENT_NAME = 'Contracting';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '운영' WHERE DEPARTMENT_NAME = 'Operations';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = 'IT지원' WHERE DEPARTMENT_NAME = 'IT Support';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '네트워크운영' WHERE DEPARTMENT_NAME = 'NOC';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = 'IT Helpdesk' WHERE DEPARTMENT_NAME = 'IT Helpdesk';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '정부판매' WHERE DEPARTMENT_NAME = 'Government Sales';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '소매판매' WHERE DEPARTMENT_NAME = 'Retail Sales';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '채용' WHERE DEPARTMENT_NAME = 'Recruiting';
UPDATE  DEPARTMENTS SET DEPARTMENT_NAME_KR = '급여' WHERE DEPARTMENT_NAME = 'Payroll';

SELECT  * FROM DEPARTMENTS;
/*
 * KJOB 테이블에 한글로 번역한 직무 타이틀을 JOBS 테이블에 JOB_TITLE_KR 컬럼을 
 * 추가 후 수정이 되도록 한다. (DEPARTMENTS 테이블처럼 하나의 테이블에 영문/ 한글이 
 * 모두 들어가게 한다. ) 모든 작업을 완료 후 KJOBS 테이블은 제거한다. 
 */

ALTER TABLE JOBS ADD JOB_TITLE_KR VARCHAR2(50);

UPDATE JOBS 
SET JOB_TITLE_KR = (SELECT KJOB_TITLE
								FROM KJOBS
								WHERE JOBS.JOB_ID = KJOBS.JOB_ID);
							
SELECT * FROM JOBS;

DROP TABLE KJOBS;
/*
 * JOBS 테이블에 다음의 데이터를 추가한다.(JOB_TITLE_KR 도 추가되어 있어야 함)
 * 		JOB_ID 		JOB_TITLE 				MIN_SALARY 		MAX_SALARY
 * 		IT_TIRN		Intern Programmer	 		3200					3800
 * 		SV_MGR		Server Manager			4000					10000
 * 		SV_ENG		Server Enginnner			6000					12000
 * 		NT_MGR		Network Manager			5000					11000
 * 		NT_ENG		Networt Engieer 			7000					13000
*/

INSERT INTO JOBS VALUES('IT_TIRN', 'Intern Programmer	', 3200, 3800, '인턴프로그래머');
INSERT INTO JOBS VALUES('SV_MGR', 'Server Manager', 4000, 10000, '서버매니저');
INSERT INTO JOBS VALUES('SV_ENG', 'Server Enginnner', 6000, 12000, '서버엔지니어');
INSERT INTO JOBS VALUES('NT_MGR', 'Network Manager', 5000, 11000, '네트워크매니저');
INSERT INTO JOBS VALUES('NT_ENG', 'Networt Engieer', 7000, 13000, '네트워크엔지니어');

SELECT * FROM JOBS;

/*
 * DEPARTMENTS 테이블에 다음의 데이터를 추가한다.(DEPARTMENT_NAME_KR 도 추가되어 있어야 함)
 * 		 DEPARTMENT_ID 	DEPARTMENT_NAME 	MANAGER_ID 		LOCATION_ID
 * 		280						Server						NULL					3000
*		290						Network 						NULL					3000
*/

INSERT INTO DEPARTMENTS VALUES(280, 'Server', NULL, 3000, '서버관리');
INSERT INTO DEPARTMENTS VALUES(290, 'Network', NULL, 3000, '네트워크관리');

SELECT * FROM DEPARTMENTS;

INSERT INTO DEPARTMENTS VALUES(
			 (SELECT (MAX(DEPARTMENT_ID) + 10) FROM DEPARTMENTS)
			, 'Server'
			, NULL
			, 3000
			, '서버관리'

INSERT INTO DEPARTMENTS VALUES(
			 (SELECT (MAX(DEPARTMENT_ID) + 10) FROM DEPARTMENTS)
			, 'Network'
			, NULL
			, 3000
			, '네트워크관리부'
);
/*
 * 새로 신설된 Server, Network 부서를 위한 인력을 충원하고 있는 것으로 가정하여 각 부서마다
 * 3명의 인원을 EMPLOYEES 에 추가한다.(Manager 직무 1명, Engineer 직무 2명)
 * 			- 초기에 모든 인원은 JOBS 테이블의 MIN_SALARY 급여를 받는 것으로 한다. 
 * 			- Server, Network 부서에 인원을 추가 할 때 반드시 1명의 부서장이 필요하기 때문에 인원 중 1명을 
 * 			  부서장으로 만든다. (DEPARTMENTS 테이블의 MANAGER_ID를 설정한다. )
 * 			- 부서장으로 선택된 인원은 JOBS 테이블의 MIN_SALARY 급여에서 +2000 상승된 급여로 받을 수 있게
 * 			 데이터를 수정한다. 
 */
SELECT * FROM EMPLOYEES;

INSERT INTO EMPLOYEES(EMPLOYEE_ID,FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
					VALUES((SELECT MAX(EMPLOYEE_ID)+1 FROM EMPLOYEES )
								 , '철수', '김', 'KCHUL', SYSDATE
								 , (SELECT MIN_SALARY FROM JOBS WHERE JOB_ID = 'SV_MGR')
								 , 'SV_MGR', 280);

INSERT INTO EMPLOYEES(EMPLOYEE_ID,FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
					VALUES((SELECT MAX(EMPLOYEE_ID)+1 FROM EMPLOYEES )
								 , '영수', '박', 'PYOUNG', SYSDATE
								 , (SELECT MIN_SALARY FROM JOBS WHERE JOB_ID = 'SV_ENG')
								 , 'SV_ENG', 280);
								
INSERT INTO EMPLOYEES(EMPLOYEE_ID,FIRST_NAME, LAST_NAME, EMAIL, HIRE_DATE, SALARY, JOB_ID, DEPARTMENT_ID)
					VALUES((SELECT MAX(EMPLOYEE_ID)+1 FROM EMPLOYEES )
								 , '강석', '이', 'LKANG', SYSDATE
								 , (SELECT MIN_SALARY FROM JOBS WHERE JOB_ID = 'SV_ENG')
								 , 'SV_ENG', 280);
								
UPDATE DEPARTMENTS 
SET MANAGER_ID = (SELECT EMPLOYEE_ID
							 FROM EMPLOYEES
							 WHERE DEPARTMENT_ID = 280
							 	AND  FIRST_NAME = '철수'
							 	AND LAST_NAME = '김')
WHERE DEPARTMENT_ID = 280;

UPDATE EMPLOYEES
SET SALARY = SALARY + 20000
WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID		
									 FROM DEPARTMENTS 
									 WHERE DEPARTMENT_ID IN(280));
/*
 * 물가상승분을 반영하여 모든 급여 정보를 수정하려고 한다. 
 * JOBS 테이블과 EMPLOYEES 테이블의 모든 급여 정보를 기존보다 5 ~ 10 % 상승시키도록 한다. 
 * 		- 급여가 4000 미만인 경우 10% 상승
 * 		- 급여가 4000 이상 8000 미만인 경우 8 % 상승
 *  		- 급여가 8000 이상 12000 미만인 경우 6% 상승
 * 		- 급여가 12000 이상인 경우 5% 상승
 * 		- 정수 1번째 자리에서 절삭할 것. 예) 4333.333 은 4330 으로 절삭
 */
UPDATE JOBS
	  SET (MIN_SALARY, MAX_SALARY) = (SELECT CASE WHEN MIN_SALARY < 4000 THEN TRUNC(MIN_SALARY* 1.1, -1)
			 															    WHEN MIN_SALARY < 8000 THEN TRUNC(MIN_SALARY* 1.08, -1)
			 															    WHEN MIN_SALARY < 12000 THEN TRUNC(MIN_SALARY* 1.06, -1)
			 		  														ELSE TRUNC(MIN_SALARY* 1.05, -1)
			 															    END AS MIN_SALARY 
																	 , CASE WHEN MAX_SALARY < 4000 THEN TRUNC(MIN_SALARY* 1.1, -1)
			 																   WHEN MAX_SALARY < 8000 THEN TRUNC(MIN_SALARY* 1.08, -1)
			 																   WHEN MAX_SALARY < 12000 THEN TRUNC(MIN_SALARY* 1.06, -1)
			 													 			   ELSE TRUNC(MAX_SALARY* 1.05, -1)
			 																   END AS MAX_SALARY 
														 FROM JOBS J
														 WHERE J.JOB_ID = JOBS.JOB_ID);

-- 정수 1번째 자리에서 절삭 
SELECT TRUNC(1111, -1) FROM DUAL;

SELECT * FROM JOBS;

UPDATE EMPLOYEES 
	  SET SALARY  = (SELECT CASE WHEN SALARY < 4000 THEN TRUNC(SALARY * 1.1, -1)
			 										WHEN SALARY < 8000 THEN TRUNC(SALARY * 1.08, -1)
			 										WHEN SALARY < 12000 THEN TRUNC(SALARY * 1.06, -1)
			 		  		ELSE TRUNC(SALARY* 1.05, -1)
			 				END AS SALARY
							 FROM EMPLOYEES E
							WHERE E.EMPLOYEE_ID =  EMPLOYEES.EMPLOYEE_ID);

SELECT * FROM EMPLOYEES;


/*
  * 사내 공지를 위한 게시판 기능을 추가하려 한다. 다음의 요구사항에 맞추어 테이블을 생성하고
  * 첫번째 공지를 작성하도록 한다. (첫번째 공지는 모든 부서가 열람할 수 있게 한다.)
  * 			- 공지 게시판은 부서별 공지와전체 공지로 나누어져 운영돼야 한다. 
  * 			- 전체 공지는 모든 부서가 확인할 수 있는 공지이며 부서별 공지는 지정한 부서에 소속된
  * 			  사원만 볼 수 있는 공지이다. 
  * 			- 공지를 작성할 때 다음의 정보가 저장되어야 한다. 
  * 			 	번호, 제목, 내용, 작성일자, 부서ID
  */
CREATE TABLE NOTICE(
       ID NUMBER PRIMARY KEY
     , TITLE VARCHAR2(250) NOT NULL
     , CONTENT VARCHAR2(2000)
     , WRITE_DATE DATE
     , DEPT_ID NUMBER
);

INSERT INTO NOTICE VALUES(1, '전체 공지입니다.', '모든 부서에서 확인할 수 있습니다.', SYSDATE, 0);

SELECT * FROM NOTICE;

/*
 * 사내 공지 게시판 테이블을 생성 후에 다음의 공지를 추가로 작성한다.
 *     - 모든 부서마다 'xxx 부서만 확인할 수 있는 공지 입니다.' 라는 메시지를 추가한다.
 */
INSERT INTO NOTICE(
       SELECT ROWNUM + 1 AS ID
            , DEPARTMENT_NAME_KR || ' 부서 공지' AS TITLE
            , DEPARTMENT_NAME_KR || ' 부서만 확인할 수 있는 공지 입니다.' AS CONTENT
            , SYSDATE AS WRITE_DATE
            , DEPARTMENT_ID AS DEPT_ID
         FROM DEPARTMENTS
);
SELECT * FROM NOTICE;
/*
 * 100 번 사원이 공지를 열람한다는 가정하에 100 번 사원이 소속된 부서의 공지와 전체 공지가
 * 보일수 있는 SELECT 쿼리문을 작성하세요.
 */
-- 100번 사원이 조회/  추가로 전체 공지를 조회함
SELECT *
FROM NOTICE N
LEFT OUTER JOIN EMPLOYEES E 
ON N.DEPT_ID = E.DEPARTMENT_ID 
WHERE E.EMPLOYEE_ID = 100
OR N.DEPT_ID = 0;
/*
 * 공지 게시판에 중요도 기능을 추가하여 가장 중요한 공지가 가장 먼저 조회될 수 있도록 테이블을
 * 수정하도록 한다.
 *     - 중요도는 1 ~ 5 까지 사용할 수 있게 한다.
 *     - 중요도를 설정하지 않으면 기본 3으로 저장되게 한다.
 *     - 전체 공지용으로 중요도 1 ~ 5 까지 총 5개의 공지 데이터를 추가한다.
 *     - 추가한 공지 데이터를 조회할 때 중요도 순으로 조회가 될 수 있도록
 *       SELECT 구문을 작성한다.
 */
-- 테이블에 새로운 컬럼 ORD(중요도) 추가 (숫자 1개를 값을 가짐, 기본 3이라는 숫자로 세팅)
ALTER TABLE NOTICE ADD ORD NUMBER(1) DEFAULT(3);
-- ORD에 CHECK 로 제약 조건 설정, ORD는 1 ~ 5 사이 범위의 숫자만 가질 수 있다
ALTER TABLE NOTICE ADD CONSTRAINTS NOTICE_ORD_CK CHECK(ORD BETWEEN 1 AND 5);

-- 제약 조건 설정 되었는지 확인
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'NOTICE';

-- DEPT_ID = 0 번(전체공지)에게 ORD 1 번 부여 
UPDATE NOTICE 
SET ORD = 1
WHERE DEPT_ID = 0;

-- 사원 테이블과 공지 테이블을 부서 번호로 조인해서 사번이 100번 이거나 부서 번호가 0번인 레코드를 ORD 순으로 출력
SELECT *
FROM NOTICE N
LEFT OUTER JOIN EMPLOYEES E 
ON N.DEPT_ID = E.DEPARTMENT_ID 
WHERE E.EMPLOYEE_ID = 100
OR N.DEPT_ID = 0
ORDER BY ORD;
-- 중요도 동률일 경우 추가 정렬 방식 적용 ORDER BY ORD, ID;

SELECT * FROM NOTICE;


/*
 * DEPARTMENTS 테이블에서 MANAGER_ID 가 없는 부서는 제거하도록 한다. 
 * NOTICE 테이블도 삭제할 부서의 공지사항이 삭제되도록 한다. 
*/
-- MANAGER_ID가 NULL 인 레코드 삭제 
DELETE FROM DEPARTMENTS 
WHERE MANAGER_ID IS NULL;

SELECT * FROM DEPARTMENTS;

-- NOTICE 테이블에서 부서 공지사항 삭제
SELECT * FROM NOTICE;

-- NOTICE 테이블의 DEPT_ID 가 DEPARTMENTS 테이블의 DEPARTMENT_ID 와 일치하지 않으면 삭제
DELETE FROM NOTICE
WHERE DEPT_ID IN (SELECT DEPT_ID
			 				FROM NOTICE N
			 				WHERE N.DEPT_ID NOT IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS));

/*
 * EMPLOYEES 테이블의 COMMISSION_PCT 가 NULL 인 경우 0 으로 수정한다.
*/
UPDATE EMPLOYEES 
SET COMMISSION_PCT = NVL(COMMISSION_PCT, 0);

SELECT * FROM EMPLOYEES;
/*
 * EMPLOYEES 테이블의 MANAGER_ID 가 없는 사원은 DEPARTMENT_ID 에 해당하는 부서 정보를 찾아서 
 * 해당 부서의 MANAGER_ID 값이 EMPLOYEES 테이블의 MANAGER_ID 가 되도록 수정한다. 
*/
-- UPDATE 쿼리는 한 행씩 이루어진다. 
UPDATE EMPLOYEES E
SET E.MANAGER_ID = (SELECT D.MANAGER_ID FROM DEPARTMENTS D WHERE D.DEPARTMENT_ID = E.DEPARTMENT_ID)
WHERE E.MANAGER_ID IS NULL;

/*
 * EMPLOYEES 테이블의 DEPARTMNET_ID 가 없는 사원은 MANAGER_ID 에 해당하는 사원 정보를 찾아서 
 * 해당 사원의 DEPARTMENT_ID 값이 EMPLOYEES테이블의 MDEPARTMENT_ID 가 되도록 수정한다. 
*/
UPDATE EMPLOYEES E1
SET E1.DEPARTMENT_ID = (SELECT E2.DEPARTMENT_ID  FROM EMPLOYEES E2 WHERE E2.EMPLOYEE_ID  = E1.MANAGER_ID)
WHERE E1.DEPARTMENT_ID IS NULL;

SELECT* FROM EMPLOYEES;

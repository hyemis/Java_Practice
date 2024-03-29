package kr.co.demo03;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

public class Demo {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		/*
		 * Java로 Oracle DB 에 접속하여 데이터 조회하는 방법
		 * 		1. JDBC 라이브러리 필수  - maven repositery
		 * 			- JDBC 버전은 JDK 11 인 경우 OJDBC 10 이상을 사용.
		 * 			  JDk 8 인 경우 OJDK 8 을 사용하면 됩니다 
		 * 	2. JDBC 라이브러리르 이클립스 프로젝트의 설정에서 Java Build Path > Library > ClassPath
		 * 		Add External JARs... 버튼 클릭하여 등록
		 * 	3. 다음의 순서에 맞추어 코드 작성
		 * 		A. Oracle Driver 등록
		 *  	B. Database Connection 생성
		 *  	C. Statement 객체 또는 PreparedStatement 객체 생성
		 *  	D. Query 작성 
		 *  	E. 작성한 Query 전송 후 ResultSet 을 반환
		 *  	F. 반환 받은 ResultSet 의 내용 추출 및 추가 작업
		 *  	G. Database 관련 연결 정도 Close
		 */ 
		
	// Oracle Driver 등록
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	// Database Connection 생성 
	// IP주소 : localhost / 터미널 창 ipconfig 로 확인 가능, Port 1521, ServiceName XEPDB1
	String url = "jdbc:oracle:thin:@localHost:1521/XEPDB1";
	String username = "dev01";
	String password = "dev01";
	Connection conn = DriverManager.getConnection(url, username, password);

	// Query 작성(쿼리 문자열에 세미콜론은 넣지 마세요. )
	// ? 홀더 - 문자, 숫자, 날짜 든 상관없이 타입 고려할 필요 없다. 
	//         인덱스 존재 (1번부터)
	int empId = 100;
	String jobId = "IT_PROG";
	
	String query = "SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES";
	query += " WHERE EMPLOYEE_ID = ?" ;
	query += " 	  OR JOB_ID = ?";

	// Statement 또는 PreparedStatement 객체 생성 //PreparedStatement psat = conn.prepareStatement("");
	// 홀더 사용 홀더타입 (홀더 위치, 홀더에 넣을 데이터값)
	PreparedStatement pstat = conn.prepareStatement(query);
	pstat.setInt(1, empId);
	pstat.setString(2, jobId);
	
	// Query 전송 후 결과 저장
	ResultSet rs = pstat.executeQuery();
	
	// ResultSet 에서 값 추출 
	SimpleDateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일");
	
	System.out.println("|ID | FIRST_NAME |    LAST_NAME    |    HIRE_DATE   |");
	System.out.println("+---+------------+-----------------+----------------+");
	
	while(rs.next())	{
		int id = rs.getInt("EMPLOYEE_ID");
		String fName = rs.getString("FIRST_NAME");
		String lName = rs.getString("LAST_NAME");
		Date hireDate = rs.getDate("HIRE_DATE");
		
		System.out.printf("%d | %10s | %15s | %s | \n", id, fName, lName, df.format(hireDate));
	}
	
	// Database 관련 연결 정보 Close (가장 마지막에 생성된 객체부터 닫아야함)
	rs.close();
	pstat.close();	
	conn.close();
	}

}

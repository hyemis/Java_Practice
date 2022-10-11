package kr.co.exam;

import java. util.Scanner;

public class Exam05 {

	public static void main(String[] args) {
		/*
		 *  다음 형식의 메뉴를 만들고 사용자에게 출력하세요.
		 *  
		 *  1. Login
		 *  2. Sing In
		 *  3. Id/Password Find
		 *  
		 *  위 메뉴 형식에서 사용자가 메뉴 번호에 해당한느 값을 
		 *  입력 하면 각 메뉴에 적합한 출력 메세지가 나오게 하세요.
		 *  
		 *  Login 을 선택한 경우 "로그인 화면입니다."
		 *  Sign In 을 선택한 경우 "회원가입 화면입니다."
		 *  Id/Password Find 를 선택한 경우
		 *  	"아이디/패스워드 찾기 화면입니다."
		 */

	Scanner sc = new Scanner(System.in);
	
	String menu = ""
				+ "1. Login\n"
				+ "2. Sing In\n"
				+ "3. Id/Password Find\n";
	
	System.out.println(menu);
	
	String menuNumber;
	
	System.out.println("메뉴번호를 입력하세요 : ");
	menuNumber = sc.nextLine();
	
	/*(if(menuNumber.equals("1")) {
		System.out.print("로그인 화면입니다.");
	} else if(menuNumber.equals("2")) {
		System.out.print("회원가입 화면입니다.");
	} else if(menuNumber.equals("3")) {
		System.out.print("아이디/패스워드 찾기 화면입니다.");
	} else {
		System.out.print("잘못된 메뉴 번호를 입력하였습니다.");
	}
	*/
	
	switch(menuNumber){
		case "1" : 
			System.out.print("로그인 화면입니다.");
			break;
		case "2" : 
			System.out.print("회원가입 화면입니다.");
			break;
		case "3" : 
			System.out.print("아이디/패스워드 찾기 화면입니다.");
			break;
		default :
			System.out.print("잘못된 메뉴 번호를 입력하였습니다.");
		}		
	}
}

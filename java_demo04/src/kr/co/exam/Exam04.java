package kr.co.exam;

import java.util.Scanner;

public class Exam04 {

	public static void main(String[] args) {
		/*
		 * 사용자 입력과 if 문을 활용하여 사용자로부터 문자열을 
		 * 2개 입력 받아 다음의 문제를 풀어보세요.
		 * 
		 * 아이디와, 패스워드에 해당하는 문자열을 입력 받고 미리 
		 * 설정한 아이디와 패스워드가 사용자가 입력한 문자열과 일치
		 * 하는 경우 "로그인 성공"메시지를 출력하세요. 아이디 또는 
		 * 패스워드가 일치하지 않는 경우 "해당하는 아이디가 없습니다.",
		 * "패스워드가 잘못되었습니다." 메시지도 출력되게 하세요. 
		 */
		Scanner sc = new Scanner(System.in);
		
		String id1 ="iddd1";
		String pw1 = "pwww1";
		
		String inputId, intputPw;
		
		System.out.println("아이디를 입력하세요");
		inputId = sc.nextLine();
		
		System.out.println("패스워드를 입력하세요");
		intputPw = sc.nextLine();
		
		/*if(id1.equals(inputId)) {
			if(pw1.equals(intputPw)) {
				System.out.println("로그인 성공");
			} else {
				System.out.println("해당하는 비밀번호가 없습니다.");
			}
			} else {
				System.out.println("해당하는 아이디가 없습니다.");
			}
		*/
		
		if (id1.equals(inputId) && pw1.equals(intputPw)) {
			System.out.println("로그인 성공");
		} else{
			if(!id1.equals(inputId)) {
				System.out.println("해당하는 아이디가 없습니다.");
			} else {
				System.out.println("해당하는 비밀번호가 없습니다.");
			}
			
		} 
		}
		}

package kr.co.exam;

import java.util.Scanner;

public class Exam03 {

	public static void main(String[] args) {
		/*
		 * 사용자 입력을 활용하여 다음의 데이터를 입력 받고 출력하시오.
		 * 
		 * 카카오의 더치페이와 같이 총 금액과 인원 수를 입력 받고 
		 * 인원 수 당 얼마의 금액을 입금하면 되는지 계산하여 출력 
		 * 하세요.
		 * 
		 * 출력 형식은 다음과 같습니다.
		 * 		총 금액 50000 원을 5 명이 나누어 인당 10000 원을 
		 * 		다음의 계좌에 입금해주세요.나머지 금액 0 원은 제가 
		 * 		부담할게요.
		 * 		입금 계좌 : 0000-00-000-0000000
		 * 
		 */
		
		Scanner sc = new Scanner(System.in);
		
			System.out.print("총 금액은 :");
			
			int tm = sc.nextInt(); sc.nextLine();
			
			System.out.print("총 인원은 :");
			
			int tp = sc.nextInt(); sc.nextLine();
			
			System.out.print("총 금액 " + tm + " 원을 " + "총 인원 " + tp + " 명이 나누어");
			System.out.print("인당 " + (tm/tp) + " 을 다음의 계좌에 입금해주세요");
			System.out.println(" 나머지 금액 " + (tm % tp) + " 원은 제가 부담할게요.");
			
			System.out.println("입금 계좌 : ");
			
			String c = sc.nextLine();
			
			System.out.println("입금 계좌 : " + c);
			
	}

}

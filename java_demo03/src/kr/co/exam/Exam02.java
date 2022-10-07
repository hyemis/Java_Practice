package kr.co.exam;

import java.util.Scanner;

public class Exam02 {

	public static void main(String[] args) {
		/*
		 * 사용자 입력을 활용하여 다음의 데이터를 입력 받고 출력하시오.
		 * 
		 * 시, 분, 초 정보를 입력 받아 각각 hour, minute, second 변수에 
		 * 저장을 하고 초단위로 환산 후 출력하세요.
		 * 
		 * 예시
		 * 		시 : 0
		 * 		분 : 10
		 * 		초 : 20
		 * 
		 * 		총 620 초 입니다. 
		 */

		Scanner sc = new Scanner(System.in);
		
		System.out.print("시를 입력하세요 :" ); 
		int h = sc.nextInt();
		
		System.out.print("분을 입력하세요 :" ); 
		int m = sc.nextInt();
		
		System.out.print("초를 입력하세요 :" ); 
		int s = sc.nextInt();
		
		System.out.print("입력 받은 총 초는 : " + ((h*360) + (m*60) + s) + " 초 입니다." ); 

		// int total;
		// total = s;
		// total += m * 60;
		// total += h * 360;
		// System.out.printf("총 %d 초 입니다." , total);
	}

}

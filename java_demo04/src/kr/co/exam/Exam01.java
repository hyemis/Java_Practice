package kr.co.exam;

import java.util.Scanner;

public class Exam01 {

	public static void main(String[] args) {
		/* 
		 * 사용자 입력과 if 문을 활용하여 사용자로부터 정수값을 
		 * 입력 받았을 때 1 ~ 45 사이의 값만 출력하세요. 
		 */
		
		Scanner sc = new Scanner(System.in); 
		
		System.out.println("정수 값을 입력해주세요 : ");
		
		int p = sc.nextInt();
			
		/* if(p >= 1 ) {
				if(p <= 45) {
					System.out.println("입력하신 정수값은 " + p + " 입니다. ");
				}
			}
		*/
		
		if(p >= 1 && p <= 45) {
			System.out.println("입력하신 정수값은 " + p + " 입니다. ");
		}
			System.out.println("프로그램이 종료됩니다.");
			}
}

package kr.co.exam;

import java.util.Scanner;

public class Exam02 {

	public static void main(String[] args) {
		/*
		 * 사용자 입력으로 5~10 사이의 정수 값을 입력 받아 
		 * 입력 받은 정수값과 동일한 크기의 배열을 생성하세요.
		 * 그리고 배열의 값은 -1 로 초기화 하세요.
		 * 
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("5~10 사이의 정수 값을 입력해주세요.");
		int input = sc.nextInt();
		
		int arr[] = new int[input];
		
		for(int i = 0; i < arr.length; i++) {
			arr[i] = -1; 
			System.out.print(arr[i]);
		}
	}

}

package kr.co.exam;

import java.util.Scanner;

public class Exam04 {

	public static void main(String[] args) {
		/*
		 * 사용자 입력으로 2~5 사이의 정수 값을 입력 받아 
		 * 입력 받은 정수값과 동일한 크기의 배열을 생성 하고,
		 * 배열의 값을 초기화 하기 위해 다시 사용자 입력을 사용하여 
		 * 1~10 사이의 값만을 입력 받아 초기화 하세요. 
		 * 위와 같은 과정으로 배열을 생성 할 때 중복된 값이 없도록 초기화 하세요. 
		 */
		Scanner sc = new Scanner(System.in);
		
		System.out.println("2~5 사이의 정수값을 입력해주세요.");
		int input = sc.nextInt();
		
		int arr1[] = new int[input];
		
		System.out.println("초기화 하고자 하는 1~10 사이의 정수값을 입력하세요.");
		int input2 = sc.nextInt();
		
		for(int i = 0; i < arr1.length; i++) {
			arr1[i] = input2;
			System.out.println(arr1[i]);
		}
		
		
	}

}

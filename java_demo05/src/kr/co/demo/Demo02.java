package kr.co.demo;

import java.util.Random;

public class Demo02 {

	public static void main(String[] args) {
		/*
		 * Random 클래스
		 * 		배열을 사용한 난수 값을 생성하기 위한 클래스
		 */
		Random random = new Random();
		int lotto[] = new int[6];
		
		for(int i = 0; i < 6; i++) {
			int num = random.nextInt(45) + 1; // nextInt (범위값) EX/ 5이면 0~4까지 
			lotto[i] = num;
		}
		
		for(int i = 0; i < 6; i++) {
			System.out.printf("%d\t",lotto[i]);
		}
		System.out.println();
	}

}

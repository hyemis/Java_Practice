package kr.co.exam;

import java.util.Random;

public class Exam05 {

	public static void main(String[] args) {
		/*
		 * 1. 크기가 10인 정수 배열을 생성 후 Random 을 사용하여 
		 * 배열의 값들을 초기화 한다. 
		 * Random 은 0~100 사이의 난수값이 생성되도록 한다. 
		 */
		
		/*
		 * 2. 1번에서 생성한 배열을 그대로 사용하여 배열 안에 있는
		 * 정수값 중 짝수에 해당하는 값만 분류하여 출력하도록 한다. 
		 * (짝수값의 수량도 마지막에 출력되게 한다.) 
		 */
		
		/*
		 * 3. 2번에 의해 분류된 짝수들만을 모아두기 위한 새로운 정수
		 * 배열을 만들고 저장한다. 
		 */
		
		Random random = new Random();
		int arr[] = new int[10];
		
		for(int i = 0; i < arr.length; i++) {
			arr[i] = random.nextInt(100);
			 System.out.printf("%d\t",arr[i]);
		}
		
		System.out.println();
		
		int count = 0;
		
		for(int i = 0; i < arr.length; i++) {
			if(arr[i] % 2 == 0) {
				System.out.printf("%d\t",arr[i]);
				count++;
			}
		}
		
		System.out.printf(" 생성 된 짝수의 개수는 :%d 개입니다.", count);
		
		System.out.println();
		
		int even[] = new int[count];
		
		for(int i = 0, j = 0; i < arr.length || j < even.length; i++) {
			if(arr[i] % 2 == 0) {
				even[j] = arr[i];
				j++;
			}
		}
		
		for(int i = 0; i < even.length; i++) {
			System.out.printf("%d\t", even[i]);
		}
		System.out.println();
	
		
	}

}

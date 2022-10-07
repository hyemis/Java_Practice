package kr.co.exam;

import java.util.Scanner;

public class Exam01 {

	public static void main(String[] args) {
		/*
		 * 사용자 입력을 활용하여 다음의 데이터를 입력 받고 출력하시오. 
		 * 
		 * 키, 몸무게 정보를 입력 받아 각각 tall, weight 변수에 저장을 하고 
		 * BMI 계산을 하세요. 
		 * 
		 * BMI 계산은 몸무게(kg) / 키^2(m) 입니다. 
		 * 
		 * 출력 형식은 다음과 같습니다. 
		 * 
		 * 당신의 체질량 지수는 23.35 입니다. 
		 */
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("당신의 키(m)를 입력해주세요 : ");
		
		double tall = sc.nextDouble();
		
		System.out.print("당신의 몸무게를 입력해주세요 : ");
		
		double weight = sc.nextDouble();
		
		double BMI = weight / (tall*tall);
	
		System.out.print("당신의 BMI 지수는 : " + Math.round(BMI*100)/100.0 + " 입니다. ");
	
		
	}

}

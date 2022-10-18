package kr.co.exam03;

import java.util.Scanner;

public class Exam01 {

	public static void main(String[] args) {
		/*
		 * 다음의 객체를 클래스로 만들 때 멤버 변수/상수, 클래스 변수/ 상수
		 * 생성자, 메서드를 활용하여 만들어 보세요. 
		 * 
		 * 시계 클래스를 만들어 보세요. 해당 클래스는 현재 시간을 시, 분, 초 
		 * 정수 단위로 입력하면 이에 적합한 시:분:초 형식의 문자열로 출력할 수 
		 * 있는 getTimeString() 메서드를 제공합니다. 
		 *
		 */

		Clock clock = new Clock(12,30,30);
		//clock.setHour(10); // 외부에서 값을 내부 필드 값을 변경하고자 할 때 사용. 
		System.out.println(clock.getTimeString());
	
	}

}

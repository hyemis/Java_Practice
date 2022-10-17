package kr.co.demo02;

import kr.co.demo02.subject.Subject; // subject의 접근제한자가 default임으로 다른 패키지에서 접근 불가

// subject. * subject 클래스 안 모든 클래스 

public class Demo {

	public static void main(String[] args) {
	
		//Student s1 = new Student(); // 기본 생성자 없음으로 사용 불가
		
		Student student1 = new Student("홍길동", 16);
		
		System.out.println(student1.getName());
		System.out.println(student1.getAge());
		System.out.println(student1.getGrade());
		
		// import 작업 필요-다른 패키지에 있는 클래스는 반드시 import 필요. 남은 에러는 기본 생성자 없음 에러
		Subject subject1 = new Subject("국어", 80);
		
		System.out.println(subject1.getName());
		System.out.println(subject1.getScore());
		System.out.println(subject1.getGrade());

	}

}

package kr.co.demo02;

public class Student { // 접근 제한자를 적어주지 않으면 (default) - 같은 패키지만 접근가능
	private String name;
	private int age;
	private int grade = 1; // 초기값을 1로 설정
	
	// public Student() {} // 기본생성자 
	
	public Student(String name, int age) { // 매개변수만 있는 생성자
		this.name = name;
		this.age = age;
		
		if(age == 14) {   // 생성자에도 로직을 더 짜서 14살이면 1학년, 15살 2학년, 16살 3학년 등으로 사용.
			this.grade = 1; 
		} else if(age == 15) {
			this.grade = 2;
		} else if(age == 16) {
			this.grade = 3;
		} else {
			this.grade = -1;
		}
	}
	
	public String getName() {
		return this.name;
	}
	public int getAge() {
		return this.age;
	}
	public int getGrade() {
		return this.grade;
	}
}

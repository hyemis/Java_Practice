package kr.co.demo01;

public class Person {
	/*
	 * 자손클래스에서 private로 지정 된 멤버필드 사용 불가. 오로지 같은 클래스에서만 사용 가능. 
	 */
	private String name;
	private int age;
	private char gender;
	
	/* 생성자 사용 방법 2 가지
	 * 1. 매개변수가 있는 생성자만 있을 시에는 부모 객체를 생성해야 자손에서 사용가능하다. 
	 * 자손 클래스에서 super를 통해서 객체를 생성 해야한다. 
	 * 2. 기본 생성자를 지정해준다. 
	 * 
	 * 생성자는 상속되지 않음. 
	 */
	
	
	public Person(String name) {
		this.name = name;
	}
	
	// source - generate getter and setters 를 통해 getter setter 만들기
	// getter속에는 같은 이름의 매개변수로 선언 된 지역변수가 없음으로 굳이 this. 써주지 않음. 생략함. 
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public char getGender() {
		return gender;
	}
	
	public void setGender(char gender) {
		this.gender = gender;
	}
	
	
	
}

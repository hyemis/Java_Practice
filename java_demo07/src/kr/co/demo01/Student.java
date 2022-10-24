package kr.co.demo01;

public class Student extends Person{
// 자손 클래스명 extends 부모클래스명 
	
	/*
	 * 부모 클래스의 매개변수가 있는 생성자를 사용해서 부모 객체도 생성해야한다. 
	 */
	private int year; 
	private int classRoom;
	
	
	public Student(String name) {
		super(name);
	}


	public int getYear() {
		return year;
	}


	public void setYear(int year) {
		this.year = year;
	}


	public int getClassRoom() {
		return classRoom;
	}


	public void setClassRoom(int classRoom) {
		this.classRoom = classRoom;
	}
	
	
}

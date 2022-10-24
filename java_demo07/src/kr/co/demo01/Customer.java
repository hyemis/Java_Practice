package kr.co.demo01;

public class Customer extends Person {
/*
 * 상속 클래스 만들기 
 * 	1. 클래스 만든 후 extends 넣기
 * 	2. 처음부터 superclass로 지정해 부모클래스로부터 상속 받기
 */
	
	private int id;
	private int point;
	
	public Customer(String name) {
		super(name);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
}


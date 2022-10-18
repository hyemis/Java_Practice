package kr.co.demo03;

public class Circle {

	// private final double PI = 3.14; 
	// 멤버 변수/ 상수  :final 키워드가 사용되면 상수 
	public static final double PI = 3.14; // static 정적 변수, 클래스 변수 만들어 사용할 때 -> 공유 자원
	
	// 클래스 변수/상수 : static 키워드가 사용되면 클래스 공유 자원
	public static final double PI2 = 3.14;
	private double radius;
	
	// 특정 instance 에서 사용 하는 변수 
	
	public Circle(double radius) {
		this.radius = radius;
	}
	
	public double getRadius() {
		return this.radius; 
	}
	
	public double getArea() {
		return this.radius *  this.radius * Circle.PI; // static 안이면 this.PI 를 Cirlce.PI 라고 씀
	}
}

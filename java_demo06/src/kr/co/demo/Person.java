package kr.co.demo;

public class Person {
	String name;
	int age;
	char gender;
	String phone;
	private String personID;
	String address;
	
	/*
	 *  기본 생성자 : 클래스를 만들면 기본적으로 사용되는 생성자. 
	 *  		 	별도의 생성자를 구현하지 않으면 기본 생성자는 
	 *  			작성하지 않아도 사용할 수 있다.   
	 */
				
	public Person() {}
	
	/*
	 * 매개변수가 있는 생성자
	 * 		매개변수가 있는 생성자가 잇으면 기본 생성자를 별도로 구현
	 * 		하지 않을 시 기본 생성자를 사용할 수 없다. 
	 */
	
	public Person(String name) {  // String name 매개변수
		this.name = name;    // this.name 멤버변수 name
		} 
	
	public Person(String name, int age) {  // String name 매개변수
		this.name = name; // this.name 멤버변수 name
		this.age = age;
	}

}

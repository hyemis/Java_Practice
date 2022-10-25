package kr.co.demo02;

public class Demo {

	public static void main(String[] args) {
		/*
		 * java.lang.Object
		 * 		자바의 모든 클래스는 java.lang.Object 클래스를 상속한다.
		 * 		Object 클래세는 다음의 메서드를 포함하고 있다. 
		 * 		
		 * toString() 메서드
		 * 		객체를 읽을 수 있는 문자열로 변환하여 반환하는 메서드
		 * 
		 * equals() 메서드
		 * 		동일 참조 주소 또는 동일 값을 가지는 객체인지 구분하고 
		 * 		true/false를 반환하는 메서드
		 */		
		
		Person p1 = new Person();
		
		p1.setName("홍길동");
		p1.setAge(23);
		p1.setGender('M');
		
		Person p2 = new Person();
		
		p2.setName("홍길동");
		p2.setAge(25);
		p2.setGender('M');
		
		// 오버라이딩하면서 반환 타입을 객체의 주소가 아닌 문자열로 출력하도록 했다. 
		System.out.println(p1);
		System.out.println(p1.toString());
		
		// p1과 p2를 비교 참조주소 비교/ 값 비교 
		System.out.println(p1 == p2);
		// 이름만 같아서는 안되고 나이, 성별도 같아야 true값을 반환하도록 구현. 
		System.out.println(p1.equals(p2));
	}

}

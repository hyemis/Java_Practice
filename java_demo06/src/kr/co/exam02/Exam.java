package kr.co.exam02;

public class Exam {

	public static void main(String[] args) {
		/*
		 * 삼각형, 사각형 클래스를 만들고 각 도형의 넓이와 
		 * 둘레르 구할 수 있도록 만드세요.
		 * 
		 * 1. 두 클래스의 생성자는 밑변 정보만 받아서 생성하는 생성자와 
		 * 		밑 변과 높이 정보를 받아서 생성하는 생성자로 만드세요.
		 * 
		 * 2. 생성자로 만들어진 삼각형, 사각형 인스턴스는 넓이와 둘레가 
		 * 		바로 초기화 되어 각 멤버필드에 저장될 수 있도록 하세요.
		 * 
		 * 3. getter 메서드만을 만들어서 밑변, 높이, 넓이, 둚레 정보만 
		 * 		사용할 수 있도록 하세요.
		 * 
		 */
		
		Triangle t1 = new Triangle(10);
		Triangle t2 = new Triangle(10,15);
		
		Square s1 = new Square(10);
		Square s2 = new Square(10,15);
		
		System.out.println(s1.getwidth() + " / " + s1.getheight());
		System.out.println(s2.getwidth() + " / " + s2.getheight());
		
		System.out.println(s1.getRound() + " / " + s1.getExtent());
		System.out.println(s2.getRound() + " / " + s2.getExtent());
		

	}

}

package kr.co.demo;

public class Demo01 {

	public static void main(String[] args) {
		// 산술연산
		int x1 = 3;
		int y1 = 2;
		
		System.out.println("더하기(+) 연산 결과 -> " + (x1 + y1));
		System.out.println("빼기 (-) 연산 결과 -> " + (x1 - y1));
		System.out.println("곱하기(*) 연산 결과 -> " + (x1 * y1));
		System.out.println("나누기(/) 연산 결과 -> " + (x1 / y1));
		System.out.println("나머지(%) 연산 결과 -> " + (x1 % y1));
		
		double x2 = 3.0; // 정수와 실수 사이의 계산은 형변환 이뤄짐. 
		System.out.println("더하기(+) 연산 결과 -> " + (x2 + y1));
		System.out.println("빼기 (-) 연산 결과 -> " + (x2 - y1));
		System.out.println("곱하기(*) 연산 결과 -> " + (x2 * y1));
		System.out.println("나누기(/) 연산 결과 -> " + (x2 / y1));
		System.out.println("나머지(%) 연산 결과 -> " + (x2 % y1));
		
		// 비교연산 T/F 로 반환
		System.out.println(" > 연산 결과 -> " + (x1 > y1));
		System.out.println(" < 연산 결과 -> " + (x1 < y1));
		System.out.println(" >= 연산 결과 -> " + (x1 >= y1));
		System.out.println(" <= 연산 결과 -> " + (x1 <= y1));
		System.out.println(" == 연산 결과 -> " + (x1 == y1));
		System.out.println(" != 연산 결과 -> " + (x1 != y1));
		
		// 논리연산
		boolean b1 = true;
		boolean b2 = false;
		// 둘 다 true 일 때만 true 반환
		System.out.println("논리 연산 true && true 결과 ->" + (b1 && b1));
		System.out.println("논리 연산 true && false 결과 ->" + (b1 && b2));
		System.out.println("논리 연산 false && true 결과 ->" + (b2 && b1));
		System.out.println("논리 연산 false && false 결과 ->" + (b2 && b2));
		// 둘 중 하나만 true 여도 true 반환, 아니면 false 반환
		System.out.println("논리 연산 true || true 결과 ->" + (b1 || b1));
		System.out.println("논리 연산 true || false 결과 ->" + (b1 || b2));
		System.out.println("논리 연산 false || true 결과 ->" + (b2 || b1));
		System.out.println("논리 연산 false || false 결과 ->" + (b2 || b2));
		
		// 증감연산
		int z1 = 10;
		int z2 = 10;
		
		System.out.println("증감 연산 ++z1 결과 ->" + (++z1));
		System.out.println("증감 연산 z2++ 결과 ->" + (z2++));
		
		System.out.println("전위/후위 최종 결과 ->" + z1 + "/" + z2);

		// 삼항 연산 
		int x = 1;
		int y = 0;
		y = x > 3 ? 5 : 10;
		System.out.println(y);
	}

}

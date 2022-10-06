package kr.co.demo;

public class Demo03 {

	public static void main(String[] args) {
		// 형변환 : 변수에 저장된 특정 자료형의 데이터를 다른 자료형에 저장하기 위해
		//		   자료형의 종류를 변환시켜주는 작업을 형변환이라고 하며 이를 Casting
		//		   이라고 한다. 
		//		   일반적으로 정수 -> 정수, 정수 -> 실수, 실수 -> 정수, 실수 -> 실수
		//		   로만 변환 할 수 있다. (정수와 실수형 간의 변환)
		
		// 자로형의 크기가 작은 자료형에서 큰 자료형으로 변환할 때에는 자동으로
		// 형 변환이 이루어 진다. -> 자동 형변환
		
		// 자료형의 크기가 큰 자료형에서 작은 자료형으로 변환할 때에는 직접 캐스팅을
		// 해야한다. -> 강제 형변환
		// 이 때 데이터의 누락이 발생할 수 있다. (큰 자료형에서 작은 자료형으로 줄어듬으로)
		
		byte bt1 = (byte)500; // casting 500 값을 byte 형에 맞춰서 형변환. 
		System.out.println(bt1); // -12 큰 자료형에서 작은 자료형으로 형변환 하면서 값이 누락되어 나옴
		
		long lg1 = 500; // int 500 작은 자료형에서 큰 자료형은 자동 형변환. 
		
		int it1 = 'A'; // 문자는 java에서 정수 코드(아스키 코드)로 인식해 형변환 가능. 
		
		// 형변환은 변수에 할당 할 때 뿐만 아니라 계산(연산)에서도 이루어진다.
		
		String st1 = "문자열" + 10; // 문자열에 대한 + 연산 사용시 어떠한 자료형을 사용하든 문자열과 결합 가능
		String st2 = 10 + "문자열";
		String st3 = 10.5 + "문자열";
		String st4 = "문자열" + 10.5;
		String st5 = "문자열" + true;
		String st6 = "문자열" + 'A';
		
		System.out.println(st1); //println 줄바꿈
		System.out.println(st2);
		System.out.println(st3);
		System.out.println(st4);
		System.out.println(st5);
		System.out.println(st6);
		
	}

}

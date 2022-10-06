package kr.co.demo;

public class Demo02 {
	
	public static void main(String[] args) { // main은 하나 이상만 있으면 된다. 
		// 상수 : 변수 공간에는 언제든 데이터를 수정할 수 있다. 
		//		 하지만 사우는 한 번 초기화 하면 더 이상 수정할 수 없는 
		//		 공간으로 사용되며, 변수와 상수를 구분하기 위해 상수는 
		//		 상수명을 대문자로만 작성한다. 
		//		 2단어 이상의 조합의 상수명은 단어와 단어 사이에 _ 를 넣어서 
		//		 작성하게 된다. (띄어쓰기 대신)
		// 		 변수를 사용하는 방식과 동일하며, 자료형 앞에 final 키워드를 붙이면 된다. 
		
		final int X = 10; // final 키워드 : 상수
		
		System.out.print(X); 
		
		// final int Y = 20;
		// Y = 30; // 상수 값(final local variable)은 재할당 할 수 없다. 
		
		final int Y; // 초기화 전 
		Y = 20; // 초기화 후 . 한번 초기화 후 다시 초기화 불가능 
		System.out.print(Y);
		
		// Y =30; 수정함.
	}

}

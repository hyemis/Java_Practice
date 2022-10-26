package kr.co.demo02;

public class Demo {

	public static void main(String[] args) {
		/*
		 * StringBuiler / StringBuffer
		 */
//		StringBuilder(); 기존 문자열에 문자 추가 (성능에 더 좋음)
		StringBuilder sb = new StringBuilder();
		sb.append("문자열");
		sb.append("추가");
		System.out.println(sb.toString());
		
//		문자열 + 문자열 => 새로운 문자열
		String str = "문자열";
		str += "추가";
		System.out.println(sb);
		
//		capacity(); 배열의 크기 반환
		int capacity = sb.capacity();
		System.out.println(capacity);
		
//		delete(); 문자열 삭제 
		sb = sb.delete(0,3);
		System.out.println(sb.toString());
		
//		insert(); 지정 위치에 문자열 추가
		sb.insert(0, "문자열");
		System.out.println(sb.toString());
		
		sb.insert(0, "insert()");
		System.out.println(sb.toString());
		
//		length(); 문자열 길이 반환
		int length = sb.length();
		System.out.println(length);
		
//		reverse(); 문자열을 역순으로 나열 
		sb.reverse();
		System.out.println(sb.toString());
		
//		setLength() ; 
		sb.setLength(20);
		sb.reverse();
		System.out.println(sb.toString());
		
//		trimToSize();
		sb.trimToSize();
		System.out.println(sb.capacity());
		
	}

}

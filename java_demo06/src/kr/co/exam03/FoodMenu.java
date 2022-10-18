package kr.co.exam03;

import java.util.Arrays;

public class FoodMenu {
	
	// 변수
	
	private String name[] = new String[0];
	private int price[] = new int[0];
	


	//모든 메뉴를 출력하기 위한 메서드 
	public String show() {
		String res = "";
		for(int i= 0; i < name.length; i++) {
			res += String.format("%s\t%,d원\n", name[i], price[i]);
		}
		return res;
	}
	//메뉴를 찾아서 가격을 반환하기 위한 메서드 
	public int find(String name) {
		return 0;
	}
	//메뉴를 추가하기 위한 메서드  동적배열 사용 
	public void add(String name, int price) {
		this.name = Arrays.copyOf(this.name,this.name.length+1);
		this.name[this.name.length - 1] = name;
		
		this.price = Arrays.copyOf(this.price, this.price.length + 1);
		this.price[this.price.length - 1] = price;
	}
	// 메뉴를 찾아 가격을 수정하기 위한 메서드
	public void update(String name, int price) {
		
	}
	// 메뉴를 찾아 삭제하기 위한 메서드
	public void remove(String name) {
		
	}
}

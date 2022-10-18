package kr.co.exam03;

public class Elevator {
	
	
	// 멤버 변수 
	private int floor = 1;
	private int min;
	private int max;
	private int target;
	private String state;
	
	
	//생성자
	public Elevator (int floor, int min, int max, int target) {
		this.floor = floor;
		this.min = min;
		this.max = max;
		this.target= target;
	}
	
	
	// 멤버 메서드 
	
	public void move(int target) {
		this.state = this.floor < target ? "올라" : "내려";
		
		if(this.floor == target) {
			System.out.println("이미" + this.floor + "층 입니다.");
		} else {
			if(min >= target && max <= target && target != 0) {
				System.out.println(this.floor + "층에서"+ target + " 층으로" + this.state + "갑니다.");
			} else {
				System.out.println(this.floor + "층에서 1층으로 " + this.state + "갑니다.");
				this.target = 1;
		}
	}
}
	
	
	
	
}

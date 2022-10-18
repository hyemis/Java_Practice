package kr.co.exam03;

public class Clock {

	// 멤버 변수(상수 포함)
	// Clock 클래스 안에서 자신의 멤버변수에 접근하려면 꼭 this로 접근
	// 접근 제한자를 private으로 줬지만 필요에 따라 지정
	private int hour ;
	private int minute;
	private int second;
	
	// 생성자
	// 접근제한자 클래스명 (매개변수, 매개변수...) {클래스의 this.클래스의 멤버변수 = 받을 값;}
	// setter와 동일한 구조 
	// 생성자와 setter를 한번에 작성 가능
	public Clock(int hour, int minute, int second) {
		 this.setHour(hour);
		 this.setMinte(minute);
		 this.setSecond(second);
	}
	
	
	// 멤버 메서드
	// 접근제한자 반환타입 메서드명 { return 문 ~;}
	// 리턴값은 반드시 한개.
	public String getTimeString() {
		return this.hour + ":" + this.minute + ":" + this.second; 
	}
	
	//getter메서드
	// 타입은 멤버변수의 타입과 일치
	// 메서드 이름은 get+멤버변수명(camelcase 형식)
	// return this.멤버변수 
	public int getHour() {
		return this.hour;
	}
	
	public int getMinute() {
		return this.minute;
	}
	
	public int getSecond() {
		return this.second;
	}
	
	// setter메서드
	// 외부에서 내부 멤버변수의 값 변경이 필요한 경우 사용
	// 반환 타입이 없음
	// ()안은 외부에서 받아올 값을 타입.매개변수로 넣는다 
	// this.hour = 외부에서 받아 온 값()의 값이 대입된다. 
	// 조작이 필요하면 넣어서 만듬
	// 외부에서 접근을 허용하지 않으려면 private 접근 제한자를 사용할 수 있다. 
	private void setHour(int hour) {
		this.hour = hour % 24;
	}
	public void setMinte(int minute) {
		this.minute = minute % 60;
	}
	public void setSecond(int second) {
		this.second = second % 60;
	}
}

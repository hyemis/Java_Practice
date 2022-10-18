package kr.co.exam02;

public class Square {
	
	double width;
	double height;
	double round;
	double extent;

	
	public Square (double width) {  // 매개변수 받아서 초기화. 
		this.width = width;
		this.height = width;
		this.round = width * 4; // 추가 초기화 작업.
		this.extent = width * height;
	}
	
	public Square (double width, double height) { // 매겨변수는 여러개 받을 수도 있음. 
		 this. width = width;
		 this. height = height;
		 this.round = (width + height) * 2;
		 this.extent = width * height;
	 }
	
	 public double getwidth( ) { // 외부에서 내부의 필드의 정보 접근 할 수 있도록 함. 
		 return this.width;
	 }
	
	 public double getheight( ) {
		 return this.height;
	 }
	 
	 public double getRound( ) {
		 return this.round;
	 }

	 public double getExtent( ) {
		 return this.extent;
	 }
}

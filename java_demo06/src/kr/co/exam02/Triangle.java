package kr.co.exam02;

public class Triangle {

	double width;
	double height;
	double round;
	double extent;

	
	public Triangle (double width) {
		this.width = width;
		this.height = width;
		this.round = width = width + (Math.sqrt((width / 2) * (width / 2) + (width *  width)));
		this.extent = width *  width / 2;
	}
	
	public Triangle (double width, double height) {
		 this. width = width;
		 this. height = height;
		 this.round = Math.sqrt((width*width) + (height*height)) + width + height;
		 this.extent = width *  width / 2;
	 }
	
	 public double getwidth( ) {
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

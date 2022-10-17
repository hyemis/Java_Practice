package kr.co.demo02.subject;

public class Subject {
 private String name;
 private double score;
 
 public Subject(String name, double score) {
	 this. name = name;
	 this. score = score;
 }
 
 public void setName(String name) {
	 this. name = name;
 }
 
 public String getName( ) {
	 return this.name;
 }
 
 public void setScore(double score) {
	 this.score = score;
 }
 
 public double getScore() {
	 return this.score;
 } 
 
//getter, setter 도 메서드. public 접근 제한자, String 반환 타입, 소괄호 안에 매개변수 입력 가능.
 // 반환타입이 void 인 것 제외하고 다른 반환 타입을 가진 메서드는 반드시 return이 반드시 존재해야한다. 
 // 반환타입이 String 이면 반드시 반환 타입도 String 으로 맞춰줘야한다. 
 public String getGrade() {  
	 if(this.score >= 90 && this.score <= 100) {
		 return "A";
	 } else if(this.score >= 80 && this.score < 90) {
		 return "B";
	 } else if(this.score >= 70 && this.score < 80) {
		 return "C";
	 } else if(this.score >= 60 && this.score < 70) {
		 return "D";
 } else {
	 return "F"; // 반환; 메서드의 실행이 종료 
 }
 }
}

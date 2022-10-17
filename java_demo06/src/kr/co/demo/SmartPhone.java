package kr.co.demo;

public class SmartPhone {
	private String model;
	private String brand;
	private String number;
	
	public void setModel(String model) {  //  setter 만들기 set필드명 필드명은 대문자로 시작
		this.model = model;
		
	}
	
	public void setBrand(String brand) { 
		this.brand = brand;
	}
	
	public void setNumber(String number) {
		this.number = number;
	}
	
	public String getModel() { // getter 만들기
		return this.model;
	}
	
	public String getBrand() {
		return this.brand;
	}
	
	//public String getNumber() {
	//	return this.number;
	//}
	
	//public String getNumber() {
	//	String num = this.number.substring(0,9);
	//	return num + "xxxx";
	
	//}
}

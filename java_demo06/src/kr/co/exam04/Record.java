package kr.co.exam04;

public class Record {
	// 외부에서 변경할 수 없게 private  걸어둠 
	private	String className;
	private double score;
	private char grade;
	
	
	/*
	 * 생성자
	 * 과목명, 점수 입력하면 멤버 변수의 값을 초기화 해줌.
	 * 초기화 시 setGrade() 메서드 호출해서 같이 기본값으로 초기화. 
	 */
	
	// 기본생성자 
	public Record() {}
	
	
	//매개변수가 있는 생성자
	public Record(String className, double score) {
		this.className = className;
		this.score = score;
		this.setGrade();
	}
	
	// 매개변수가 1개 있는 생성자. 일단 과목 이름만 넣어넣고 나중에 점수를 입력할 수도 있음으로. 
	public Record(String className) {
		this.className = className;
	}
	
	// 점수를 받아서 등급으로 산출하는 메서드 
	// 점수를 실수로 받아서 10으로 나누면 앞 첫자리 수만 남고 뒤는 버려짐.
	// switch문으로 돌리면서 등급 환산. 
	// 매개변수 자리를 비워둠. 어차피 내부의 정보를 가지고 환산하니깐.
	
	// private 걸어논 변수에 접근해서 값을 변경할 때 setter 만들기
	// 점수는 입력 자가 변경 할 수 있도록 함. 
	
	public String getclassName() {
		return this.className;
	}
	
	
	public void setScore(double score) {
		this.score = score;
		this.setGrade();
	}
	
	// private 걸어논 변수에 접근에 값을 읽어올 때 getter 만들기
	public double getScore() {
		return this.score;
	}
	
	// 외부에서는 setGrade()메서드를 이용할 일이 없음으로 private로 지정 
	
	private void setGrade() {
		switch((int)((this.score) / 10 )) {
		case 10 :
		case 9 :
			this.grade = 'A'; break;
		case 8:
			this.grade = 'B'; break;
		case 7:
			this.grade = 'C'; break;
		case 6:
			this.grade = 'D'; break;
		case 5:
			this.grade = 'E'; break;
			default: this.grade = 'F'; break;
		}
		
	}
	
	public char getGrade() {
		return this.grade;
	}
	
	public boolean isEists(String name) {
	//	boolean result = false;
		
		// 이 객체의 문자열 과목명과 문자열 매개변수로 받은 이름이 동일한지 확인하는 메서드 
		// 동일하면 true 
		// 동일하지 않으면 false 
		return this.className.equals(name); 
		
	}



}

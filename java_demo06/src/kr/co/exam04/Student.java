package kr.co.exam04;

import java.util.Arrays;

import kr.co.exam03.Food;

public class Student {
	// 멤버 변수
	// record를 객체배열로 이용해서 멤버 변수 선언
	//
	public Record record[] =  {
			new Record("국어", 70), new Record("수학", 80)
	};
	
	public String name;
	public int year;
	
	
	
	// 생성자 
	// 그럼 s에 값이 계속 누적해서 저장되는건가? 
	
	public Student(String name) {
		this.name =name;
	}
	
	Student(String name, int year) {
		this.name = name;
		this.year = year;
	}

	/*
	 * 멤버 메서드 
	 * 생성 순서 1) 접근제한자(public, private, default 등 ), 반환타입(String, int, char, void 등등), 메서드이름() {}
	 */
	
	// 성적표 출력 메서드
	// 변수r을 만들어 배열 record의 값을 대입시켜 record에 있는 메서드들을 호출 할 수 있도록 함. 
	// 메서드에서는 되도록이면 출력 하지말고 반환 시켜 반환값을 메인에서 출력하도록 하자. 
	// 출력을 위한 메서드이면 String타입으로 빈 문자열 변수 만든 변수(문자열)을 반환. 
	public String getGradeTable() {
		String result = "";
		for(int i = 0; i < this.record.length; i++) {
			Record r = this.record[i];
			//.out.printf("%s\t%.2f\n", r.getclassName(), r.getScore());
			result += String.format("%s\t%.2f\n", r.getclassName(), r.getScore());
		}
		return result;
	}
	
	// 과목 점수 출력 메서드 
	// score 반환타입을 double 로 받고 싶어서 메서드 반환타입, 리턴타입 변경.
	// 과목을 입력하면 성적표 배열에 있는지 확인하고 해당 과목에 맞는 점수를 배출한다. 
	/**
	 * 
	 * 
	 * @param recordName
	 * @return
	 */
	
	// 과목명이 중복되는 체크하는 메서드
	// 자주 사용함으로 따로 메서드를 만들어서 사용. 
	public boolean isDuplicate(String className) {
		return this.findIndex(className) == -1 ? false : true;
	}
	
	// 과목명이 중복되는 체크하는 메서드2
	public int findIndex(String className) {
		for(int i = 0; i < this.record.length; i++) {
			Record r = this.record[i];
			if(r.isEists(className)) {
				return i;
			}
	}
		return -1;
	}
		
	
	// 과목명을 매개변수로 받으면 해당 과목 점수 구하기
	// 
	public double getScore(String recordName) {
		double result = -1;
		int idx = this.findIndex(recordName);
		
		if(idx != -1) {
			result = this.record[idx].getScore();
		}
				return result;
			
		}
	 
	
	//과목 점수 수정 추가
	public void updateRecord(String className, double score) {
		
	}
	
	//성적 추가 
	public void addRecord(String className, double score) {
		// 기존의 record 배열 복사해서 새로운 배열을 만들고 그 배열에 매개변수로 받는 값들을 넣어준다. 
		//this.record = Arrays.copyOf(this.record,this.record.length + 1);
		//this.record[this.record.length - 1] = new Record(className, score);
		
		// 과목명이 중목이면 false
		// record 배열을 변수 r에 넣고 중복값 확인하는 메서드 사용. 
		// 중복이 아니면 추가 
		
		if(!this.isDuplicate(className)) {
		int len = this.record.length;
		this.record = Arrays.copyOf(this.record,len + 1);
		this.record[len] = new Record(className, score);
		}
	}
	
	//성적 삭제
	public void removeRecord(String className) {
		
	}
	
	
	
}

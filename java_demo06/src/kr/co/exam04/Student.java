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
	// 생성자는 여러개 사용 가능하다. 
	// 각 생성자에서도 호출 가능 -> this(name/매개변수); 로 중복된 생성자 문장 호출 가능 !반드시 첫번째 줄에 작성
	// 참조변수 this 멤버 변수와 매개변수로 받은 변수가 이름이 같을 경우 this.멤버 변수 로 한다. 
	public Student(String name) {
		this.record = new Record[0];
		this.name =name;
		System.out.println(this.toString());
	}
	
	Student(String name, int year) {
		this(name);
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
	
	// 과목명이 중복되는 체크하는 메서드2
	// 자주 사용함으로 따로 메서드를 만들어서 사용.
	// 중복되면 false, true 로 반환
	// 다른 클래스에서는 접근 불가하도록 private로 제한함. (변경 가능. 사용 용도에 따라 다르게 작성 )
	private boolean isDuplicate(String className) {
		return this.findIndex(className) == -1 ? false : true;
	}
	
	// 과목명이 중복되는 체크하는 메서드1
	// 중복된 인덱스 값 반환
	private int findIndex(String className) {
		for(int i = 0; i < this.record.length; i++) {
			Record r = this.record[i];
			if(r.isEists(className)) {
				return i;
			}
	}
		return -1;
	}
	
	// 객체로 반환도 가능. 
	public Record getRecord(String className) {
		Record result = null;
		int idx = this.findIndex(className);
		
		if(idx >= 0) {
			result = this.record[idx];
		}
		return result;
	}
	/*	
	public Record[] getRecords(String[] classNames) {
		Record results[] = new Record[0];
		for(int i = 0; i< classNames.length; i++) {
			Record record = this.getRecord(classNames[i]);
			if(record != null) {
				results = Arrays.copyOf(results, results.length+1);
				results[results.length -1] = record;
			}
		}
	//	Record results;
	}
	*/
	// 가변 매개변수 
	// 굳이 새로운 배열을 만들지 않고 나열만 하면 메서드 사용 가능하다. 
	//public Record[] getRecord(string className) {
		
	//}
	
	// 과목명을 매개변수로 받으면 해당 과목 점수 구하기
	// 
	public double getScore(String className) {
		Record result = this.getRecord(className);
		return result != null ? result.getScore() : -1;
			
		}
	 
	
	//과목 점수 수정 추가
	// updateRecord 를 Record 객첼르 매개변수로 사용하여 기존과 
	// 동일하게 동작하는 메서드로 오버로딩하여 구현
	public void updateRecord(String className, double score) {
		int idx = this.findIndex(className);
		if(idx >= 0) {
			Record r = this.record[idx];
			r.setScore(score);
		}
	}
	
	public void updateRecord(Record record) {
		
	}
	
	//성적 추가 
	
	// 메서드 오버로딩 : 동일한 일므의 메서드를 여러개 작성하는 것. 
	// 					매개변수 타입, 매개변수 수량이 이미 작성된 동일한 이름의 메서드와 달라야함. 
	// 					오버로딩 된 메서드를 사용하는 사용자 입장에서는 해당 메서드를 사용할 때 타입에 대한 부분을 
	//					신경쓰지 않아도 된다. ex) System.out.print 
	// 					다양한 타입을 사용해서 동일한 결과를 얻을 수 있다. 
	
	public void addRecord(Record record) {
	//	this.addRecord(record.getclassName(), record.getScore());
	}
				
	public void addRecord(String className) {
		if(!this.isDuplicate(className)) {
			int len = this.record.length;
			this.record = Arrays.copyOf(this.record, len + 1);
			this.record[len] = new Record(className);
			}
	}
	
	public void addRecord(String className, int score) {
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
	
// 성적 삭제 메서드
	// removeRecord 를 Record객체를 매개변수로 사용하여 기존과 
	// 동일하게동작하는 메서드로 오버로딩 하여 구현
	// 여러개의 성적 정보를 삭제할 수 있게도 하세요. 
	public void removeRecord(String className) {
		int idx = this.findIndex(className);
		if(idx >= 0) {
			// 삭제 할 인덱스의 오른쪽에 있는 인덱스 값을 복사 한 후 삭제한 인덱스를 제거하고 
			// 복사 
			for(int i = idx; i < this.record.length - 1; i++) {
				this.record[i] = this.record[i+1];
			}
			this.record = Arrays.copyOf(this.record, this.record.length -1);
		}
	}
	
	
	
	
	
}

package kr.co.exam04;

public class Exam {

	public static void main(String[] args) {
		/*
		 * 학생들의 성적을 관리하기 위한 용도의 클래스 생성
		 * 	학생 클래스
		 * 		멤버 변수 : 성적 배열, 이름, 학년
		 * 		멤버 메서드 : 모든 성적 출력, 과목 점수 출력, 과목 점수 수정, 성적 추가 / 삭제
		 * 성적 클래스
		 * 		멤버 변수 : 과목명, 점수, 등급
		 * 		멤버 메서드 : 점수로 등급을 산출하는 메서드
		 * 
		 */
			// 기본생성자 사용
			//	Record r = new Record(); 
		
			// 매개변수가 있는 생성자
			Record r = new Record("국어", 87.5); 
			
			System.out.println(r.getclassName());
			System.out.println(r.getScore());
			System.out.println(r.getGrade());
			
			// 
			r.setScore(71.8);
			
			System.out.println(r.getclassName());
			System.out.println(r.getScore());
			System.out.println(r.getGrade());
			
			
			Student s = new Student("홍길동");
			
			String table = s.getGradeTable();
			System.out.print(table);
			
			System.out.println(s.getGradeTable());
			
			s.addRecord("과학", 90);
			s.addRecord("수학", 100);
			s.addRecord("국어", 50);
			System.out.println(s.getGradeTable());

			
			
	}

}

package kr.co.view;

import java.util.ArrayList;

import kr.co.db.vo.EmployeeVO;

public class EmployeeView {

	public void print(ArrayList<EmployeeVO> datas) {
		for(EmployeeVO emp: datas) {
			this.print(emp);		
		}
	}

	public void print(EmployeeVO data) {
		if(data == null) {
			System.out.println("조회 결과 조건에 해당하는 번호가 없습니다.");
		}
		
		System.out.println(data);
	}

}

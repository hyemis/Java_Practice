package kr.co.exam04;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Exam {

	public static void main(String[] args) {
		/*
		 * 현재 날짜를 구하고 다음 형식에 맞추어 출력하세요.
		 * 		1. 2022/01/01
		 * 		2. 2022년 01월 01일
		 * 		3. 12시 15분 45초
		 * 		4. 12:15:45
		 * 		
		 * 2022년 10월 중 주말에 해당하는 날짜만 문자열 배열에 담아 출력하세요. 
		 * 
		 * 자신의 생년월일을 입력하면 현재로부터 몇 일 남았는지 알려주는 D-DAY 정보를
		 * 출력하세요.
		 * 		- GregorianCanledar의 isLeapYear()를 사용하면 윤년을 알 수 있습니다.
		 * 		- GregorianCanledar의 getMaximum(Caldedar.DAY_OF_MONTH) 을
		 * 		  사용하면 해당 월의 최대 일자를 알 수 있습니다. 
		 */
		

		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy/mm/dd");
		
		String strDate = df.format(date);
		System.out.println(strDate);
		
		df.applyPattern("yyyy년 MM월 dd일");
		strDate = df.format(date);
		System.out.println(strDate);
		
		df.applyPattern("HH시 mm분 ss초");
		strDate = df.format(date);
		System.out.println(strDate);
		
		df.applyPattern("HH:mm:ss");
		strDate = df.format(date);
		System.out.println(strDate);
		
		
		// 2.
		df = new SimpleDateFormat("yyyy/MM/dd");
		GregorianCalendar gc = new GregorianCalendar(2022,9,1);
		
		String[] weekend = new String[0];
		for(int i = 0; i < gc.getMaximum(Calendar.DAY_OF_MONTH); i++)
			
			switch(gc.get(Calendar.DAY_OF_WEEK)) {
			case Calendar.SATURDAY:
			case Calendar.SUNDAY:
				weekend = Arrays.copyOf(weekend, weekend.length + 1);
				weekend[weekend.length -1] = df.format(gc.getTime());
			}
			gc.add(Calendar.DATE, 1);
			System.out.println(Arrays.toString(weekend));
		}
	
		
	}



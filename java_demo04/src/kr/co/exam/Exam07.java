package kr.co.exam;

import java.util.Scanner;

public class Exam07 {

	public static void main(String[] args) {
		/*
		 * 다음과 같은 모양의 출력을 만들어 보세요.
		 * 
		 * 1  2  3  4  5
		 * 6  7  8  9  10
		 * 11 12 13 14 15
		 * 16 17 18 19 20
		 * 21 22 23 24 25
		 * 
		 * 숫자 사이의 공백은 Space 가 아닌 Tab(\t) 로 만드세요. 
		 *
		 */
		
		/* 1 ~ 31 까지의 수자를 달력 형태처럼 출력하세요.
		 * 1  2  3  4  5  6  7
		 * 8  9  10 11 12 13 14
		 * 15 16 17 18 19 20 21
		 * 22 23 24 25 26 27 28
		 * 29 30 31
		 * 
		 * 숫자 사이의 공백은 Space 가 아닌 Tab(\t) 로 만드세요. 
		 * (반드시 중첩 반복문 아니여도 됨. )
		 */
		
		/*
		 * 다음과 같은 모양을 출력해서 만들어 보세요.
		 * 1
		 * 2  3
		 * 4  5  6
		 * 7  8  9  10
		 * 11 12 13 14 15
		 * 
		 */
		
		/*
		 * 사용자 입력으로 월, 시작 요일, 마지막 일자 정보를 
		 * 입력 받아 다음 예시와 같이 출력하세요.
		 * 예시
		 * 
		 * 		월 : 10
		 * 		시작요일 : 토
		 * 		마지막 일자 : 31
		 * 
		 * 		10월
		 * 		일	월	화	수	목	금 	토
		 * 								1
		 * 		2	3	4	5	6	7	8	
		 * 		9	10	11	12	13	14	15
		 * 		16	17	18	19	20	21	22
		 * 		23	24	25	26	27	28	29
		 * 		30	31
		 */
		/*
		for(int i=1; i<=25; i++) {
			System.out.printf("%d\t", i);
			if(i % 5 == 0) {
				System.out.print("\n");
			}
			}
		*/
		System.out.println();
		
		/*
		for(int j=1; j<=31; j++) {
			System.out.printf("%d\t",j);
			if (j % 7 == 0) {
				System.out.print("\n"); 
			} 
		}
		*/
		/*
		System.out.println();
		
		int colCount = 1, rowCount = 1;
		for(int k =1; k<= 15; k++, colCount++) {
			System.out.printf("%d\t", k);
			if(colCount == rowCount) {
				System.out.print("\n");
				colCount = 0;
				rowCount++;
			}
			
		}
		
		int n = 0;
		for(int m = 1 ; m<= 5; m++) {
			for (int o = 1; o <= m; o++) {
				n++;
				System.out.printf("%d\t", n);
			}
			System.out.print("\n");
		} // m=rowCount. o=colCount.
		*/
		System.out.println();
		
		Scanner sc = new Scanner(System.in); 
		
		int month, day = 0; int lastDay;
		String startDate;
		
		System.out.print("월 : ");
		month = sc.nextInt(); sc.nextLine();
		
		System.out.print("시작요일 : ");
		startDate = sc.nextLine();
		
		System.out.print("마지막일자 : ");
		lastDay = sc.nextInt();
		
		System.out.printf("%d월\n", month);
		
		System.out.print("일\t월\t화\t수\t목\t금\t토\n");
		int dateIndex = 0;
		switch(startDate) {
		case "일" : 
			day = 7; dateIndex = 0; break;
		case "월" : 
			day = 6; dateIndex = 6; break;
		case "화" : 
			day = 5; dateIndex = 5; break;
		case "수" : 
			day = 4; dateIndex = 4; break;
		case "목" : 
			day = 3; dateIndex = 3; break;
		case "금" : 
			day = 2; dateIndex = 2; break;
		case "토" : 
			day = 1; dateIndex = 1; break;
		}
		
		for(day = day - 7 + 1; day <= lastDay; day++) {
			if(day >=1) {
				System.out.printf("%d\t", day);
				if(day % 7 == dateIndex) {
					System.out.print("\n");	
				}
			} else {
				System.out.print("\t");
			} 
			}
				
		}
	}


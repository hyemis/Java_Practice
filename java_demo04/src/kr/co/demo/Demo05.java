package kr.co.demo;

public class Demo05 {

	public static void main(String[] args) {
		/*
		 *  While 반복문
		 *  
		 *  While(조건식){
		 *  	실행 코드;
		 *  }
		 *  
		 *  조건식의 값이 참일 때 반복을 수행하며, 거짓이 되면 
		 *  반복을 중단한다. 
		 *  
		 *  break, continue 사용으로 반복문을 제어할 수 있다.
		 */
	
		int i = 1; // 초기식
		while(i <= 5) { //조건식
			System.out.printf("%d\n", i);
			i++; // 증감식
		}
		
		//무한 반복 , 중단 시점을 꼭 만들어야 함 
		while(true) {
			System.out.printf("%d\n", i);
			if(i >= 10) {
				break;
			}
			i++;
		}
		
		//일정 횟수 반복을 위한 반복문
		int x = 1;
		while(x<=5) {
			System.out.printf("%d\n", x++);
		}
		
		// 일정 횟수 반복을 위한 반복문(0부터 시작)
		int y = 0;
		while( y<=5 ) {
			System.out.printf("%d\n", y++);
		}
		
		// 1~n까지의 범위에서 m의 배수에 해당하는 값만 출력
		
		int n = 100;
		int m = 5;
		i = 1;
		while(i <= n) {
			if (i % m == 0) {
				System.out.printf("%d\n", i);
			} 
			i++;
		}
		
		i = 1;
		while(i <= 9) {
			int j = 1;
			while (j <= 9) {
				System.out.printf("%d X %d = %d\t", j, i, j*i);
				j++;
			}
			System.out.print("\n");
			i++;
		}
		
	}

}

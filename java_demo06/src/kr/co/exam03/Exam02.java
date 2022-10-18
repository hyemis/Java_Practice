package kr.co.exam03;

public class Exam02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Speaker speaker1 = new Speaker ();
		Speaker speaker2 = new Speaker (40);
		Speaker speaker3 = new Speaker (40, true);
		Speaker speaker4 = new Speaker (40, true, true);
		
		speaker4.toggleMute();
		speaker4.soundUp();
		System.out.println(speaker4.getState());
		
		
		
	}

}

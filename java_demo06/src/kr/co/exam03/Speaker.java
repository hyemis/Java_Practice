package kr.co.exam03;

public class Speaker {
	
	// 멤버 변수
	int sound;
	boolean mute;
	boolean power;
	
	// 생성자
	
	public Speaker() {}
	public Speaker(int sound) {
		this(sound, false, false); // 클래스 외부 뿐만 아니라 내부에서도 생성자호출은 가능하다. 
	}
	
	public Speaker (int sound, boolean mute) {
		this(sound, mute, false); //  반드시 생성자 호출을 구현부의 첫번째 줄에 들어가야함. 
	}
	
	public Speaker (int sound, boolean mute, boolean power) {
		this.setSound(sound);
		this.mute = mute;
		this.power = power;
	}
	
	// 멤버 메서드
	// 접근 제한자 void 메서드명 - void면 return 문 필요없음 
	// 접근제한자 void 반환타입 메서드명 { return 문 ~;}
	// 리턴값은 반드시 한개.
	private void setSound(int Sound) {
		if(sound >= 0 && sound <= 100) {
			this.sound = sound;
		} else {
			this.sound = 0;
		}
	}
	
	
	public void soundUp() {
	if(this.sound + 5 <= 100) {
		this.sound += 5;
	} else {
		this.sound = 100;
	}
	}
	
	public void soundDown() {
		if(this.sound -5 >= 0) {
			this.sound -= 5;
		} else {
			this.sound = 0;
		}
	}
	
	public void toggleMute () {  // 전원on off = 토글 
		this.mute = !this.mute;
	}
	
	public void togglePower() {
		this.power = !this.power;
	}
	
	public String getState() {
		String state = "";
		if(!this.power) {
			state = "전원 OFF";
		} else if(this.mute) {
			state = "음소거";
		} else {
			state = "음량" + this.sound;
		}
		return state;
	}

	
}

package bean.CS_main;


public class MainDAO {
	public int getYear() {
		int hr[] = {0,9};
		int thousand = 0, hundred = 0, ten=0, one = 0;
		
		//천의 자리 랜덤
		/*천의 자리는 1이나 2가 나와야 한다.
		 * Math.random()함수를 이용해 랜덤 값을 발생시키는데 int로 형변환을 해 정수값만 가져온다.
		 * 곱하기 2를 하면 정수 값이 0,1값만 나온다.
		 * 거기에 1을 더하면 1,2값만 나오게 된다.
		 */
		thousand = (int)(Math.random()*2)+1;


		//나머지 자리 랜덤
		/*
		 * 천의 자리가 1이면
		 * hr배열 1번쨰 인덱스에 저장된 9가 hundred변수에 들어간다.
		 * ten변수는 무한반복문으로 구한다.
		 * 무한반복문을 돌리되 6,7,8,9가 나오면 반복문을 종료한다.
		 * 일의 자리는 0~9중 랜덤으로 돌려서 one변수에 저장한다.
		 */
		if(thousand==1) { 
			hundred = hr[1]; 
			while(true){
				ten = (int)(Math.random()*10)+1;
				if(ten ==6 || ten ==7 || ten ==8 || ten ==9) break;
			}
			one = (int)(Math.random()*10);
		}
		
		/*
		 * 천의 자리가 2이면
		 * hr배열 0번째 인덱스에 저장된 0이 hundred변수에 들어간다.
		 * 십의 자리 0,1,2중에서 랜덤 값이 나오게 한다.
		 * 십의 자리가 2이면 일의 자리는 0이된다. (현재 최대 2020년)
		 * 십의 자리가 2가 아니면 0~9 랜덤 값이 들어간다. 
		 */
		else if(thousand==2) {
			hundred = hr[0];
			ten = (int)(Math.random()*3);
			if(ten==2) one = 0;
			else one = (int)(Math.random()*10);
		}

		int year = thousand*1000+hundred*100+ten*10+one; //숫자들을 합친다.
		return year;
	}

}


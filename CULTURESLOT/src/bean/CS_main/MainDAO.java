package bean.CS_main;


public class MainDAO {
	public int getYear() {
		int hr[] = {0,9};
		int thousand = 0, hundred = 0, ten=0, one = 0;
		
		//õ�� �ڸ� ����
		/*õ�� �ڸ��� 1�̳� 2�� ���;� �Ѵ�.
		 * Math.random()�Լ��� �̿��� ���� ���� �߻���Ű�µ� int�� ����ȯ�� �� �������� �����´�.
		 * ���ϱ� 2�� �ϸ� ���� ���� 0,1���� ���´�.
		 * �ű⿡ 1�� ���ϸ� 1,2���� ������ �ȴ�.
		 */
		thousand = (int)(Math.random()*2)+1;


		//������ �ڸ� ����
		/*
		 * õ�� �ڸ��� 1�̸�
		 * hr�迭 1���� �ε����� ����� 9�� hundred������ ����.
		 * ten������ ���ѹݺ������� ���Ѵ�.
		 * ���ѹݺ����� ������ 6,7,8,9�� ������ �ݺ����� �����Ѵ�.
		 * ���� �ڸ��� 0~9�� �������� ������ one������ �����Ѵ�.
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
		 * õ�� �ڸ��� 2�̸�
		 * hr�迭 0��° �ε����� ����� 0�� hundred������ ����.
		 * ���� �ڸ� 0,1,2�߿��� ���� ���� ������ �Ѵ�.
		 * ���� �ڸ��� 2�̸� ���� �ڸ��� 0�̵ȴ�. (���� �ִ� 2020��)
		 * ���� �ڸ��� 2�� �ƴϸ� 0~9 ���� ���� ����. 
		 */
		else if(thousand==2) {
			hundred = hr[0];
			ten = (int)(Math.random()*3);
			if(ten==2) one = 0;
			else one = (int)(Math.random()*10);
		}

		int year = thousand*1000+hundred*100+ten*10+one; //���ڵ��� ��ģ��.
		return year;
	}

}


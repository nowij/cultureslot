package bean.CS_admin;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import bean.CS_member.MemberDTO;

@Service
public class MailServiceDAO {
	@Autowired
	private JavaMailSender mailSender;
	private SqlSessionTemplate sqlSession = null;
	public MailServiceDAO(SqlSessionTemplate sqlSession) { //�����ڸ� �̿��� ��ü�� ������
		this.sqlSession = sqlSession;
	}
	// �̸��� ����Ű ����� �޼���
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}

	// ���� ���� �̿��� Ű ����
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		System.out.println(init());
		return init();
	}
    
	// ȸ������ �߼� �̸���(����Ű �߼�)
 	public void sendUserKey(String email, String id, String ip) {
 		
 		String key = getKey(false,20);
 		MemberDTO dto = new MemberDTO();
 		dto.setId(id);
 		dto.setKey(key);
 		System.out.println(dto.getKey());
 		//ȸ�� key�÷� ���� ����Ű(������) �ֱ�
 		sqlSession.update("CS_member.sendKey", dto); 
 	
 		MimeMessage mail = mailSender.createMimeMessage();
 		String htmlStr = "<h1>�ȳ��ϼ��� CULTURES'LOT�Դϴ�.</h1><br><br>" 
 				+ "<h2>" + id + "��!</h2>" + "<p>�����ϱ� ��ư�� ������ ȸ�������� �Ϸ�˴ϴ�!! " 
 				+ "<a href='http:/"+ip+":8080/CULTURESLOT/member/confirmEmail.do?id="+ id +"&key="+key+"'>�����ϱ�</a></p>"
 				+ "(Ȥ�� �߸� ���޵� �����̶�� �� �̸����� �����ϼŵ� �˴ϴ�)";
 		try {
 			mail.setSubject("[��������] CULTURES'LOT ���������Դϴ�", "UTF-8");
 			mail.setText(htmlStr, "UTF-8", "html");
 			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
 			mailSender.send(mail);
 		} catch (MessagingException e) {
 			e.printStackTrace();
 		}
 	}
 	
 	public int confirmKey(String id, String key) {
 		int result = 0;
 		MemberDTO dto = new MemberDTO();
 		dto.setId(id);
 		dto.setKey(key);
 		String DBkey = sqlSession.selectOne("CS_member.confirmKey", id);

 		if(key.equals(DBkey)) {
 			dto.setKey("Y");
 			sqlSession.update("CS_member.updateKey", dto);
 			result = 1;
 		}else {
 			result = 0;
 		}
 		return result;
 	}

}

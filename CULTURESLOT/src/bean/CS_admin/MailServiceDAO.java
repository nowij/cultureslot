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
	public MailServiceDAO(SqlSessionTemplate sqlSession) { //생성자를 이용해 객체를 가져옴
		this.sqlSession = sqlSession;
	}
	// 이메일 인증키 만드는 메서드
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

	// 랜덤 값을 이용한 키 생성
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		System.out.println(init());
		return init();
	}
    
	// 회원가입 발송 이메일(인증키 발송)
 	public void sendUserKey(String email, String id, String ip) {
 		
 		String key = getKey(false,20);
 		MemberDTO dto = new MemberDTO();
 		dto.setId(id);
 		dto.setKey(key);
 		System.out.println(dto.getKey());
 		//회원 key컬럼 값에 인증키(랜덤값) 넣기
 		sqlSession.update("CS_member.sendKey", dto); 
 	
 		MimeMessage mail = mailSender.createMimeMessage();
 		String htmlStr = "<h1>안녕하세요 CULTURES'LOT입니다.</h1><br><br>" 
 				+ "<h2>" + id + "님!</h2>" + "<p>인증하기 버튼을 눌러야 회원가입이 완료됩니다!! " 
 				+ "<a href='http:/"+ip+":8080/CULTURESLOT/member/confirmEmail.do?id="+ id +"&key="+key+"'>인증하기</a></p>"
 				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
 		try {
 			mail.setSubject("[본인인증] CULTURES'LOT 인증메일입니다", "UTF-8");
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

package bean.CS_board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class NoticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	public NoticeDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void inputNotice(NoticeDTO notice) {
		System.out.println("dao : "+notice.getN_writer());
		sqlSession.insert("notice.inputNotice", notice);
		
	}
	// 怨듭��궗�빆 寃뚯떆湲� 媛��닔
	public int noticeCount() {
		int count = 0;
		count = sqlSession.selectOne("notice.noticeCount");
		return count;
	}

	// 怨듭��궗�빆 寃뚯떆湲� 紐⑸줉 異쒕젰 
	public List noticeList() {    
		return sqlSession.selectList("notice.noticeList");
	}
	
	// 怨듭��궗�빆 寃뚯떆湲� 媛��닔 �꽭湲�
	public String selectNum(String n_num) {
		return sqlSession.selectOne("notice.selectNum",n_num);
	}
	
	// 怨듭��궗�빆 寃뚯떆湲� �궡�슜 異쒕젰
	public List selectNotice(int n_num) {
		return sqlSession.selectList("notice.selectNotice", n_num);
	}
	// 怨듭��궗�빆 寃뚯떆湲� �닔�젙
	public void modifyNotice(NoticeDTO notice) {
		sqlSession.update("notice.modifyNotice", notice);
	}
	
	// 怨듭��궗�빆 寃뚯떆湲� �궘�젣
	public void deleteNotice(String n_num) {
		sqlSession.delete("notice.deleteNotice", n_num);
	}
	
}

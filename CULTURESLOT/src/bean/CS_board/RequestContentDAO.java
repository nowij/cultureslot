package bean.CS_board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class RequestContentDAO {

	private SqlSessionTemplate sqlSession = null;
	
	public RequestContentDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void insertRequest(RequestContentDTO rc) {
		sqlSession.insert("rc.insertRequest", rc);
	}
	
	public int requestCount() {
		return sqlSession.selectOne("rc.requestCount");
	}
	
	public List RCList() {
		return sqlSession.selectList("rc.RCList");
	}

	public int getHitCount(int idx) {
		return sqlSession.selectOne("rc.countHit", idx);	
	}
	
	public void updateHitCount(RequestContentDTO rc) {
		sqlSession.update("rc.upHit", rc);
		System.out.println("업데이트");
	}
	
	public List selectContent(int idx) {
		return sqlSession.selectList("rc.selectRcContent", idx);
	}
	
	public int selectIdx(String idx) {
		return sqlSession.selectOne("rc.selectIdx", idx);
	}
	
	public void deleteRcContent(int idx) {
		sqlSession.delete("rc.deleteRcContent", idx);
	}
	
	public int modifyRcContent(RequestContentDTO rc) {
		int x = 0;
		if (x == 0) {
			sqlSession.update("rc.modifyRcContent", rc);
			x = 1;
		}
		return x;
	}
	
	public String selectPw(int idx) {
		return sqlSession.selectOne("rc.selectPw", idx);
	}
	public int updateState(int rc_num) {
		sqlSession.update("rc.updateState", rc_num);
		return sqlSession.selectOne("rc.commentCount",rc_num);
	}
	public int downState(int rc_num) {
		sqlSession.update("rc.downState", rc_num);
		return sqlSession.selectOne("rc.commentCount", rc_num);
	}
	
	public int myRcCount(String id) {
		return sqlSession.selectOne("rc.myCount", id);
	}
}

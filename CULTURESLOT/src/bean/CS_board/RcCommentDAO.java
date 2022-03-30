package bean.CS_board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class RcCommentDAO {
	private SqlSessionTemplate sqlSession = null;
	public RcCommentDAO(SqlSessionTemplate sqlSession) { 
		this.sqlSession = sqlSession;
	}

		public List getRcComment(int rc_num) {
			List list = sqlSession.selectList("CS_RcComment.getAllRcComment",rc_num);
			return list;
		}
		

		public void insertRcComment(RcCommentDTO rccommentdto) {
			sqlSession.insert("CS_RcComment.insertRcComment", rccommentdto);
		}
		

		public void deleteRcComment(RcCommentDTO rccommentdto) {
			sqlSession.delete("CS_RcComment.deleteRcComment", rccommentdto);
		}
		
		public List getMyRccomment(String id) {
			List list = sqlSession.selectList("CS_RcComment.selectMyRccomment", id);
			return list;
		}
		
		public void deleteAllrccomment(int rc_num) {
			sqlSession.delete("CS_RcComment.deleteAllrccomment", rc_num);
		}
}

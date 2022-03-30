package bean.CS_board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class CommentDAO {
	private SqlSessionTemplate sqlSession = null;
	public CommentDAO(SqlSessionTemplate sqlSession) { //占쏙옙占쏙옙占쌘몌옙 占싱울옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙
		this.sqlSession = sqlSession;
	}
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙占�
	public List getComment(CommentDTO commentdto) {
		List list = sqlSession.selectList("CS_comment.getAllComment", commentdto);
		return list;
	}
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙訪占쏙옙占�
	public void insertComment(CommentDTO commentdto) {
		sqlSession.insert("CS_comment.insertComment", commentdto);
	}
	
	//占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙
	public void deleteComment(CommentDTO commentdto) {
		sqlSession.delete("CS_comment.deleteComment", commentdto);
	}
	
	//占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙
	public List getMyComment(CommentDTO dto) {
		List list = sqlSession.selectList("CS_comment.selectMyComment", dto);
		return list;
	}
	
	public int countMyComment(String id) {
		return sqlSession.selectOne("CS_comment.countMyComment", id);
	}

	public void deleteAllcomment(int content_num) {
		sqlSession.delete("CS_comment.deleteAllComment", content_num);
	}
}

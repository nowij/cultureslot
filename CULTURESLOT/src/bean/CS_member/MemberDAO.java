package bean.CS_member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import bean.CS_board.RequestContentDTO;

public class MemberDAO {
	private SqlSessionTemplate sqlSession = null;
	public MemberDAO(SqlSessionTemplate sqlSession) { //占쏙옙占쏙옙占쌘몌옙 占싱울옙占쏙옙 占쏙옙체占쏙옙 占쏙옙占쏙옙占쏙옙
		this.sqlSession = sqlSession;
	}
	
	public int loginCheck(MemberDTO dto) {
		int check=0;
		//0615 占쏙옙占쏙옙
		String key = (String)sqlSession.selectOne("CS_member.confirmKey", dto.getId());
		if(key == null) {
			check = 3;
		}else if(key.equals("Y")) {
			check = (int)sqlSession.selectOne("CS_member.logincheck",dto); //id占쏙옙 pw 占쏙옙치占쏙옙 占쏙옙 check占쏙옙占쏙옙 1
		}else if(!key.equals("Y")) {
			check = 2; //占싱몌옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙 占쏙옙 check占쏙옙 2
		}else {
			check=0;
		}
		return check;
		 
	 }
	 public void join(MemberDTO dto) {
		 sqlSession.insert("CS_member.join",dto);
		 
	 }
	 public List myInfo(String id) {
		 //List list = sqlSession.selectList("member.myInfo",id);
		 return sqlSession.selectList("CS_member.myInfo",id);
		 
	 
	 } 
	 public void modify(MemberDTO dto) {
		 sqlSession.update("CS_member.modifyInfo",dto);
	 }
	 public void delete(MemberDTO dto) {
		 sqlSession.delete("CS_member.delete",dto);
	 }
	 public int idcheck(String id) {
	int check = sqlSession.selectOne("CS_member.idcheck",id);
	return check;
	 }
	 
	 public List myRC_list(String id) {
		List list = sqlSession.selectList("rc.myRClist",id);
		return list;
	}
		
	public void myRCdelete(RequestContentDTO dto) {
		sqlSession.delete("rc.myRCdelete",dto);
	}
	
	public List getMyRc(int rc_num) {
		return sqlSession.selectList("rc.getMyRc", rc_num);
	}
	
	public void myRCmodify(int rc_num) {
		sqlSession.selectList("rc.myRClist",rc_num);
	}
	
}

package bean.CS_admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import bean.CS_board.CommentDTO;
import bean.CS_main.ContentDTO;
import bean.CS_main.SearchDTO;
import bean.CS_member.MemberDTO;
import bean.CS_member.ScrapeDTO;

public class AdminContentDAO {
	private SqlSessionTemplate sqlSession = null;
	public AdminContentDAO (SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	//0628 ���� ����
	//��� ���
	public List dramaList(ContentDTO dto) {
		List list = sqlSession.selectList("CS_admin.contentList_drama", dto);
		return list;
	}
	
	//��ȭ ���
	public List movieList(ContentDTO dto) {
		List list = sqlSession.selectList("CS_admin.contentList_movie", dto);
		return list;
	}
	
	//���� ���
	public List musicList(ContentDTO dto) {
		List list = sqlSession.selectList("CS_admin.contentList_music", dto);
		return list;
	}
	
	//�ִϸ��̼� ���
	public List aniList(ContentDTO dto) {
		List list = sqlSession.selectList("CS_admin.contentList_ani", dto);
		return list;
	}
	
	//������ ���
	public void musicInsert(ContentDTO dto) {
		sqlSession.insert("CS_admin.musicInsert", dto);
	}
	public void movieInsert(ContentDTO dto) {
		sqlSession.insert("CS_admin.movieInsert", dto);
	}
	public void dramaInsert(ContentDTO dto) {
		sqlSession.insert("CS_admin.dramaInsert", dto);
	}
	public void aniInsert(ContentDTO dto) {
		sqlSession.insert("CS_admin.aniInsert", dto);
	}
	
	//�ش� ������ �˻�
	public List musicSelect(int num) {
		List list = sqlSession.selectList("CS_admin.musicSelect", num);
		return list;
	}
	public List movieSelect(int num) {
		List list = sqlSession.selectList("CS_admin.movieSelect", num);
		return list;
	}
	public List dramaSelect(int num) {
		List list = sqlSession.selectList("CS_admin.dramaSelect", num);
		return list;
	}
	public List aniSelect(int num) {
		List list = sqlSession.selectList("CS_admin.aniSelect", num);
		return list;
	}
	
	//������ ����
	public void musicPicUpdate(ContentDTO dto) {
		sqlSession.update("CS_admin.musicPicUpdate", dto);
	}
	public void moviePicUpdate(ContentDTO dto) {
		sqlSession.update("CS_admin.moviePicUpdate", dto);
	}
	public void dramaPicUpdate(ContentDTO dto) {
		sqlSession.update("CS_admin.dramaPicUpdate", dto);
	}
	public void aniPicUpdate(ContentDTO dto) {
		sqlSession.update("CS_admin.aniPicUpdate", dto);
	}
	
	public void musicUpdate(ContentDTO dto) {
		sqlSession.update("CS_admin.musicUpdate", dto);
	}
	public void movieUpdate(ContentDTO dto) {
		sqlSession.update("CS_admin.movieUpdate", dto);
	}
	public void dramaUpdate(ContentDTO dto) {
		sqlSession.update("CS_admin.dramaUpdate", dto);
	}
	public void aniUpdate(ContentDTO dto) {
		sqlSession.update("CS_admin.aniUpdate", dto);
	}
	
	//������ ����
	public void musicDelete(int num) {
		sqlSession.delete("CS_admin.musicDelete", num);
	}
	public void movieDelete(int num) {
		sqlSession.delete("CS_admin.movieDelete", num);
	}
	public void dramaDelete(int num) {
		sqlSession.delete("CS_admin.dramaDelete", num);
	}
	public void aniDelete(int num) {
		sqlSession.delete("CS_admin.aniDelete", num);
	}
	
	//��� ���
	public List commentList(CommentDTO dto) {
		return sqlSession.selectList("CS_admin.commentList", dto);
	}
	//��� �� ����
	public int commentCount() {
		return sqlSession.selectOne("CS_admin.commentCount");
	}	
	//��� ����
	public void commentDelete(int num) {
		sqlSession.delete("CS_admin.commentDelete", num);
	}
	
	//0628 ���� ���� ������ ���� 0705 ���� ����
	public int musicContentNum(ContentDTO dto) {
		int contentNum = sqlSession.selectOne("CS_admin.musicContentNum", dto);
		return contentNum;
	}
	public int movieContentNum(ContentDTO dto) {
		int contentNum = sqlSession.selectOne("CS_admin.movieContentNum", dto);
		return contentNum;
	}
	public int dramaContentNum(ContentDTO dto) {
		int contentNum = sqlSession.selectOne("CS_admin.dramaContentNum", dto);
		return contentNum;
	}
	public int aniContentNum(ContentDTO dto) {
		int contentNum = sqlSession.selectOne("CS_admin.aniContentNum", dto);
		return contentNum;
	}
	
	//0630 ���� ���� ���� ����
	public String deleteMusicFile(int num) {
		String dfi = sqlSession.selectOne("CS_admin.deleteMusicFile", num);
		return dfi;
	}
	public String deleteMovieFile(int num) {
		String dfi = sqlSession.selectOne("CS_admin.deleteMovieFile", num);
		return dfi;
	}
	public String deleteDramaFile(int num) {
		String dfi = sqlSession.selectOne("CS_admin.deleteDramaFile", num);
		return dfi;
	}
	public String deleteAniFile(int num) {
		String dfi = sqlSession.selectOne("CS_admin.deleteAniFile", num);
		return dfi;
	}
	
	public List searchMusic(String text) {
		return sqlSession.selectList("CS_admin.searchMusic", text);
	}
	public List searchMovie(String text) {
		return sqlSession.selectList("CS_admin.searchMovie", text);
	}
	public List searchDrama(String text) {
		return sqlSession.selectList("CS_admin.searchDrama", text);
	}
	public List searchAnimation(String text) {
		return sqlSession.selectList("CS_admin.searchAni", text);
	}
	
	//ȸ�� ���
	public List getMemeber(MemberDTO dto) {
		List list = sqlSession.selectList("CS_admin.getAllMember", dto);
		return list;
	}
	public int memberCount() {
		return sqlSession.selectOne("CS_admin.memberCount");
	}
	//ȸ�� ���� Ż��(����)
	public void deleteMember(String id) {
		sqlSession.delete("CS_admin.deleteMember", id);
	}
	//������ ������ ��ũ�� �� ������ ����
	public void allDeleteScrape(ScrapeDTO dto) {
		sqlSession.delete("CS_admin.allDeleteScrape", dto);
	}
	//ȸ�� ������ ��ũ���� �͵� ����
	public void deleteMemberScrape(String id) {
		sqlSession.delete("CS_admin.deleteMemberScrape", id);
	}
}

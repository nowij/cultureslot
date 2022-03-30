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
	//0628 지원 수정
	//드라마 목록
	public List dramaList(ContentDTO dto) {
		List list = sqlSession.selectList("CS_admin.contentList_drama", dto);
		return list;
	}
	
	//영화 목록
	public List movieList(ContentDTO dto) {
		List list = sqlSession.selectList("CS_admin.contentList_movie", dto);
		return list;
	}
	
	//음악 목록
	public List musicList(ContentDTO dto) {
		List list = sqlSession.selectList("CS_admin.contentList_music", dto);
		return list;
	}
	
	//애니메이션 목록
	public List aniList(ContentDTO dto) {
		List list = sqlSession.selectList("CS_admin.contentList_ani", dto);
		return list;
	}
	
	//콘텐츠 등록
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
	
	//해당 콘텐츠 검색
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
	
	//콘텐츠 수정
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
	
	//콘텐츠 삭제
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
	
	//댓글 목록
	public List commentList(CommentDTO dto) {
		return sqlSession.selectList("CS_admin.commentList", dto);
	}
	//댓글 총 개수
	public int commentCount() {
		return sqlSession.selectOne("CS_admin.commentCount");
	}	
	//댓글 삭제
	public void commentDelete(int num) {
		sqlSession.delete("CS_admin.commentDelete", num);
	}
	
	//0628 지원 수정 콘텐츠 개수 0705 지원 수정
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
	
	//0630 지원 수정 파일 삭제
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
	
	//회원 목록
	public List getMemeber(MemberDTO dto) {
		List list = sqlSession.selectList("CS_admin.getAllMember", dto);
		return list;
	}
	public int memberCount() {
		return sqlSession.selectOne("CS_admin.memberCount");
	}
	//회원 강제 탈퇴(삭제)
	public void deleteMember(String id) {
		sqlSession.delete("CS_admin.deleteMember", id);
	}
	//콘텐츠 삭제시 스크랩 된 콘텐츠 삭제
	public void allDeleteScrape(ScrapeDTO dto) {
		sqlSession.delete("CS_admin.allDeleteScrape", dto);
	}
	//회원 삭제시 스크랩된 것도 삭제
	public void deleteMemberScrape(String id) {
		sqlSession.delete("CS_admin.deleteMemberScrape", id);
	}
}

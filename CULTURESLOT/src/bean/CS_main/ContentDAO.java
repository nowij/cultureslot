package bean.CS_main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ContentDAO {

private SqlSessionTemplate sqlSession = null;
	
	public ContentDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//0705 지원 수정
	public int countMusicYear(ContentDTO dto) {
		return sqlSession.selectOne("CS_content.countMusicYear", dto);
	}
	public int countMovieYear(ContentDTO dto) {
		return sqlSession.selectOne("CS_content.countMovieYear", dto);
	}
	public int countDramaYear(ContentDTO dto) {
		return sqlSession.selectOne("CS_content.countDramaYear", dto);
	}
	public int countAniYear(ContentDTO dto) {
		return sqlSession.selectOne("CS_content.countAniYear", dto);
	}
	
	//0629 지원 수정
	public List selectMusicList(ContentDTO dto) {		
		return sqlSession.selectList("CS_content.selectMusicList",dto);
	}
	public List selectMovieList(ContentDTO dto) {		
		return sqlSession.selectList("CS_content.selectMovieList",dto);
	}
	public List selectDramaList(ContentDTO dto) {		
		return sqlSession.selectList("CS_content.selectDramaList",dto);
	}
	public List selectAniList(ContentDTO dto) {		
		return sqlSession.selectList("CS_content.selectAniList",dto);
	}
	
	//0701 지원 수정
	public List musicContent(int content_num) {
		return sqlSession.selectList("CS_content.musicContent", content_num);
	}
	
	public List movieContent(int content_num) {
		return sqlSession.selectList("CS_content.movieContent", content_num);
	}
	
	public List dramaContent(int content_num) {
		return sqlSession.selectList("CS_content.dramaContent", content_num);
	}
	
	public List aniContent(int content_num) {
		return sqlSession.selectList("CS_content.aniContent", content_num);
	}
	
	//0706 은솔 수정
	public void updateReadCount_music(int content_num) {
		sqlSession.update("CS_content.updateReadCount_music", content_num);
	}
	public void updateReadCount_movie(int content_num) {
		sqlSession.update("CS_content.updateReadCount_movie", content_num);
	}
	
	public void updateReadCount_drama(int content_num) {
		sqlSession.update("CS_content.updateReadCount_drama", content_num);
	}
	
	public void updateReadCount_animation(int content_num) {
		sqlSession.update("CS_content.updateReadCount_animation", content_num);
	}
}

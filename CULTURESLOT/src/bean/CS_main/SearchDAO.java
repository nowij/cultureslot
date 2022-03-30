package bean.CS_main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class SearchDAO {
	private SqlSessionTemplate sqlSession = null;
	
	public SearchDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int searchCount(String search) {
		
		int count = sqlSession.selectOne("CS_main.searchCount", search);
		
		return count;
	}
	
	public int searchMusicCount(String search) {
		
		int count = sqlSession.selectOne("CS_main.searchMusicCount", search);
		
		return count;
	}
	
	public List searchMusic(String search) {
		
		List list = sqlSession.selectList("CS_main.searchMusic", search);
		
		return list;
	}
	
	public int searchMovieCount(String search) {
		
		int count = sqlSession.selectOne("CS_main.searchMovieCount", search);
		
		return count;
	}
	
	public List searchMovie(String search) {
		
		List list = sqlSession.selectList("CS_main.searchMovie", search);
		
		return list;
	}
	
	public int searchDramaCount(String search) {
		
		int count = sqlSession.selectOne("CS_main.searchDramaCount", search);
		
		return count;
	}
	
	public List searchDrama(String search) {
		
		List list = sqlSession.selectList("CS_main.searchDrama", search);
		
		return list;
	}
	
	public int searchAnimationCount(String search) {
		
		int count = sqlSession.selectOne("CS_main.searchAnimationCount", search);
		
		return count;
	}
	
	public List searchAnimation(String search) {
		
		List list = sqlSession.selectList("CS_main.searchAnimation", search);
		
		return list;
	}
}

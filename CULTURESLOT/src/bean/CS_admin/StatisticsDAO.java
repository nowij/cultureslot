package bean.CS_admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class StatisticsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession = null;
	
	public StatisticsDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int countAllmember() {
		return sqlSession.selectOne("stat.countAllmember");
	}
	
	public List countAgeGroup() {
		return sqlSession.selectList("stat.countAgeGroup");
	}
	
	public int countMaleGroup() {
		return sqlSession.selectOne("stat.countMaleGroup");
	}
	public int countFemaleGroup() {
		return sqlSession.selectOne("stat.countFemaleGroup");
	}
	/// 0701 add - eunsol
	public int allScrapeCount() {
		return sqlSession.selectOne("stat.allScrapeCount");
	}
	public int allScrapeContentCount() {
		return sqlSession.selectOne("stat.allScrapeContentCount");
	}
	public List selectAllScrapeTitleTop5() {
		return sqlSession.selectList("stat.selectAllScrapeTitleTop5");
	}
	/// 0703 add - eunsol
	public List selectAgeGroupAndGenderScrape() {
		return sqlSession.selectList("stat.selectAgeGroupAndGenderScrape");
	}
}

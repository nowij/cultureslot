package bean.CS_member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ScrapeDAO {
	private SqlSessionTemplate sqlSession = null;
	
	public ScrapeDAO(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public void scrape(ScrapeDTO scrapedto) {
		sqlSession.insert("CS_scrape.scrape", scrapedto);
	}
	
	public int scrapeCheck(ScrapeDTO scrapedto) {
		int check = sqlSession.selectOne("CS_scrape.scrapeCheck", scrapedto);
		
		return check;
	}
	
	public int scrapeCount(ScrapeDTO scrapedto) {
		int count = sqlSession.selectOne("CS_scrape.scrapeCount", scrapedto);
		
		return count;
	}
	
	public List scrapeList(ScrapeDTO scrapedto) {
		List list = sqlSession.selectList("CS_scrape.scrapeList", scrapedto);
		
		return list;
	}
	
	public void deleteScrape(ScrapeDTO scrapedto) {
		sqlSession.delete("CS_scrape.deleteScrape", scrapedto);
	}
}

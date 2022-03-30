package model.CS_member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.CS_member.ScrapeDAO;
import bean.CS_member.ScrapeDTO;

@Controller
@RequestMapping("/CS_scrape/")
public class ScrapeBean {
	
	@Autowired
	private ScrapeDAO scrapedao = null;
	
	@RequestMapping("scrapePro.do")
	public String scrapePro(HttpServletRequest request, HttpSession session, ScrapeDTO scrapedto, Model model) {
		String id = (String)session.getAttribute("memId");
		String title = request.getParameter("title");
		
		scrapedto.setTitle(title);
		
		if (id == null) {
			model.addAttribute("id", id);
		}
		
		else if (id != null) {
			scrapedto.setId(id);
			int check = scrapedao.scrapeCheck(scrapedto);

			model.addAttribute("id", id);

			if (check == 1) {
				model.addAttribute("check", check);
			
				return "/CS_scrape/scrapePro";
			}
			
			else if (check != 1) {
				scrapedao.scrape(scrapedto);			
				model.addAttribute("check", check);
				
			}
		}
		
		return "/CS_scrape/scrapePro";		
	}
	
	@RequestMapping("scrapeList.do")
	public String scrapeList(HttpSession session, ScrapeDTO scrapedto, Model model, HttpServletRequest request) {
		String id = (String)session.getAttribute("memId");
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		scrapedto.setId(id);
		
		int pageSize = 5;
		int scrapeCount = scrapedao.scrapeCount(scrapedto);
		if(scrapeCount>0) {
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1)*pageSize+1;
			int endRow = currentPage*pageSize;
			
			scrapedto.setStart(startRow);
			scrapedto.setEnd(endRow);
			
			List scrapeList = scrapedao.scrapeList(scrapedto);
			
			int pageCount = scrapeCount / pageSize + (scrapeCount%pageSize ==0?0:1);
			int startPage = (int)(currentPage/10)*10+1;
			int pageBlock = 10;
			int endPage = startPage+pageBlock-1;
			if(endPage > pageCount) endPage = pageCount;
			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("scrapeList", scrapeList);	
		}
	
		model.addAttribute("scrapeCount", scrapeCount);	
		
		return "/CS_scrape/scrapeList";
	}
	
	@RequestMapping("scrapeDelete.do")
	public String scrapeDelete(HttpSession session, HttpServletRequest request, ScrapeDTO scrapedto) {
		String id = (String)session.getAttribute("memId");
		
		scrapedto.setId(id);
				
		scrapedao.deleteScrape(scrapedto);
		
		return "/CS_scrape/scrapeDelete";
	}
}

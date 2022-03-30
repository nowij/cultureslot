package model.CS_main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.CS_main.MainDAO;
import bean.CS_main.SearchDAO;

@Controller
@RequestMapping("/CS_main/")
public class MainBean {
	@Autowired
	private MainDAO dao = null;
	
	@Autowired
	public SearchDAO sdao = null;
	
	@RequestMapping("mainTop.do")
	public String mainTop() {
		return "/CS_main/mainTop";
	}
	
	@RequestMapping("main.do")
	public String main(Model model, HttpSession session) {
		String page = "/CULTURESLOT/CS_main/main.do";
		session.setAttribute("page", page);
		return "/CS_main/main";
	}
	
	@RequestMapping("searchList.do")
	public String searchList(String search, Model model) {
		
		int count = sdao.searchCount(search);
		int searchMusicCount = sdao.searchMusicCount(search);
		int searchMovieCount = sdao.searchMovieCount(search);
		int searchDramaCount = sdao.searchDramaCount(search);
		int searchAnimationCount = sdao.searchAnimationCount(search);
		
		List searchMusic = sdao.searchMusic(search);
		List searchMovie = sdao.searchMovie(search);
		List searchDrama = sdao.searchDrama(search);
		List searchAnimation = sdao.searchAnimation(search);
		
		if(searchMusic.size()>=6) {
			model.addAttribute("musicsize", searchMusic.size());
		}
		if(searchMovie.size()>=6) {
			model.addAttribute("moviesize", searchMovie.size());
		}
		if(searchDrama.size()>=6) {
			model.addAttribute("dramasize", searchDrama.size());
		}
		if(searchAnimation.size()>=6) {
			model.addAttribute("anisize", searchAnimation.size());
		}
		
		model.addAttribute("search", search);
		model.addAttribute("count", count);
		
		model.addAttribute("searchMusicCount", searchMusicCount);
		model.addAttribute("searchMusic", searchMusic);
		
		model.addAttribute("searchMovieCount", searchMovieCount);
		model.addAttribute("searchMovie", searchMovie);
		
		model.addAttribute("searchDramaCount", searchDramaCount);
		model.addAttribute("searchDrama", searchDrama);
		
		model.addAttribute("searchAnimationCount", searchAnimationCount);
		model.addAttribute("searchAnimation", searchAnimation);
		
		return "/CS_main/Search/searchList";
	}
	
	@RequestMapping("searchMusic.do")
	public String searchMusic(Model model, HttpServletRequest request){
		String search = request.getParameter("search");
		int searchMusicCount = sdao.searchMusicCount(search);
		
		List searchMusic = sdao.searchMusic(search);
		
		model.addAttribute("search", search);
		model.addAttribute("searchMusicCount", searchMusicCount);
		model.addAttribute("searchMusic", searchMusic);
		
		return "/CS_main/Search/searchMusic";
	}
	
	@RequestMapping("searchMovie")
	public String searchMovie(Model model, HttpServletRequest request) {
		String search = request.getParameter("search");
		int searchMovieCount = sdao.searchMovieCount(search);
		
		List searchMovie = sdao.searchMovie(search);
		
		model.addAttribute("search", search);
		model.addAttribute("searchMovieCount", searchMovieCount);
		model.addAttribute("searchMovie", searchMovie);
		
		return "/CS_main/Search/searchMovie";
	}
	@RequestMapping("searchDrama.do")
	public String searchDrama(Model model, HttpServletRequest request){
		String search = request.getParameter("search");
		int searchDramaCount = sdao.searchDramaCount(search);
		
		List searchDrama = sdao.searchDrama(search);
		
		model.addAttribute("search", search);
		model.addAttribute("searchDramaCount", searchDramaCount);
		model.addAttribute("searchDrama", searchDrama);
		
		return "/CS_main/Search/searchDrama";
	}
	
	@RequestMapping("searchAnimation")
	public String searchAnimation(Model model, HttpServletRequest request) {
		String search = request.getParameter("search");
		int searchAnimationCount = sdao.searchAnimationCount(search);
		
		List searchAnimation = sdao.searchAnimation(search);
		
		model.addAttribute("search", search);
		model.addAttribute("searchAnimationCount", searchAnimationCount);
		model.addAttribute("searchAnimation", searchAnimation);
		
		return "/CS_main/Search/searchAnimation";
	}
	
	@RequestMapping("mainRandom.do")
	public @ResponseBody String mainRandom(Model model) {
		String randomYear = String.valueOf(dao.getYear());
		//System.out.println("bean에서 랜덤 값 확인 : "+randomYear); //확인용 (나중에 지우기)
		return randomYear;
	}
	

}

package model.CS_main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.CS_board.CommentDAO;
import bean.CS_board.CommentDTO;
import bean.CS_main.ContentDAO;
import bean.CS_main.ContentDTO;
import bean.CS_main.SearchDTO;


@Controller
@RequestMapping("/CS_content/")
public class ContentBean {
	
	@Autowired
	private ContentDAO contentDao = null;
	
	//0611현민 추가
	@Autowired
	private CommentDAO commentdao = null;
	
	@RequestMapping("genre.do")
	public String genre(HttpSession session, Model model, String year) {
		String page = "/CULTURESLOT/CS_content/genre.do?year="+year;
		session.setAttribute("page", page);
		model.addAttribute("year", year);
		return "/CS_content/genreSelect";
	}
	
	@RequestMapping("genreList.do")
	public String genreList(HttpServletRequest request, Model model, ContentDTO dto) {
		//0629 지원 수정
		String year= request.getParameter("year");
		String genre = request.getParameter("genre");
		//String title = request.getParameter("title");
		String pageNum = request.getParameter("pageNum");
		List contentList = null;
		int pageSize = 16;
		//0704 지원 수정
		String country_category = request.getParameter("country");
		if (pageNum == null) {
	        pageNum = "1";
	    }
		
		if(country_category==null) {
			if(genre.equals("애니메이션")) {
				country_category = "해외";
			}else {
				country_category = "국내";
			}
		}
		model.addAttribute("year", year);
		model.addAttribute("genre", genre);
		model.addAttribute("country", country_category);
		
		if (year != null) {
			dto.setYear(year);
	    	dto.setCountry_category(country_category);
			int countMusic = contentDao.countMusicYear(dto);
			int countMovie = contentDao.countMovieYear(dto);
			int countDrama = contentDao.countDramaYear(dto);
			int countAni = contentDao.countAniYear(dto); 
			String msg1 = "검색 결과가 없습니다.";
			String msg2 = "필요한 자료를 요청하세요";
			
			if (countMusic > 0 || countMovie > 0 || countDrama > 0 || countAni > 0 ) {	
				if (genre.equals("음악")){
					int currentPage = Integer.parseInt(pageNum); //string형인 pageNum을 int형으로 변환해 currentPage에 넣는다.
				    int startRow = (currentPage - 1) * pageSize + 1; //첫 번째 값 (게시판의 페이지가 몇 번째 페이지 인지
				    int endRow = currentPage * pageSize; //마지막 값
				    
			    	dto.setStart(startRow);
			    	dto.setEnd(endRow);
			    	contentList = contentDao.selectMusicList(dto); //n페이지에 있는 글을 articleList에 저장
			    
			    	int pageCount = countMusic / pageSize + ( countMusic % pageSize == 0 ? 0 : 1);
			    	int startPage = (int)(currentPage/16)*16+1;
			    	int pageBlock=10;
			    	int endPage = startPage + pageBlock-1;
			    	
			    	if (endPage > pageCount) {
			    		endPage = pageCount;
			    	}
			    	int size = contentList.size();

			    	model.addAttribute("count", size);
			    	model.addAttribute("list", contentList);
			    	model.addAttribute("pageCount", pageCount);
			    	model.addAttribute("startPage", startPage);
			    	model.addAttribute("endPage", endPage);
					
					if (countMusic == 0) {
						model.addAttribute("msg1", msg1);
						model.addAttribute("msg2", msg2);
						model.addAttribute("startPage", 0);
					}
				}	
				else if(genre.equals("영화")) {
					int currentPage = Integer.parseInt(pageNum); //string형인 pageNum을 int형으로 변환해 currentPage에 넣는다.
				    int startRow = (currentPage - 1) * pageSize + 1; //첫 번째 값 (게시판의 페이지가 몇 번째 페이지 인지
				    int endRow = currentPage * pageSize; //마지막 값
				    
			    	dto.setStart(startRow);
			    	dto.setEnd(endRow);
			    	contentList = contentDao.selectMovieList(dto); //n페이지에 있는 글을 articleList에 저장
			    
			    	int pageCount = countMovie / pageSize + ( countMusic % pageSize == 0 ? 0 : 1);
			    	int startPage = (int)(currentPage/16)*16+1;
			    	int pageBlock=10;
			    	int endPage = startPage + pageBlock-1;
			    	if (endPage > pageCount) endPage = pageCount;

			    	int size = contentList.size();
			    	model.addAttribute("count", size);
			    	model.addAttribute("list", contentList);
			    	
			    	model.addAttribute("pageCount", pageCount);
			    	model.addAttribute("startPage", startPage);
			    	model.addAttribute("endPage", endPage);
					
					if (countMovie == 0) {
						model.addAttribute("msg1", msg1);
						model.addAttribute("msg2", msg2);
						model.addAttribute("startPage", 0);
					}
				}
				else if(genre.equals("드라마")) {
					int currentPage = Integer.parseInt(pageNum); //string형인 pageNum을 int형으로 변환해 currentPage에 넣는다.
				    int startRow = (currentPage - 1) * pageSize + 1; //첫 번째 값 (게시판의 페이지가 몇 번째 페이지 인지
				    int endRow = currentPage * pageSize; //마지막 값
				    
			    	dto.setStart(startRow);
			    	dto.setEnd(endRow);
			    	contentList = contentDao.selectDramaList(dto); //n페이지에 있는 글을 articleList에 저장
			    
			    	int pageCount = countDrama / pageSize + ( countDrama % pageSize == 0 ? 0 : 1);
			    	int startPage = (int)(currentPage/16)*16+1;
			    	int pageBlock=10;
			    	int endPage = startPage + pageBlock-1;
			    	System.out.println("드라마 스페 : "+startPage);
			    	System.out.println("드라마 엔페 : "+endPage);
			    	if (endPage > pageCount) endPage = pageCount;

			    	int size = contentList.size();
			    	model.addAttribute("count", size);
			    	model.addAttribute("list", contentList);
			    	
			    	model.addAttribute("pageCount", pageCount);
			    	model.addAttribute("startPage", startPage);
			    	model.addAttribute("endPage", endPage);
			    	
					if (countDrama == 0) {
						model.addAttribute("msg1", msg1);
						model.addAttribute("msg2", msg2);
					}	
				}
				else if(genre.equals("애니메이션")) {
					int currentPage = Integer.parseInt(pageNum); //string형인 pageNum을 int형으로 변환해 currentPage에 넣는다.
				    int startRow = (currentPage - 1) * pageSize + 1; //첫 번째 값 (게시판의 페이지가 몇 번째 페이지 인지
				    int endRow = currentPage * pageSize; //마지막 값
				    
			    	dto.setStart(startRow);
			    	dto.setEnd(endRow);
			    	contentList = contentDao.selectAniList(dto); //n페이지에 있는 글을 articleList에 저장
			    
			    	int pageCount = countAni / pageSize + ( countMusic % pageSize == 0 ? 0 : 1);
			    	int startPage = (int)(currentPage/16)*16+1;
			    	int pageBlock=10;
			    	int endPage = startPage + pageBlock-1;
			    	if (endPage > pageCount) endPage = pageCount;

			    	int size = contentList.size();
			    	model.addAttribute("count", size);
			    	model.addAttribute("list", contentList);
			    	
			    	model.addAttribute("pageCount", pageCount);
			    	model.addAttribute("startPage", startPage);
			    	model.addAttribute("endPage", endPage);
					
					if (countAni == 0) {
						model.addAttribute("msg1", msg1);
						model.addAttribute("msg2", msg2);
						model.addAttribute("startPage", 0);
					}
				}	
			}

			else {
				model.addAttribute("msg1", msg1);
				model.addAttribute("msg2", msg2);
			}
		}
		return "/CS_content/genreList";
	}
	
	@RequestMapping("content.do")
	public String content(HttpServletRequest request, Model model, HttpSession session, CommentDTO dto, ContentDTO dto2) {
		//0701 지원 수정
		String genre = request.getParameter("genre");
		int content_num = Integer.parseInt(request.getParameter("num"));
		String year = request.getParameter("year");
		String title = request.getParameter("title");
		List content = null;
		//0704 지원 수정
		String page="/CULTURESLOT/CS_content/content.do?genre="+genre+"&year="+year+"&title="+title+"&num="+content_num;
		session.setAttribute("page", page);
		//0611 현민수정 - 댓글 목록
		String id = (String)session.getAttribute("memId");
		model.addAttribute("id", id);
		
		List list = commentdao.getComment(dto);
		model.addAttribute("list", list);
		

		if (genre.equals("음악")){
			content = contentDao.musicContent(content_num);
			model.addAttribute("content", content);
			//0706 은솔 추가
			contentDao.updateReadCount_music(content_num);
		}
			
		else if(genre.equals("영화")) {
			content = contentDao.movieContent(content_num);
			model.addAttribute("content", content);
			//0706 은솔 추가
			contentDao.updateReadCount_movie(content_num);
		}
			
		else if(genre.equals("드라마")) {
			content = contentDao.dramaContent(content_num);
			model.addAttribute("content", content);
			//0706 은솔 추가
			contentDao.updateReadCount_drama(content_num);
		}
			
		else if(genre.equals("애니메이션")) {
			content = contentDao.aniContent(content_num);
			model.addAttribute("content", content);
			//0706 은솔 추가
			contentDao.updateReadCount_animation(content_num);
		}
		
		return "/CS_content/content";
	}
	
	//0611 현민수정 - 댓글 등록 후 이전 페이지로 돌아온다
	//0704 지원 수정
	@RequestMapping("commentPro.do")
	public String commentPro(CommentDTO dto, Model model) {
		String title = dto.getTitle();
		String genre = dto.getCategory();
		String year = dto.getYear();
		int content_num = dto.getContent_num();
		
		model.addAttribute("title", title);
		model.addAttribute("genre", genre);
		model.addAttribute("year", year);
		model.addAttribute("num", content_num);
		
		commentdao.insertComment(dto);
		
		return "/CS_content/commentPro";
	}
	
	//0612현민추가 - 댓글삭제 후 이전 페이지로 돌아온다
	@RequestMapping("commentdeletePro.do")
	public String commentdeletePro(HttpSession session, HttpServletRequest request, Model model, CommentDTO dto) {
		
		String id = (String)session.getAttribute("memId");
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));

		String title = dto.getTitle();
		String genre = dto.getCategory();
		String year = dto.getYear();
		int content_num = dto.getContent_num();
		
		dto.setId(id); //세션에서 id를 받아와 dto에 저장을 해야함
		dto.setComment_num(comment_num); //세션에서 id를 받아와 dto에 저장을 해야함
		
		model.addAttribute("title", title);
		model.addAttribute("genre", genre);
		model.addAttribute("year", year);
		model.addAttribute("num", content_num);
		
		commentdao.deleteComment(dto);
		
		return "/CS_content/commentdeletePro";
	}
}

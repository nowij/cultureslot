package model.CS_board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.CS_board.NoticeDAO;
import bean.CS_board.NoticeDTO;

@Controller
@RequestMapping("/notice/")
public class NoticeBean {
	
	@Autowired
	private NoticeDAO noticeDao = null;
	
	// 메인 페이지 //
		// 공지사항 목록 : 메인 페이지
		@RequestMapping("noticeMainList.do")	
		public String noticeMainList(Model model, HttpServletRequest request) {	
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");	
			if (pageNum == null) {
				pageNum = "1";		
			}
				model.addAttribute("pageNum", pageNum);
			int currentPage = Integer.parseInt(pageNum); 
			
			int noticeCount = noticeDao.noticeCount();
			if (noticeCount > 0) {
				model.addAttribute("count", noticeCount);			 
				
				int number = 1;
				List noticeList = noticeDao.noticeList();
				
				model.addAttribute("number", number);
				model.addAttribute("noticeList", noticeList);
					
				int noticePageCount = noticeCount/pageSize + (noticeCount % pageSize == 0? 0 : 1);
					
				int noticeStartPage = (int)(currentPage/10)*10+1;
				int noticePageBlock = 10;
				int noticeEndPage = noticeStartPage + noticePageBlock -1;
				if (noticeEndPage > noticePageCount) {
					noticeEndPage = noticePageCount;
					}
				model.addAttribute("noticeStartPage",noticeStartPage);
				model.addAttribute("noticeEndPage", noticeEndPage);
				model.addAttribute("noticePageCount", noticePageCount);
			}else {
				model.addAttribute("count", noticeCount);
			}
			
			model.addAttribute("currentPage",currentPage);
			return "/CS_board/Notice/noticeMainList";
		}
		
		// 공지사항 게시글 내용 확인 : 메인 페이지
		@RequestMapping("noticeMainContent.do")	
		public String noticeMainContent(HttpServletRequest request, Model model) {
			int n_num = Integer.parseInt(request.getParameter("n_num"));
			List noticeContent = new ArrayList();
			noticeContent =	noticeDao.selectNotice(n_num);
			
			model.addAttribute("noticeContent", noticeContent);
			
			return "/CS_board/Notice/noticeMainContent";
		}
	
	
	// 관리자 페이지 //
		// 공지사항 목록 : 관리자 페이지
		@RequestMapping("noticeAdminList.do")
		public String noticeAdminList(Model model, HttpServletRequest request) {
			
			int pageSize = 10;
			String pageNum = request.getParameter("pageNum");	
			if (pageNum == null) {
				pageNum = "1";		
			}
				model.addAttribute("pageNum", pageNum);
			int currentPage = Integer.parseInt(pageNum); 
			
			int noticeCount = noticeDao.noticeCount();
			if (noticeCount > 0) {
				model.addAttribute("count", noticeCount);			 
				
				int number = 1;
				List noticeList = noticeDao.noticeList();
				
				model.addAttribute("number", number);
				model.addAttribute("noticeList", noticeList);
					
				int noticePageCount = noticeCount/pageSize + (noticeCount % pageSize == 0? 0 : 1);
					
				int noticeStartPage = (int)(currentPage/10)*10+1;
				int noticePageBlock = 10;
				int noticeEndPage = noticeStartPage + noticePageBlock -1;
				if (noticeEndPage > noticePageCount) {
					noticeEndPage = noticePageCount;
					}
				model.addAttribute("noticeStartPage",noticeStartPage);
				model.addAttribute("noticeEndPage", noticeEndPage);
				model.addAttribute("noticePageCount", noticePageCount);
			}else {
				model.addAttribute("count", noticeCount);
			}
			
			model.addAttribute("currentPage",currentPage);
			
//			System.out.println("==="+noticeList.size());
			
			return "/CS_board/Notice/noticeAdminList";
		}
	
		// 공지사항 게시글 내용 확인 : 관리자 페이지
		@RequestMapping("noticeAdminContent.do")	
		public String noticeAdminContent(HttpServletRequest request, Model model) {
			
			int n_num = Integer.parseInt(request.getParameter("n_num"));
			List noticeContent = new ArrayList();
			noticeContent =	noticeDao.selectNotice(n_num);
			
			model.addAttribute("noticeContent", noticeContent);
		
			return "/CS_board/Notice/noticeAdminContent";
		}
	
		// 공지사항 등록 폼
		@RequestMapping("noticeForm.do")
		public String noticeForm() {
			return "/CS_board/Notice/noticeForm";
		}
	
		// 공지사항 등록 처리
		@RequestMapping("noticePro.do")	
		public String noticePro(NoticeDTO notice) {

			noticeDao.inputNotice(notice);
			
			return "/CS_board/Notice/noticePro";
		}
	
		// 공지사항 수정 폼
		@RequestMapping("noticeModifyForm.do")	
		public String noticeModifyForm(HttpServletRequest request, Model model) {
			
			int n_num = Integer.parseInt(request.getParameter("n_num"));
			List noticeContent = new ArrayList();
			noticeContent =	noticeDao.selectNotice(n_num);
			
			model.addAttribute("noticeContent", noticeContent);
			
			return "/CS_board/Notice/noticeModifyForm";
		}
		
		//공지사항 수정 처리
		@RequestMapping("noticeModifyPro.do")	
		public String noticeModifyPro(HttpServletRequest request, Model model, NoticeDTO notice) {
			String num = request.getParameter("n_num");
			String selectN_num = noticeDao.selectNum(num);
			if (num.equals(selectN_num)) {
				int n_num = Integer.parseInt(num);
				notice.setN_num(n_num);
				noticeDao.modifyNotice(notice);
				model.addAttribute("n_num", n_num);
			}
			return "/CS_board/Notice/noticeModifyPro";
		}
		
		// 공지사항 삭제 폼
		@RequestMapping("noticeDeleteForm.do")	
		public String noticeDeleteForm(HttpServletRequest request, Model model) {

			String n_num = request.getParameter("n_num");
			System.out.println(n_num);
			model.addAttribute("n_num", n_num);

			return "/CS_board/Notice/noticeDeleteForm";
		}

	
		// 공지사항 삭제 처리
		@RequestMapping("noticeDeletePro.do")	
		public String noticeDeletePro(HttpServletRequest request) {
			String n_num = request.getParameter("n_num");
			String selectN_num = noticeDao.selectNum(n_num);

			if (n_num.equals(selectN_num)) {
				noticeDao.deleteNotice(n_num);
			}
			
			return "/CS_board/Notice/noticeDeletePro";
		}
}

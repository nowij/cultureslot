package model.CS_board;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import bean.CS_admin.StatisticsDTO;
import bean.CS_board.RcCommentDAO;
import bean.CS_board.RcCommentDTO;
import bean.CS_board.RequestContentDAO;
import bean.CS_board.RequestContentDTO;

@Controller
@RequestMapping("/RC/")
public class RequestContentBean {

	@Autowired
	private RequestContentDAO rcDao = null;
	
	//0611현민 추가
	@Autowired
	private RcCommentDAO rccommentdao = null;


	// 메인 페이지 // 
	// 자료요청  목록
	@RequestMapping("RC_MainList.do")	
	public String requestContentMainList(HttpServletRequest request, Model model) {
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		model.addAttribute("pageNum", pageNum);

		int currentPage = Integer.parseInt(pageNum);
		int requestCount = rcDao.requestCount();;
		if (requestCount > 0 ) {
			int number = 1;
			List RCList = rcDao.RCList();

			model.addAttribute("number", number);
			model.addAttribute("RCList", RCList);

			int rcPageCount = requestCount/pageSize + (requestCount % pageSize == 0 ? 0 : 1);
			int rcPageBlock = 10;
			int rcStartPage = (int)(currentPage/10)*10+1;
			int rcEndPage = rcPageCount + rcPageBlock - 1;
			if (rcEndPage > rcPageCount) {
				rcEndPage = rcPageCount;
			}

			model.addAttribute("rcPageCount",rcPageCount);
			model.addAttribute("rcStartPage",rcStartPage);
			model.addAttribute("rcEndPage",rcEndPage);
		}
		model.addAttribute("count", requestCount);
		model.addAttribute("currentPage", currentPage);

		return "/CS_board/CS_requestContent/requestContentMainList";
	}


	// 자료요청  게시글 내용 확인
	@RequestMapping("RC_MainContent.do")	
	public String requestContentMainContent(HttpServletRequest request, Model model, RequestContentDTO rc, HttpSession session, RcCommentDTO dto) {
		int rc_num = Integer.parseInt(request.getParameter("num"));
		int hit = rcDao.getHitCount(rc_num);
		rc.setRc_num(rc_num);
		rc.setHit(hit);
		
		rcDao.updateHitCount(rc);
		
		List RcContent = rcDao.selectContent(rc_num);
		model.addAttribute("rc_num", rc_num);
		model.addAttribute("RcContent", RcContent);
		for(int i = 0 ; i < RcContent.size() ; i++) {
			rc = (RequestContentDTO)RcContent.get(i);
			System.out.println(rc.getComment_state());
			model.addAttribute("state",rc.getComment_state());
		}
		
		//0612현민추가 - 자료요청 댓글 목록
		List list = rccommentdao.getRcComment(rc_num);
		String category = dto.getCategory();
		model.addAttribute("category", category);
		model.addAttribute("list", list);
		
		return "/CS_board/CS_requestContent/requestContentMainContent";
	}

	// 자료요청  등록 폼
	@RequestMapping("RC_Form.do")
	public String requestContentForm(Model model, HttpSession session) {
		String id = (String)session.getAttribute("memId");
		if (id == null) {
			id = "Guest";
		}
		model.addAttribute("memId", id);

		return "/CS_board/CS_requestContent/requestContentForm";
	}

	// 자료요청  등록 처리
	@RequestMapping("RC_Pro.do")	
	public String requestContentPro(HttpServletRequest request,RequestContentDTO rc) {
		int hit = 0;
		rc.setHit(hit);
		System.out.println(hit);
		rcDao.insertRequest(rc);

		return "/CS_board/CS_requestContent/requestContentPro";
	}

	// 자료요청 수정 폼
	@RequestMapping("RC_ModifyForm.do")	
	public String requestContentModifyForm(HttpServletRequest request, Model model) {
		int rc_num = Integer.parseInt(request.getParameter("num"));
		List RcContent = rcDao.selectContent(rc_num);
		model.addAttribute("RcContent", RcContent);

		return "/CS_board/CS_requestContent/requestContentModifyForm";
	}

	//자료요청  수정 처리
	@RequestMapping("RC_ModifyPro.do")	
	public String requestContentModifyPro(HttpServletRequest request, RequestContentDTO rc, Model model) {
		int rc_num = Integer.parseInt(request.getParameter("num"));
		rc.setRc_num(rc_num);

		int x = rcDao.modifyRcContent(rc);

		String msg = null;
		if (x == 1) {
			msg = "게시글 수정완료";
			System.out.println(msg);
		}
		model.addAttribute("rc_num", rc_num);
		model.addAttribute("msg", msg);

		return "/CS_board/CS_requestContent/requestContentModifyPro";
	}
	
	// 자료요청  삭제 폼
	@RequestMapping("RC_DeleteForm.do")	
	public String requestContentDeleteForm(HttpServletRequest request, Model model) {
		String rc_num = request.getParameter("num");
		model.addAttribute("rc_num", rc_num);

		return "/CS_board/CS_requestContent/requestContentDeleteForm";
	}

	// 자료요청  삭제 처리
	@RequestMapping("RC_DeletePro.do")	
	public String requestContentDeletePro(HttpServletRequest request, Model model) {
		int rc_num = Integer.parseInt(request.getParameter("num"));
		rcDao.deleteRcContent(rc_num);
		//0617현민추가
		rccommentdao.deleteAllrccomment(rc_num);

		return "/CS_board/CS_requestContent/requestContentDeletePro";
	}

	// 관리자 페이지 // 
	// 자료요청  목록
	@RequestMapping("RC_AdminList.do")	
	public String requestContentAdminList(HttpServletRequest request, Model model) {
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		model.addAttribute("pageNum", pageNum);

		int currentPage = Integer.parseInt(pageNum);
		int requestCount = rcDao.requestCount();;
		if (requestCount > 0 ) {
			int number = 1;
			List RCList = rcDao.RCList();

			model.addAttribute("number", number);
			model.addAttribute("RCList", RCList);
			
			
			int rcPageCount = requestCount/pageSize + (requestCount % pageSize == 0 ? 0 : 1);
			int rcPageBlock = 10;
			int rcStartPage = (int)(currentPage/10)*10+1;
			int rcEndPage = rcPageCount + rcPageBlock - 1;
			if (rcEndPage > rcPageCount) {
				rcEndPage = rcPageCount;
			}
			model.addAttribute("rcPageCount",rcPageCount);
			model.addAttribute("rcStartPage",rcStartPage);
			model.addAttribute("rcEndPage",rcEndPage);
		}
		model.addAttribute("count", requestCount);
		model.addAttribute("currentPage", currentPage);

		return "/CS_board/CS_requestContent/requestContentAdminList";
	}

	// 관리자 : 자료요청  게시글 내용 확인
	@RequestMapping("RC_AdminContent.do")	
	public String requestContentAdminContent(HttpServletRequest request, Model model, RcCommentDTO dto) {
		int rc_num = Integer.parseInt(request.getParameter("num"));
		System.out.println("콘텐츠넘"+rc_num);
		List RcContent = rcDao.selectContent(rc_num);
		model.addAttribute("RcContent", RcContent);
		

		//0612현민추가 - 자료요청 댓글 목록
		List list = rccommentdao.getRcComment(rc_num);
		String category = dto.getCategory();
		model.addAttribute("category", category);
		model.addAttribute("list", list);

		return "/CS_board/CS_requestContent/requestContentAdminContent";
	}
	
	//0612현민추가 - 자료요청 댓글 작성
	@RequestMapping("rccommentPro.do")
	public String rccommentPro(HttpServletRequest request, Model model, RcCommentDTO dto) {
		String rc_writer= request.getParameter("rc_writer"); 
		String category = request.getParameter("category"); 
		int rc_num = Integer.parseInt(request.getParameter("rc_num"));
		dto.setRc_num(rc_num);
		dto.setCategory(category);
		dto.setRc_writer(rc_writer);

		rccommentdao.insertRcComment(dto);
		rcDao.updateState(rc_num);
		
		return "/CS_board/CS_requestContent/rccommentPro";
	}
		
	//0612현민추가 - 자료요청 댓글 삭제
	@RequestMapping("rccommentdelPro.do")
	public String rccommentdelPro(HttpServletRequest request, Model model, RcCommentDTO dto) {
		int comment_num =Integer.parseInt(request.getParameter("comment_num"));
		int rc_num =Integer.parseInt(request.getParameter("num"));
		
		dto.setRc_num(rc_num);
		dto.setComment_num(comment_num);
		rccommentdao.deleteRcComment(dto);
		rcDao.downState(rc_num);
		return "/CS_board/CS_requestContent/rccommentdelPro";
	}


}

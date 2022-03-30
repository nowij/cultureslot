package model.CS_member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bean.CS_board.CommentDAO;
import bean.CS_board.CommentDTO;
import bean.CS_board.RcCommentDAO;
import bean.CS_board.RequestContentDAO;
import bean.CS_board.RequestContentDTO;
import bean.CS_member.MemberDAO;
import bean.CS_member.MemberDTO;
import bean.CS_admin.AdminContentDAO;
import bean.CS_admin.MailServiceDAO;

@Controller
@RequestMapping("/member/")
public class MemberBean {
	
	@Autowired 
	private MemberDAO dao = null;
	
	@Autowired
	private RcCommentDAO rccommentdao = null;
	
	@Autowired
	private CommentDAO commentdao = null;
	
	@Autowired
	private RequestContentDAO rcDao=null;
	
	@Autowired
	private AdminContentDAO adDao = null;
	
	@Autowired
	private MailServiceDAO mailsender = null;
	
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "/CS_Member/loginForm";
	}
	
	@RequestMapping("loginPro.do")
	public String loginPro(HttpServletRequest request,MemberDTO dto, HttpSession session, Model model) {
		int check=dao.loginCheck(dto);
		
		if(check==1){
			session.setAttribute("memId" , dto.getId());
			model.addAttribute("check",check);
			model.addAttribute("memId", dto.getId());
		}
		// check가 0 혹은 2인 경우를 반환 (수정-0622)
		model.addAttribute("check", check);
		return "/CS_Member/loginPro";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/CS_Member/logout";
	}

	@RequestMapping("joinForm.do")
	public String joinForm() {
		return"/CS_Member/joinForm";
	}

	@RequestMapping("joinPro.do")
	public String joinPro(MemberDTO dto,  HttpServletRequest request) {
		dao.join(dto);
		
		String ip = request.getServerName(); //url 스키마를 가져옴(localhost인지 아이피로 접속했는지)
		mailsender.sendUserKey(dto.getEmail(), dto.getId(), ip);
		
		return "/CS_Member/joinPro";
	}

	@RequestMapping("mypage.do")
	public String mypage(HttpSession session , Model model) {
		String id = (String)session.getAttribute("memId");

		List list = dao.myInfo(id);

		model.addAttribute("info",list);
		return"/CS_mypage/mypage"; 
	}

	@RequestMapping("modify.do")
	public String modify(HttpSession session , Model model) {
		String id = (String)session.getAttribute("memId");

		List list = dao.myInfo(id);
		model.addAttribute("info",list);
		return"/CS_mypage/modifyForm";
	}

	@RequestMapping("modifyPro.do")
	public String modifyPro(HttpSession session, MemberDTO dto) {
		String id = (String)session.getAttribute("memId");
		dto.setId(id);
		//System.out.println(dto.getId());
		dao.modify(dto);
		return"/CS_mypage/modifyPro";
	}

	@RequestMapping("deleteForm.do")
	public String deleteForm() {
		return"/CS_mypage/deleteForm";
	}
	
	@RequestMapping("deletePro.do")
		public String deletePro(String pw,HttpSession session, MemberDTO dto) {
			String id = (String)session.getAttribute("memId");
			dto.setId(id);
			dto.setPw(pw);
			String path;
			int check = dao.loginCheck(dto);
			if(check==1) {
				dao.delete(dto);
				adDao.deleteMemberScrape(id);
				session.invalidate();
				path ="/CS_mypage/deletePro"; 
			}else {
				path="/CS_mypage/deleteForm";
			}
			
			
			return path;
	}
	
	@RequestMapping("confirmId.do")
	public String confirmId(String id, Model model) {
		int check= dao.idcheck(id);
		model.addAttribute("check",check);
		model.addAttribute("memid",id);
		return"/CS_Member/confirmId"; 	
	}
	

	@RequestMapping("myCommentList.do")
	public String myCommentList(Model model, HttpSession session, HttpServletRequest request, CommentDTO dto) {
		String id = (String)session.getAttribute("memId");
		String pageNum = request.getParameter("pagenum");
		if(pageNum==null) {
			pageNum="1";
		}
		int count = commentdao.countMyComment(id);
		int pageSize = 10;
		if(count>0) {
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1)*pageSize+1;
			int endRow = currentPage*pageSize;
			
			dto.setId(id);
			dto.setStart(startRow);
			dto.setEnd(endRow);
			
			List commentList = commentdao.getMyComment(dto);
			
			int pageCount = count/pageSize+(count%pageSize==0?0:1);
			int pageBlock = 10;
			int startPage = (int)(currentPage/10)*10+1;
			int endPage = startPage+pageBlock-1;
			if(endPage>pageCount) endPage = pageCount;
			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("commentList", commentList);
		}
		
		model.addAttribute("count",count);
		
		return "/CS_mypage/myCommentList";
	}
	
	
	@RequestMapping("myRC_list.do")
	public String myRC_list(Model model, HttpSession session) {
		String id = (String)session.getAttribute("memId");
		int number = 1;
		int myRC_Count = rcDao.myRcCount(id);
		List list=dao.myRC_list(id);
		
		model.addAttribute("number",number);
		model.addAttribute("myRC_Count",myRC_Count);
		model.addAttribute("mylist",list);
		return "/CS_mypage/myRC_list";
	}
		
	@RequestMapping("myRC_listmodifyForm.do")
	public String myRC_listmodify(Model model,String num,HttpServletRequest request) {
		int rc_num = Integer.parseInt(request.getParameter("num"));	
		List list = dao.getMyRc(rc_num);

		model.addAttribute("RCContent",list);
		return"/CS_mypage/myRC_listmodifyForm";
	}
		
	@RequestMapping("myRC_listmodifyPro.do")
	public String myRC_listmodifyPro(RequestContentDTO rc, Model model, HttpServletRequest request) {
		int rc_num = Integer.parseInt(request.getParameter("num"));
		rc.setRc_num(rc_num);
		int x = rcDao.modifyRcContent(rc);
			
		String msg = null;
		if(x == 1) {
				msg = "게시글 수정 완료";
				System.out.println(msg);
		}
		
		model.addAttribute("msg",msg);
		return"/CS_mypage/myRC_listmodifyPro";
	}
		
	@RequestMapping("myRc_listdeleteForm.do")
	public String myRC_listdeleteForm(HttpServletRequest request, Model model) {
		int rc_num = Integer.parseInt(request.getParameter("num")); 
		model.addAttribute("rc_num",rc_num);
		return"/CS_mypage/myRC_listdeleteForm";
	}
		
	@RequestMapping("myRC_listdeletePro.do")
	public String myRC_listdeletePro(HttpServletRequest request,HttpSession session, RequestContentDTO dto) {
		String id = (String)session.getAttribute("memId");
		int rc_num = Integer.parseInt(request.getParameter("num")); 
		dto.setId(id);
		dto.setRc_num(rc_num);
		dao.myRCdelete(dto);
		return"/CS_mypage/myRC_listdeletePro";
	}
	
	
	@RequestMapping("confirmEmail.do")
	public String confirmKey(HttpServletRequest request, Model model){
		String id = (String)request.getParameter("id");
		String key = (String)request.getParameter("key");
		System.out.println(id+" / "+key);
		int result = mailsender.confirmKey(id, key);
		model.addAttribute("result", result);
		return "/CS_Member/confirmEmail";
	}
}

package model.CS_admin;

import java.io.File;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import bean.CS_admin.AdminContentDAO;
import bean.CS_admin.StatisticsDTO;
import bean.CS_board.CommentDAO;
import bean.CS_board.CommentDTO;
import bean.CS_main.ContentDTO;
import bean.CS_main.SearchDTO;
import bean.CS_member.MemberDAO;
import bean.CS_member.MemberDTO;
import bean.CS_member.ScrapeDTO;

@Controller
@RequestMapping("/CS_admin/")
public class AdminContentBean {
	@Autowired
	AdminContentDAO dao = null;
	@Autowired
	CommentDAO commentdao = null;
	
	//������ ������
	@RequestMapping("admin_main.do")
	public String admin_main(StatisticsDTO dto, Model model) {
	
		
		return "/CS_admin/admin_main";
	}
	
	//������ ������ ��� 0705 ���� ����
	@RequestMapping("contentList.do")
	public String contentList(Model model, HttpServletRequest request, ContentDTO dto) {
		//0628 ���� ����
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
	    if (pageNum == null) {
	        pageNum = "1";
	    }
	    
	    String country = request.getParameter("country");
	    if(country==null) {
	    	country="����";
	    }
	    String year = request.getParameter("year");
	    if(year==null) {
	    	year="2020";
	    }
	    
	    //0706 ���� ����
	    String category = request.getParameter("category");
	    if(category==null) {
	    	category="����";
	    }
	    dto.setCountry_category(country);
    	dto.setYear(year);
    	model.addAttribute("country", country);
    	model.addAttribute("year", year);
    	
	    int musicCount = 0, movieCount =0, dramaCount = 0, aniCount=0;

	    if(category.equals("����")) {
	    	model.addAttribute("category", category);
		    List musicList = null;
		    musicCount = dao.musicContentNum(dto); //count�� �� ���� ����
		    if (musicCount > 0) {
		    	int currentPage = Integer.parseInt(pageNum); //string���� pageNum�� int������ ��ȯ�� currentPage�� �ִ´�.
			    int startRow = (currentPage - 1) * pageSize + 1; //ù ��° �� (�Խ����� �������� �� ��° ������ ����
			    int endRow = currentPage * pageSize; //������ ��
			    
		    	dto.setStart(startRow);
		    	dto.setEnd(endRow);
		    	
		    	musicList = dao.musicList(dto); //n�������� �ִ� ���� articleList�� ����
		    
		    	int pageCount = musicCount / pageSize + ( musicCount % pageSize == 0 ? 0 : 1);
		    	int startPage = (int)(currentPage/10)*10+1;
		    	int pageBlock=10;
		    	int endPage = startPage + pageBlock-1;
		    	if (endPage > pageCount) endPage = pageCount;
		    	
		    	model.addAttribute("musicPageCount", pageCount);
		    	model.addAttribute("musicStartPage", startPage);
		    	model.addAttribute("musicEndPage", endPage);
		    }
	
		    model.addAttribute("musicCount", musicCount);
		    model.addAttribute("musicList", musicList);
	    } else if(category.equals("��ȭ")) {
	    	model.addAttribute("category", category);
		    List movieList = null;
		    movieCount = dao.movieContentNum(dto);
		    if(movieCount>0) {
		    	int currentPage = Integer.parseInt(pageNum); //string���� pageNum�� int������ ��ȯ�� currentPage�� �ִ´�.
			    int startRow = (currentPage - 1) * pageSize + 1; //ù ��° �� (�Խ����� �������� �� ��° ������ ����
			    int endRow = currentPage * pageSize; //������ ��
			    
		    	dto.setStart(startRow);
		    	dto.setEnd(endRow);
		    	movieList = dao.movieList(dto);
		    	
		    	int pageCount = movieCount / pageSize + (movieCount % pageSize==0?0:1);
		    	int startPage = (int)(currentPage/10)*10+1;
		    	int pageBlock=10;
		    	int endPage = startPage + pageBlock-1;
		    	
		    	if (endPage > pageCount) endPage = pageCount;
		    	
		    	model.addAttribute("moviePageCount", pageCount);
		    	model.addAttribute("movieStartPage", startPage);
		    	model.addAttribute("movieEndPage", endPage);
		    }
		    model.addAttribute("movieList", movieList);
		    model.addAttribute("movieCount", movieCount);
	    } else if(category.equals("���")) {
	    	model.addAttribute("category", category);
			List dramaList = null;
			dramaCount = dao.dramaContentNum(dto);
			if(dramaCount>0) {
				int currentPage = Integer.parseInt(pageNum); //string���� pageNum�� int������ ��ȯ�� currentPage�� �ִ´�.
			    int startRow = (currentPage - 1) * pageSize + 1; //ù ��° �� (�Խ����� �������� �� ��° ������ ����
			    int endRow = currentPage * pageSize; //������ ��
			    
				dto.setStart(startRow);
				dto.setEnd(endRow);
				dramaList = dao.dramaList(dto);
				
				int pageCount = movieCount / pageSize + (movieCount % pageSize==0?0:1);
		    	int startPage = (int)(currentPage/10)*10+1;
		    	int pageBlock=10;
		    	int endPage = startPage + pageBlock-1;
		    	
		    	if (endPage > pageCount) endPage = pageCount;

		    	model.addAttribute("dramaPageCount", pageCount);
		    	model.addAttribute("dramaStartPage", startPage);
		    	model.addAttribute("dramaEndPage", endPage);
				
			}
			model.addAttribute("dramaList", dramaList);
			model.addAttribute("drameCount", dramaCount);
	    } else if(category.equals("�ִϸ��̼�")) {
	    	model.addAttribute("category", category);
	    	System.out.println("�ִ� ");
			List animationList = null;
			aniCount = dao.aniContentNum(dto);
			System.out.println("�ִ� : "+aniCount);
			if(aniCount>0) {						
				int currentPage = Integer.parseInt(pageNum); //string���� pageNum�� int������ ��ȯ�� currentPage�� �ִ´�.
				int startRow = (currentPage - 1) * pageSize + 1; //ù ��° �� (�Խ����� �������� �� ��° ������ ����
				int endRow = currentPage * pageSize; //������ ��
				
				dto.setStart(startRow);
				dto.setEnd(endRow);
				animationList = dao.aniList(dto);
				
				int pageCount = movieCount / pageSize + (movieCount % pageSize==0?0:1);
		    	int startPage = (int)(currentPage/10)*10+1;
		    	int pageBlock=10;
		    	int endPage = startPage + pageBlock-1;
		    	
		    	if (endPage > pageCount) endPage = pageCount;
		    	
		    	model.addAttribute("aniPageCount", pageCount);
		    	model.addAttribute("aniStartPage", startPage);
		    	model.addAttribute("aniEndPage", endPage);
		    	
			}
		    model.addAttribute("aniCount", aniCount);
			model.addAttribute("aniList", animationList);
	    }
	    
		return "/CS_admin/contentList";
	}

	//������ ������ ���
	@RequestMapping("contentForm.do")
	public String contentForm(Model model, HttpServletRequest request) {
		String cate = (String)request.getParameter("cate");
		
		if(cate.equals("music")) { cate = "����"; }
		else if(cate.equals("movie")){ cate="��ȭ";}
		else if(cate.equals("drama")){ cate="���";}
		else if(cate.equals("animation")){ cate="�ִϸ��̼�";}
		
		model.addAttribute("category", cate);
		
		return "/CS_admin/contentForm";
	}
	
	@RequestMapping("contentPro.do")
	public String contentPro(ContentDTO dto, Model model, MultipartRequest multiRequest, HttpServletRequest request) {
		//0630 ���� ����
		MultipartFile mf = multiRequest.getFile("titleimage");
		String orgName = mf.getOriginalFilename();
		String ext = orgName.substring(orgName.lastIndexOf(".")); //Ȯ���� ������
		//���� ��� ����
		String path = request.getSession().getServletContext().getRealPath("/image");
		String sysName = "\\"+dto.getCreator() + dto.getTitle()+"_"+dto.getCategory()+ext;
		
		//src ��� ����
		dto.setTitle_image("/CULTURESLOT/image/"+dto.getCreator() + dto.getTitle()+"_"+dto.getCategory()+ext);
		System.out.println(dto.getTitle_image());
		
		//���� �̹����� ����� �ּ�
		dto.setImg_path(path+sysName);
		System.out.println("��� ���� ��� : "+dto.getImg_path());
		File fileCopy = new File(path+sysName);
		try {
			mf.transferTo(fileCopy);
		}catch(Exception e) {
			e.printStackTrace();
		}
		String category = dto.getCategory();
		System.out.println(category);
		
		if(category.equals("����")) { 	dao.musicInsert(dto);}
		else if(category.equals("��ȭ")) { 	dao.movieInsert(dto);}
		else if(category.equals("���")) { 	dao.dramaInsert(dto);}
		else if(category.equals("�ִϸ��̼�")) { 	dao.aniInsert(dto);}
		
		return "/CS_admin/contentPro";
	}
	
	//������ ������ ����
	@RequestMapping("contentUpdate.do")
	public String contentUpdate(HttpServletRequest request, ContentDTO dto, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		String cate = (String)request.getParameter("cate");
		List list = null;
	
		if(cate.equals("����")) { list = dao.musicSelect(num);}
		else if(cate.equals("��ȭ")) { list = dao.movieSelect(num);} 
		else if(cate.equals("���")) { list = dao.dramaSelect(num);} 
		else if(cate.equals("�ִϸ��̼�")) { list = dao.aniSelect(num);}
		
		model.addAttribute("listSelect", list);
		
		return "/CS_admin/contentUpdate";
	}
	
	@RequestMapping("contentUpdatePro.do")
	public String contentUpdatePro(ContentDTO dto, MultipartRequest multiRequest, HttpServletRequest request) {
		try {			
			MultipartFile mf = multiRequest.getFile("titleimage");
			String orgName = mf.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf(".")); //Ȯ���� ������
			//���� ��� ����
			String path = request.getSession().getServletContext().getRealPath("/image");
			String sysName = "\\"+dto.getCreator() + dto.getTitle()+"_"+dto.getCategory()+ext;
			
			//src ��� ����
			dto.setTitle_image("/CULTURESLOT/image/"+dto.getCreator() + dto.getTitle()+"_"+dto.getCategory()+ext);
			System.out.println(dto.getTitle_image());
			
			//���� �̹����� ����� �ּ�
			dto.setImg_path(path+sysName);
			System.out.println("���� ���� ��� : "+dto.getImg_path());
			File fileCopy = new File(path+sysName);
			try {
				mf.transferTo(fileCopy);
			}catch(Exception e) {
				e.printStackTrace();
			}
				
			String cate = dto.getCategory();
			if(cate.equals("����")) { 
				dao.musicPicUpdate(dto);
			}else if(cate.equals("��ȭ")) { 
				dao.moviePicUpdate(dto);
			}else if(cate.equals("���")) { 
				dao.dramaPicUpdate(dto);
			}else if(cate.equals("�ִϸ��̼�")) { 
				dao.aniPicUpdate(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			String cate = dto.getCategory();
			if(cate.equals("����")) { 
				dao.musicUpdate(dto);
			}else if(cate.equals("��ȭ")) { 
				dao.movieUpdate(dto);
			}else if(cate.equals("���")) { 
				dao.dramaUpdate(dto);
			}else if(cate.equals("�ִϸ��̼�")) { 
				dao.aniUpdate(dto);
			}
			
		}
		
		return "/CS_admin/contentUpdatePro";
	}
	
	//������ ������ ����
	@RequestMapping("contentDelete.do")
	public String contentDelete(HttpServletRequest request, Model model) {
		int num = Integer.parseInt(request.getParameter("num"));
		String cate = (String)request.getParameter("cate");
		List list = null;
		
		if(cate.equals("����")) { list = dao.musicSelect(num);}
		else if(cate.equals("��ȭ")) { list = dao.movieSelect(num);} 
		else if(cate.equals("���")) { list = dao.dramaSelect(num);} 
		else if(cate.equals("�ִϸ��̼�")) { list = dao.aniSelect(num);}
		
		model.addAttribute("selectList", list);
		model.addAttribute("num", num);
		model.addAttribute("cate", cate);
		
		return "/CS_admin/contentDelete";
	}
	@RequestMapping("contentDeletePro.do")
	public String contentDeletePro(ContentDTO dto, HttpServletRequest request, ScrapeDTO sdto) {
		int num = Integer.parseInt(request.getParameter("num"));
		String cate = (String)request.getParameter("category");
		sdto.setCategory(cate);
		sdto.setContent_num(num);
		//0630 ���� ����		
		File deleteFile = null;
		if(cate.equals("����")) {
			try {
				deleteFile = new File(dao.deleteMusicFile(num));
				deleteFile.delete();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dao.musicDelete(num);
			}
		}else if(cate.equals("��ȭ")) {
			try {
				deleteFile = new File(dao.deleteMovieFile(num));
				deleteFile.delete();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dao.movieDelete(num);
			}
		}else if(cate.equals("���")) {
			try {
				deleteFile = new File(dao.deleteDramaFile(num));
				deleteFile.delete();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dao.dramaDelete(num);
			}
		}else if(cate.equals("�ִϸ��̼�")) {
			try {
				deleteFile = new File(dao.deleteAniFile(num));
				deleteFile.delete();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				dao.aniDelete(num);
			}
		}
		dao.allDeleteScrape(sdto);
		//0617 �����߰�
		commentdao.deleteAllcomment(num); 
		
		
		return "/CS_admin/contentDeletePro";
	}

	//��� ���
	@RequestMapping("commentList.do")
	public String commentList(Model model, HttpServletRequest request, CommentDTO dto) {
		String pageNum = request.getParameter("pagenum");
		if(pageNum==null) {
			pageNum = "1";
		}
		int pageSize = 10;
		int count = dao.commentCount();
		if(count>0) {
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1)*pageSize+1;
			int endRow = currentPage*pageSize;
			
			dto.setStart(startRow);
			dto.setEnd(endRow);
			List list = dao.commentList(dto);
		
			int pageCount = count/pageSize + (count%pageSize==0 ? 0:1);
			int pageBlock  = 10;
			int startPage = (int)(currentPage/10)*10+1;
			int endPage = startPage+pageBlock-1;
			if(endPage>pageCount) endPage = pageCount;
			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			model.addAttribute("commentList", list);
			model.addAttribute("count", count);
		}
		return "/CS_admin/commentList";
	}
	
	//��� ����
	@RequestMapping("commentDelete.do")
	public String commentDelete(String num) {
		int cnum = Integer.parseInt(num);
		dao.commentDelete(cnum);
		return "/CS_admin/commentDelete";
	}
	
	//ȸ�� ���
	@RequestMapping("memberList.do")
	public String memberList(Model model, HttpServletRequest request, MemberDTO dto) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum = "1";
		}
				
		int pageSize = 10;
		int count = dao.memberCount();
		if(count>0) {
			int currentPage = Integer.parseInt(pageNum);
			int startRow = (currentPage-1)*pageSize+1;
			int endRow = currentPage*pageSize;
			
			dto.setStart(startRow);
			dto.setEnd(endRow);
			
			List list = dao.getMemeber(dto);
			
			int pageCount = count / pageSize + (count%pageSize ==0?0:1);
			int startPage = (int)(currentPage/10)*10+1;
			int pageBlock = 10;
			int endPage = startPage+pageBlock-1;
			if(endPage > pageCount) endPage = pageCount;
			
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			
			model.addAttribute("list", list);
			model.addAttribute("count", count);			
		}
		
		return "/CS_admin/memberList";
	}
	@RequestMapping("delMemberPro.do")
	public String delMemberPro(String id, HttpSession session) {
		dao.deleteMember(id);
		dao.deleteMemberScrape(id);
		return "/CS_admin/delMemberPro";   
	}
}

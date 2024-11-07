package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.ReplyBoardVO;

import controller.RequestMapping;


import com.sist.dao.*;
import com.sist.vo.*;

public class AdminModel {
	private String[] types={"","일반공지","Books공지","Music공지","잔체공지"};
	
	//-----------------------------------------admin연결-----------------------------------------
	@RequestMapping("adminpage/adminpage_main.do")
	public String adminpage_main(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("admin_jsp", "../adminpage/adminpage_home.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		
		return "../main/main.jsp";
	}	
	
	//----------------------------------------- 회원관리 -----------------------------------------
	//회원 리스트
	@RequestMapping("adminpage/member_list.do")
	public String member_list(HttpServletRequest request, HttpServletResponse response)
	{
		String page = request.getParameter("page");
		if(page==null)
			page="1";
		
		int curpage = Integer.parseInt(page);
		int rowSize = 15;
		int start = (rowSize * curpage) - (rowSize - 1) ;
		int end = rowSize * curpage;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<MemberVO> list = AdminDAO.memberListData(map);
		int count = AdminDAO.memberRowCount();
		int totalpage = (int)(Math.ceil(count/15.0));
		count = count - ((curpage * rowSize) - rowSize);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("count", count);
		request.setAttribute("memberList", list	);
		
		request.setAttribute("admin_jsp", "../adminpage/adminpage_home.jsp");
		request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		
		return "../main/main.jsp";
	}
	
	// 회원 상세정보
	
	//-----------------------------------------고객센터--------------------------------------
	// 공지 목록
	@RequestMapping("adminpage/noticeboard_list.do")
	public String noticeboard_list(HttpServletRequest request, HttpServletResponse response)
	{
		
		return "../main/main.jsp";
	}
	/////////////////////////////////////////// 묻고답하기 게시판 목록//////////////////////////////////////////////
	
	@RequestMapping("adminpage/reply_list.do")
	   public String reply_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   
		   int curpage=Integer.parseInt(page);
		   
		   Map map=new HashMap();
		   int rowSize=15;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   map.put("start", start);
		   map.put("end", end);
		   
		   List<ReplyBoardVO> list=ReplyBoardDAO.adminReplyBoardListData(map);
		   int count=ReplyBoardDAO.replyBoardRowCount();
		   int totalpage=(int)(Math.ceil(count/15.0));
		   
		   request.setAttribute("rbList", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("count", count);
		   
		   request.setAttribute("admin_jsp", "../adminpage/adminpage_reply_list.jsp");
		   request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		   
		   return "../main/main.jsp";
	   }
	   // 묻고답하기 insert(admin)
	   @RequestMapping("adminpage/reply_insert.do")
	   public String reply_insert(HttpServletRequest request,HttpServletResponse response)
	   {
		   String no=request.getParameter("no");
		   request.setAttribute("no", no);
		   request.setAttribute("admin_jsp", "../adminpage/adminpage_reply_insert.jsp");
		   request.setAttribute("main_jsp", "../adminpage/adminpage_main.jsp");
		   
		   return "../main/main.jsp";
	   }
	   // 묻고답하기 insert_ok
	   @RequestMapping("adminpage/reply_insert_ok.do")
	   public String reply_insert_ok(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String no=request.getParameter("no");
		   String subject=request.getParameter("subject");
		   String content=request.getParameter("content");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   String name=(String)session.getAttribute("name");
		   ReplyBoardVO rvo=ReplyBoardDAO.adminReplyInfoData(Integer.parseInt(no));
		   
		   ReplyBoardVO vo=new ReplyBoardVO();
		   vo.setId(id);
		   vo.setSubject(subject);
		   vo.setContent(content);
		   vo.setName(name);
		   vo.setGroup_id(rvo.getGroup_id());
		   
		   ReplyBoardDAO.adminReplyBoardInsert(Integer.parseInt(no), vo);
		   
		   return "redirect:../adminpage/reply_list.do";
	   }
	   // 묻고답하기 delete
	   @RequestMapping("adminpage/reply_delete.do")
	   public String reply_delete(HttpServletRequest request,HttpServletResponse response)
	   {
		   String no=request.getParameter("no");
		   String group_id=request.getParameter("group_id");
		   //DB연동 
		   //ReplyBoardDAO.adminReplyDelete(Integer.parseInt(no),Integer.parseInt(group_id));
		   return "redirect:../adminpage/reply_list.do";
	   }
	   
	  
}

package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.NoticeDAO;
import com.sist.dao.ReplyBoardDAO;
import com.sist.vo.NoticeVO;
import com.sist.vo.ReplyBoardVO;

import oracle.net.aso.l;

public class AdminModel {
	private String[] types= {"", "일반공지", "이벤트공지", "맛집공지", "여행공지"};
	@RequestMapping("admin/adminPageMain.do")
	public String adminPageMain(HttpServletRequest request, HttpServletResponse response) {
		CommonsModel.footerPrint(request);
		request.setAttribute("admin_jsp", "../admin/adminPageHome.jsp");
		request.setAttribute("main_jsp", "../admin/adminPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/memberList.do")
	public String memberList(HttpServletRequest request, HttpServletResponse response) {
		CommonsModel.footerPrint(request);
		request.setAttribute("admin_jsp", "../admin/memberList.jsp");
		request.setAttribute("main_jsp", "../admin/adminPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/noticeList.do")
	public String noticeList(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		int rowSize=15;
		int start=(curPage-1)*rowSize+1;
		int end=start+rowSize-1;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<NoticeVO> list=NoticeDAO.noticeListData(map);
		for(NoticeVO vo:list) {
			vo.setNoticeType(types[vo.getType()]);
		}
		System.out.println(list.size());
		int count=NoticeDAO.noticeRowCount();
		int totalPage=(int)(Math.ceil(count/15.0));
		count=count-((curPage-1)*rowSize);
		CommonsModel.footerPrint(request);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("count", count);
		request.setAttribute("nList", list);
		request.setAttribute("admin_jsp", "../notice/noticeList.jsp");
		request.setAttribute("main_jsp", "../admin/adminPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/noticeInsert.do")
	public String noticeInsert(HttpServletRequest request, HttpServletResponse response) {
		CommonsModel.footerPrint(request);
		request.setAttribute("admin_jsp", "../notice/noticeInsert.jsp");
		request.setAttribute("main_jsp", "../admin/adminPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/noticeInsertOk.do")
	public String noticeInsertOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		NoticeVO vo=new NoticeVO();
		vo.setType(Integer.parseInt(type));
		vo.setSubject(subject);
		vo.setContent(content);
		NoticeDAO.noticeInsert(vo);
		return "redirect:../admin/noticeList.do";
	}
	@RequestMapping("admin/noticeUpdate.do")
	public String noticeUpdate(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		NoticeVO vo=NoticeDAO.noticeUpdateData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("admin_jsp", "../notice/noticeUpdate.jsp");
		request.setAttribute("main_jsp", "../admin/adminPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/noticeUpdateOk.do")
	public String noticeUpdateOK(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String type=request.getParameter("type");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String no= request.getParameter("no");
		NoticeVO vo=new NoticeVO();
		System.out.println(type);
		vo.setType(Integer.parseInt(type));
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setNo(Integer.parseInt(no));
		NoticeDAO.noticeUpdate(vo);
		return "redirect:../admin/noticeList.do";
	}
	@RequestMapping("admin/noticeDelete.do")
	public String noticeDelete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		NoticeDAO.noticeDelete(Integer.parseInt(no));
		return "redirect:../admin/noticeList.do";
	}
	@RequestMapping("admin/replyBoardList.do")
	public String replyBoardList(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		int rowSize=15;
		int start=(curPage-1)*rowSize+1;
		int end=start+rowSize-1;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<ReplyBoardVO> list=ReplyBoardDAO.adminReplyBoardListData(map);
		int count=ReplyBoardDAO.replyBoardRowCount();
		int totalPage=(int)(Math.ceil(count/15.0));
		count=count-(curPage-1)*rowSize;		
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("count", count);
		request.setAttribute("rbList", list);
		
		request.setAttribute("admin_jsp", "../admin/replyBoardList.jsp");
		request.setAttribute("main_jsp", "../admin/adminPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/replyBoardInsert.do")
	public String replyBoardInsert(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		
		request.setAttribute("no", no);
		request.setAttribute("admin_jsp", "../admin/replyBoardInsert.jsp");
		request.setAttribute("main_jsp", "../admin/adminPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/replyBoardInsertOk.do")
	public String replyBoardInsertOk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String no=request.getParameter("no");
		ReplyBoardVO rvo=ReplyBoardDAO.adminReplyInfoData(Integer.parseInt(no));
		ReplyBoardVO vo=new ReplyBoardVO();
		vo.setGroup_id(rvo.getGroup_id());
		vo.setId(id);
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setNo(Integer.parseInt(no));
		ReplyBoardDAO.adminReplyBoardInsert(Integer.parseInt(no), vo);
		return "redirect:../admin/replyBoardList.do";
	}
	@RequestMapping("admin/replyBoardDelete.do")
	public String adminReplyBoardDelete(HttpServletRequest request, HttpServletResponse response) {
		String no=request.getParameter("no");
		ReplyBoardDAO.adminReplyDelete(Integer.parseInt(no));
		return "redirect:../admin/replyBoardList.do";
	}
}

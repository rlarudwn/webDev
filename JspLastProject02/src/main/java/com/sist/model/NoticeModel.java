package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.NoticeDAO;
import com.sist.vo.NoticeVO;

public class NoticeModel {
	private String[] types= {"", "일반공지", "이벤트공지", "맛집공지", "여행공지"};
	@RequestMapping("notice/list.do")
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
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("count", count);
		request.setAttribute("nList", list);
		request.setAttribute("main_jsp", "../notice/list.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	@RequestMapping("notice/detail.do")
	public String noticeDetail(HttpServletRequest request, HttpServletResponse response) {
		String no= request.getParameter("no");
		NoticeVO vo=NoticeDAO.noticeDetailData(Integer.parseInt(no));
		vo.setNoticeType(types[vo.getType()]);
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../notice/detail.jsp");
		return "../main/main.jsp";
	}
}

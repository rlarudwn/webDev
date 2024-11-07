package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.MusicDAO;
import com.sist.vo.MusicVO;

public class MusicModel {
	@RequestMapping("main/main.do")
	public String mainPage(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int start = (curPage - 1) * 20 + 1;
		int end = start + 20 - 1;
		int totalPage = MusicDAO.musicTotalPage();
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<MusicVO> list = MusicDAO.musicListData(map);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../music/list.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("main/detail.do")
	public String detailPage(HttpServletRequest request, HttpServletResponse response) {
		String mno = request.getParameter("mno");
		MusicVO vo=MusicDAO.musicDetailData(Integer.parseInt(mno));
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../music/detail.jsp");
		return "../main/main.jsp";
	}
}

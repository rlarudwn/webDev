package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.MusicDAO;
import com.sist.dao.MusicVO;

public class MusicModel {
	@RequestMapping("music/list.do")
	public String musicList(HttpServletRequest request, HttpServletResponse response) {
		List<MusicVO> list=MusicDAO.musicListData();
		request.setAttribute("list", list);
		return "list.jsp";
	}
}

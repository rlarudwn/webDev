package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.LikeDAO;
import com.sist.dao.MusicDAO;

import controller.RequestMapping;

public class LikeModel {
	private String[] tables = { "", "music", "album", "artist" , "movie", "book"};
	private String[] noName = { "", "mno", "alno", "ano", "mno", "bno"};
	@RequestMapping("like/likeOn.do")
	public void musicLikeOn(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String tno = request.getParameter("tno");
		String type = request.getParameter("type");
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("tno", Integer.parseInt(tno));
		map.put("type", Integer.parseInt(type));
		map.put("id", id);
		map.put("table", tables[Integer.parseInt(type)]);
		map.put("noName", noName[Integer.parseInt(type)]);
		int result = LikeDAO.likeOn(map);
		System.out.println(result);
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(result));
		} catch (Exception e) {
		}
	}

	@RequestMapping("like/likeOff.do")
	public void musicLikeOff(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String tno = request.getParameter("tno");
		String type = request.getParameter("type");
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("tno", Integer.parseInt(tno));
		map.put("type", Integer.parseInt(type));
		map.put("id", id);
		map.put("table", tables[Integer.parseInt(type)]);
		map.put("noName", noName[Integer.parseInt(type)]);
		int result = LikeDAO.likeOff(map);
		try {
			PrintWriter out = response.getWriter();
			out.write(String.valueOf(result));
		} catch (Exception e) {
		}
	}
	@RequestMapping("like/likeCheck.do")
	public void musicLikeCheck(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String tno = request.getParameter("tno");
		String type = request.getParameter("type");
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("tno", Integer.parseInt(tno));
		map.put("type", Integer.parseInt(type));
		map.put("id", id);
		int count = LikeDAO.likeCheck(map);
		try {
			PrintWriter out = response.getWriter();
			if (count == 0) {
				out.write("NO");
			} else {
				out.write("OK");
			}
		} catch (Exception e) {
		}
	}
}

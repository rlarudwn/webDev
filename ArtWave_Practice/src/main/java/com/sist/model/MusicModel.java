package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.MusicDAO;
import com.sist.vo.AlbumVO;
import com.sist.vo.MusicVO;
/*
댄스
드라마
발라드
인디
락
랩/힙합
블루스/포크
R&B/소울
트로트
동요
일렉트로니카
정통
라틴
애시드/퓨전
한국영화
국내CCM
캐롤
 */
public class MusicModel {
	private String[] genreList= {"", "", "댄스", "드라마", "발라드", "인디", "락", "랩/힙합", 
			"블루스/포크", "R&B/소울", "트로트", "동요", "일렉트로니카", "정통", "애시드/퓨전", "한국영화", "국내CCM", "캐롤"};
	@RequestMapping("music/musicList.do")
	public String musicList(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		String genre=request.getParameter("genre");
		if(genre==null)
			genre="1";
		int curPage=Integer.parseInt(page);
		int rowSize=50;
		int start= (curPage-1)*rowSize+1;
		int end=start+rowSize-1;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("genre", genreList[Integer.parseInt(genre)]);
		List<MusicVO> list=MusicDAO.musicListData(map);
		int totalPage=MusicDAO.musicTotalPage(genreList[Integer.parseInt(genre)]);
		int startPage=(curPage-1)/10*10+1;
		int endPage=startPage+10-1;
		System.out.println(list.size());
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../music/musicList.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("music/albumList.do")
	public String albumList(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		String genre=request.getParameter("genre");
		if(genre==null)
			genre="1";
		int curPage=Integer.parseInt(page);
		int rowSize=12;
		int start= (curPage-1)*rowSize+1;
		int end=start+rowSize-1;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("genre", genreList[Integer.parseInt(genre)]);
		List<AlbumVO> list=MusicDAO.albumListData(map);
		int totalPage=MusicDAO.albumTotalPage(genreList[Integer.parseInt(genre)]);
		int startPage=(curPage-1)/10*10+1;
		int endPage=startPage+10-1;
		System.out.println(list.size());
		System.out.println(totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../music/albumList.jsp");
		return "../main/main.jsp";
	}
}

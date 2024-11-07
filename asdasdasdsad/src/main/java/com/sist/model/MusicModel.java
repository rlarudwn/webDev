package com.sist.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.MusicDAO;
import com.sist.vo.AlbumVO;
import com.sist.vo.ArtistVO;
import com.sist.vo.MusicVO;
import com.sist.vo.PlayListVO;

import controller.RequestMapping;

/*
전체
댄스
드라마
발라드
인디
락
랩/힙합
트로트
R&B/소울
 */
public class MusicModel {
	private String[] genreList = { "", "", "댄스", "드라마", "발라드", "인디", "락", "랩/힙합", "트로트", "R&B/소울", "블루스/포크", "동요",
			"일렉트로니카", "정통", "애시드/퓨전", "한국영화", "국내CCM", "캐롤" };

	@RequestMapping("music/musicHome.do")
	public String musicHome(HttpServletRequest request, HttpServletResponse response) {
		Map map = new HashMap();
		map.put("genre", "");
		map.put("start", 1);
		map.put("end", 10);
		map.put("ss", "");
		List<MusicVO> mList = MusicDAO.musicListData(map);
		map.put("end", 12);
		List<MusicVO> list = MusicDAO.musicListDataNew(map);

		request.setAttribute("list", list);
		request.setAttribute("mList", mList);
		request.setAttribute("main_jsp", "../music/musicHome.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("music/musicList.do")
	public String musicList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String page = request.getParameter("page");
		String ss = request.getParameter("ss");
		if (ss == null)
			ss = "";
		if (page == null)
			page = "1";
		String genre = request.getParameter("genre");
		if (genre == null)
			genre = "1";
		int curPage = Integer.parseInt(page);
		int rowSize = 50;
		int start = (curPage - 1) * rowSize + 1;
		int end = start + rowSize - 1;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("genre", genreList[Integer.parseInt(genre)]);
		map.put("ss", ss);
		List<MusicVO> list = MusicDAO.musicListData(map);
		int totalPage = MusicDAO.musicTotalPage(genreList[Integer.parseInt(genre)]);
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		request.setAttribute("id", id);
		request.setAttribute("ss", ss);
		request.setAttribute("genre", genre);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../music/musicList2.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("music/albumList.do")
	public String albumList(HttpServletRequest request, HttpServletResponse response) {
		try {
			String page = request.getParameter("page");
			if (page == null)
				page = "1";
			String genre = request.getParameter("genre");
			if (genre == null)
				genre = "1";
			String ss = request.getParameter("ss");
			if (ss == null)
				ss = "";
			int curPage = Integer.parseInt(page);
			int rowSize = 25;
			int start = (curPage - 1) * rowSize + 1;
			int end = start + rowSize - 1;
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("genre", genreList[Integer.parseInt(genre)]);
			map.put("ss", ss);
			List<AlbumVO> list = MusicDAO.albumListData(map);
			int totalPage = MusicDAO.albumTotalPage(genreList[Integer.parseInt(genre)]);
			int startPage = (curPage - 1) / 10 * 10 + 1;
			int endPage = startPage + 10 - 1;
			System.out.println(list.size());
			System.out.println(totalPage);
			request.setAttribute("ss", ss);
			request.setAttribute("genre", genre);
			request.setAttribute("curPage", curPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("list", list);
			request.setAttribute("main_jsp", "../music/albumList2.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "../main/main.jsp";
	}

	@RequestMapping("music/artistList.do")
	public String artistList(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		String ss = request.getParameter("ss");
		if (ss == null)
			ss = "";
		int curPage = Integer.parseInt(page);
		int rowSize = 12;
		int start = (curPage - 1) * rowSize + 1;
		int end = start + rowSize - 1;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("ss", ss);
		List<ArtistVO> list = MusicDAO.artistListData(map);
		request.setAttribute("ss", ss);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", list.size());
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../music/artistList.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("music/musicMvList.do")
	public String musicMvList(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String ss = request.getParameter("ss");
		if (ss == null)
			ss = "";
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int start = (curPage - 1) * 20 + 1;
		int end = start + 20 - 1;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("ss", ss);
		int totalPage = MusicDAO.musicMvTotalPage(ss);
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		List<MusicVO> list = MusicDAO.musicMvListData(map);
		for (MusicVO vo : list) {
			String url = vo.getUrlmp4();
			url = url.substring(url.indexOf("v=") + 2, url.indexOf("&pp"));
			String mp4url = url;
			url = "https://img.youtube.com/vi/" + url + "/0.jpg";
			vo.setThum(url);
			vo.setUrlmp4(mp4url);
		}
		request.setAttribute("ss", ss);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("mvList", list);
		request.setAttribute("main_jsp", "../music/mvList.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("music/artistDetail.do")
	public String artistDetail(HttpServletRequest request, HttpServletResponse response) {
		String ano = request.getParameter("ano");
		ArtistVO vo = MusicDAO.artistDetailData(Integer.parseInt(ano));
		List<MusicVO> mList = MusicDAO.artistMusicData(Integer.parseInt(ano));
		List<AlbumVO> aList = MusicDAO.artistAlbumData(Integer.parseInt(ano));
		request.setAttribute("mList", mList);
		request.setAttribute("aList", aList);
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../music/artistDetail2.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("music/musicDetail.do")
	public String musicDetail(HttpServletRequest request, HttpServletResponse response) {
		String mno = request.getParameter("mno");
		MusicVO vo = MusicDAO.musicDetailData(Integer.parseInt(mno));
		List<MusicVO> mList = MusicDAO.artistMusicData(vo.getAno());
		for (MusicVO vor : mList)
			System.out.println(vor.getPlaycount());
		List<String> lList = new ArrayList<String>();
		List<String> cList = new ArrayList<String>();
		List<String> aList = new ArrayList<String>();
		if (vo.getLylicist() != null) {
			String[] slist = vo.getLylicist().split(",");
			int[] ilist = new int[slist.length];
			for (int i = 0; i < slist.length; i++) {
				ilist[i] = Integer.parseInt(slist[i]);
			}
			lList = MusicDAO.artistName(ilist);
			request.setAttribute("lnList", ilist);
		}
		if (vo.getComposer() != null) {
			String[] slist = vo.getComposer().split(",");
			int[] ilist = new int[slist.length];
			for (int i = 0; i < slist.length; i++) {
				ilist[i] = Integer.parseInt(slist[i]);
			}
			cList = MusicDAO.artistName(ilist);
			request.setAttribute("cnList", ilist);
		}
		if (vo.getArranger() != null) {
			String[] slist = vo.getArranger().split(",");
			int[] ilist = new int[slist.length];
			for (int i = 0; i < slist.length; i++) {
				ilist[i] = Integer.parseInt(slist[i]);
			}
			aList = MusicDAO.artistName(ilist);
			request.setAttribute("anList", ilist);
		}
		request.setAttribute("detail", vo);
		request.setAttribute("lList", lList);
		request.setAttribute("cList", cList);
		request.setAttribute("aList", aList);
		request.setAttribute("mList", mList);
		request.setAttribute("main_jsp", "../music/musicDetail2.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("music/albumDetail.do")
	public String albumDetail(HttpServletRequest request, HttpServletResponse response) {
		String alno = request.getParameter("alno");

		AlbumVO vo = MusicDAO.albumDetailData(Integer.parseInt(alno));
		List<MusicVO> mList = MusicDAO.albumMusicData(Integer.parseInt(alno));

		request.setAttribute("detail", vo);
		request.setAttribute("mList", mList);
		request.setAttribute("main_jsp", "../music/albumDetail.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("music/find.do")
	public String musicFind(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		String ss = request.getParameter("ss");
		if (ss == null)
			ss = "";
		System.out.println(ss);
		Map map = new HashMap();
		map.put("start", 1);
		map.put("end", 10);
		map.put("ss", ss);
		List<MusicVO> mList = MusicDAO.musicFindData(map);
		map.put("end", 6);
		List<AlbumVO> alList = MusicDAO.albumFindData(map);
		map.put("end", 4);
		List<ArtistVO> aList = MusicDAO.artistFindData(map);
		System.out.println(mList.size());
		System.out.println(alList.size());
		System.out.println(aList.size());
		request.setAttribute("ss", ss);
		request.setAttribute("mList", mList);
		request.setAttribute("alList", alList);
		request.setAttribute("aList", aList);
		request.setAttribute("main_jsp", "../music/find.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("music/playListMake.do")
	public void playListMake(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String plname = request.getParameter("plname");
		Map map = new HashMap();
		map.put("id", id);
		map.put("plname", plname);
		MusicDAO.playListInsert(map);
	}

	@RequestMapping("music/playListList.do")
	public void playListList(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		List<PlayListVO> list = MusicDAO.playListListData(id);
		JSONArray arr = new JSONArray();
		for (PlayListVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("plno", vo.getPlno());
			obj.put("plname", vo.getPlname());
			obj.put("id", vo.getId());
			obj.put("dbday", vo.getDbday());
			arr.add(obj);
		}
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception e) {
		}
	}

	@RequestMapping("music/playListMusicInsert.do")
	public void playListMusicInsert(HttpServletRequest request, HttpServletResponse response) {
		String mno = request.getParameter("mno");
		String plno = request.getParameter("plno");
		Map map = new HashMap();
		map.put("mno", Integer.parseInt(mno));
		map.put("plno", Integer.parseInt(plno));
		String result = MusicDAO.playListMusicInsert(map);
		System.out.println(result);
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (Exception e) {
		}
	}
}
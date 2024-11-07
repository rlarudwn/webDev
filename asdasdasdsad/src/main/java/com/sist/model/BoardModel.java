package com.sist.model;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.BoardDAO;
import com.sist.vo.BoardVO;
import com.sist.vo.ReplyVO;

import controller.RequestMapping;

public class BoardModel {
	String[] options = { "", "nick", "subject", "content" };
	String[] types= {"", "자유", "영화", "책", "음악"};
	@RequestMapping("board/boardList.do")
	public String boardList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (curPage - 1) * rowSize + 1;
		int end = start + rowSize - 1;
		String ss = request.getParameter("ss");
		if (ss == null)
			ss = "";
		String type = request.getParameter("type");
		if (type == null)
			type = "";
		String option = request.getParameter("option");
		if (option == null)
			option = "0";
		if (id == null)
			System.out.println("null");
		else
			System.out.println("not null");
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("ss", ss);
		map.put("option", options[Integer.parseInt(option)]);
		List<BoardVO> list = new ArrayList<BoardVO>();
		int count = 0;
		if (option.equals("0")) {
			list = BoardDAO.boardListData(map);
			count = BoardDAO.boardTotalCount(type);
		} else {
			list = BoardDAO.boardFindListData(map);
			count = BoardDAO.boardFindTotalCount(map);
		}
		for(BoardVO vo:list) {
			vo.setTypeDetail(types[vo.getCno()]);
		}
		int totalPage = (int) (Math.ceil(count / 10.0));
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		count = count - (curPage - 1) * 10;

		request.setAttribute("type", type);
		request.setAttribute("count", count);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("bList", list);
		request.setAttribute("main_jsp", "../board/boardList.jsp");
		request.setAttribute("id", id);
		return "../main/main.jsp";
	}

	@RequestMapping("board/boardInsert.do")
	public String boardInsert(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../board/boardInsert.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("board/boardInsertOk.do")
	public void boardInsertOk(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("URF-8");
		} catch (UnsupportedEncodingException e) {
		}
		String id = (String) session.getAttribute("id");
		String nick = (String) session.getAttribute("nickname");
		String type = request.getParameter("type");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String photo = request.getParameter("photo");
		if (photo == null)
			photo = "없음";
		BoardVO vo = new BoardVO();
		vo.setFbphoto(photo);
		vo.setId(id);
		vo.setNick(nick);
		vo.setCno(Integer.parseInt(type));
		vo.setFbsubject(subject);
		vo.setContent(content);
		BoardDAO.boardInsert(vo);
	}
	
	@RequestMapping("board/boardDetail.do")
	public String boardDetail(HttpServletRequest request, HttpServletResponse response) {
		String fbno=request.getParameter("fbno");
		BoardVO vo=BoardDAO.boardDetailData(Integer.parseInt(fbno));
		int count=BoardDAO.boardReplyCount(Integer.parseInt(fbno));
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		if(id==null)
			id="";
		request.setAttribute("id", id);
		request.setAttribute("count", count);
		request.setAttribute("type", types[vo.getCno()]);
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../board/boardDetail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("board/replyInsert.do")
	public void boardReplyInert(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String nick=(String)session.getAttribute("nickname");
		String content= request.getParameter("content");
		String fbno=request.getParameter("fbno");
		String depth=request.getParameter("depth");
		String root=request.getParameter("root");
		ReplyVO vo=new ReplyVO();
		vo.setId(id);
		vo.setNick(nick);
		vo.setContent(content);
		vo.setFbno(Integer.parseInt(fbno));
		vo.setDepth(Integer.parseInt(depth));
		if(root==null)
			BoardDAO.replyInsert(vo);
		else {
			vo.setRoot(Integer.parseInt(root));
			BoardDAO.reReplyInsert(vo);
		}
	}
	@RequestMapping("board/replyList.do")
	public void boardReplyList(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String fbno=request.getParameter("fbno");
		List<ReplyVO> list=BoardDAO.replyList(Integer.parseInt(fbno));
		JSONArray arr=new JSONArray();
		for(ReplyVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("sessionId", id);
			obj.put("id", vo.getId());
			obj.put("frno", vo.getFrno());
			obj.put("fbno", vo.getFbno());
			obj.put("content", vo.getContent());
			obj.put("dbday", vo.getDbday());
			obj.put("root", vo.getRoot());
			obj.put("depth", vo.getDepth());
			obj.put("nick", vo.getNick());
			arr.add(obj);
		}
		try {
		  response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception e) {}
	}
	@RequestMapping("board/replyCheck.do")
	public void replyCheck(HttpServletRequest request, HttpServletResponse response) {
		String root=request.getParameter("root");
		System.out.println(root);
		int count=BoardDAO.replyCheck(Integer.parseInt(root));
		try {
		  response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		} catch (Exception e) {}
	}
	@RequestMapping("board/replyCount.do")
	public void replyCount(HttpServletRequest request, HttpServletResponse response) {
		String fbno=request.getParameter("fbno");
		int count=BoardDAO.replyCount(Integer.parseInt(fbno));
		System.out.println(count);
		try {
		  response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		} catch (Exception e) {}
	}
	@RequestMapping("board/replyDelete.do")
	public void replyDelete(HttpServletRequest request, HttpServletResponse response) {
		String frno=request.getParameter("frno");
		BoardDAO.replyDelete(Integer.parseInt(frno));
	}
	@RequestMapping("board/boardDelete.do")
	public void boardDelete(HttpServletRequest request, HttpServletResponse response) {
		String fbno=request.getParameter("fbno");
		BoardDAO.boardDelete(Integer.parseInt(fbno));
	}
}

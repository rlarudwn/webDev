package com.sist.model;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.AllReplyDAO;
import com.sist.vo.AllReplyVO;

public class AllReplyModel {
	@RequestMapping("allReply/list.do")
	public void allReplyList(HttpServletRequest request, HttpServletResponse response) {
		String cno = request.getParameter("cno");
		String type = request.getParameter("type");
		System.out.println(type);
		Map map = new HashMap();
		map.put("cno", cno);
		map.put("type", type);
		List<AllReplyVO> list = AllReplyDAO.allReplyListData(map);
		JSONArray arr = new JSONArray();
		HttpSession session = request.getSession();
		String sid = (String) session.getAttribute("id");
		for (AllReplyVO vo : list) {
			JSONObject obj = new JSONObject();
			obj.put("rno", vo.getRno());
			obj.put("cno", vo.getCno());
			obj.put("type", vo.getType());
			obj.put("name", vo.getName());
			obj.put("id", vo.getId());
			obj.put("msg", vo.getMsg());
			obj.put("dbday", vo.getDbday());
			obj.put("sessionId", sid);
			arr.add(obj);
		}
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception e) {}
	}
	@RequestMapping("allReply/insert.do")
	public void allReplyInsert(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String cno=request.getParameter("cno");
		String type=request.getParameter("type");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		AllReplyVO vo=new AllReplyVO();
		vo.setCno(Integer.parseInt(cno));
		vo.setType(Integer.parseInt(type));
		vo.setMsg(msg);
		vo.setId(id);
		vo.setName(name);
		String result="";
		try {
			AllReplyDAO.allReplyInsert(vo);
			result="OK";
		} catch (Exception e) {
			result=e.getMessage();
		}
		try {
			PrintWriter out=response.getWriter();
			if(result=="OK")
				out.write(result);
		} catch (Exception e) {}
	}
	@RequestMapping("allReply/delete.do")
	public void allReplyDelete(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rno");
		String result="";
		try {
			AllReplyDAO.allReplyDelete(Integer.parseInt(rno));
			result="OK";
		} catch (Exception e) {
			result=e.getMessage();
		}
		try {
			PrintWriter out=response.getWriter();
			if(result=="OK")
				out.write(result);
		} catch (Exception e) {}
	}
	@RequestMapping("allReply/update.do")
	public void allReplyUpdate(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String rno=request.getParameter("rno");
		String msg=request.getParameter("msg");
		String result="";
		Map map=new HashMap();
		map.put("rno", rno);
		map.put("msg", msg);
		try {
			AllReplyDAO.allReplyUpdate(map);
			result="OK";
		} catch (Exception e) {
			result=e.getMessage();
		}
		try {
			PrintWriter out=response.getWriter();
			if(result=="OK")
				out.write(result);
		} catch (Exception e) {}
	}
}

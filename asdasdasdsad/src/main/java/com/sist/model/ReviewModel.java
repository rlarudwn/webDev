package com.sist.model;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class ReviewModel {
	   @RequestMapping("review/list.do")
	   public void review_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   String tno=request.getParameter("tno");
		   String type=request.getParameter("type");
		   Map map=new HashMap();
		   map.put("tno",tno);
		   map.put("type", Integer.parseInt(type));
		   List<ReviewVO> list=ReviewDAO.reviewListData(map);
		   JSONArray arr=new JSONArray();

		   int i=0;
		   HttpSession session=request.getSession();
		   String sid=(String)session.getAttribute("id");
		   if(sid==null)
		   {
			   sid="guest";
		   }
		   for(ReviewVO vo:list)
		   {
			   JSONObject obj=new JSONObject();
			   obj.put("trno", vo.getTrno());
			   obj.put("tno", vo.getTno());
			   obj.put("trating", vo.getTrating());
			   obj.put("id", vo.getId());
			   obj.put("nickname", vo.getNickname());
			   obj.put("tcontent", vo.getTcontent());
			   obj.put("dbday", vo.getDbday());
			   obj.put("sessionId", sid);
			   obj.put("type", vo.getType());
			   arr.add(obj);
		   }
		   try
		   {
			   response.setContentType("text/plain;charset=UTF-8");
			   PrintWriter out=response.getWriter();
			   out.write(arr.toJSONString());
		   }catch(Exception ex) {}
	   }
	   @RequestMapping("review/insert.do")
	   public void review_insert(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   String nickname=(String)session.getAttribute("nickname");
		   
		   String tno=request.getParameter("tno");
		   String trating=request.getParameter("trating");
		   String tcontent=request.getParameter("tcontent");
		   String type=request.getParameter("type");
		   
		   Map map=new HashMap();
		   map.put("id", id);
		   map.put("nickname", nickname);
		   map.put("tno", tno);
		   map.put("trating", trating);
		   map.put("tcontent", tcontent);
		   map.put("type", type);
		   
		   ReviewDAO.reviewInsert(map);
		   
	   }
	   @RequestMapping("review/delete.do")
	   public void review_delete(HttpServletRequest request,HttpServletResponse response)
	   {
		   String trno=request.getParameter("trno");
		   String result="";
		   try
		   {
			   ReviewDAO.reviewDelete(Integer.parseInt(trno));
			   result="OK";
		   }catch(Exception ex) 
		   {
			   result=ex.getMessage();
		   }
		   try
		   {
			   PrintWriter out=response.getWriter();
			   out.write(result);
		   }catch(Exception ex) {}
	   }
	   @RequestMapping("review/update.do")
	   public void review_update(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String trno=request.getParameter("trno");
		   String tcontent=request.getParameter("tcontent");
		   String trating=request.getParameter("trating");
		   
		   String result="";
		   try
		   {
			   Map map=new HashMap();
			   map.put("trno", trno);
			   map.put("tcontent", tcontent);
			   map.put("trating", trating);
			   ReviewDAO.reviewUpdate(map);
			   result="OK";
		   }catch(Exception ex)
		   {
			   result=ex.getMessage();
		   }
		   
		   try
		   {
			   PrintWriter out=response.getWriter();
			   out.write(result);
		   }catch(Exception ex) {}
	   }
	   @RequestMapping("review/checkedReview.do")
	   public void checkedReview(HttpServletRequest request, HttpServletResponse response) {
	       String tno=request.getParameter("tno");
	       String userId=request.getParameter("userId");

	       Map map = new HashMap();
	       map.put("tno", tno);
	       map.put("id", userId);

	       boolean checkedR=ReviewDAO.CheckedReview(map);

	       try {
	           PrintWriter out = response.getWriter();
	           if (checkedR) {
	               out.write("ALREADY_REVIEWED");
	           } else {
	               out.write("NO_REVIEW");
	           }
	       } catch (Exception ex) {
	           ex.printStackTrace();
	       }
	   }
}

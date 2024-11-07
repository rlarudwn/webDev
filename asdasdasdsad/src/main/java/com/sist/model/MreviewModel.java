package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.*;
import com.sist.vo.*;

import controller.RequestMapping;

public class MreviewModel {
	 @RequestMapping("movie/mreviewlist.do")
	   public void mreviewlist(HttpServletRequest request,HttpServletResponse response)
	   {
		   String mcno=request.getParameter("mcno");
		   Map map=new HashMap();
		   map.put("cno",mcno);
		   List<MreviewVO> list=MreviewDAO.mreviewListData(map);

		   JSONArray arr=new JSONArray();
		   int i=0;
		   HttpSession session=request.getSession();
		   String sid=(String)session.getAttribute("id");
		   if(sid==null)
		   {
			   sid="guest";
		   }
		   for(MreviewVO vo:list)
		   {
			   JSONObject obj=new JSONObject();
			   obj.put("rno", vo.getMrno());
			   obj.put("cno", vo.getMcno());
			   obj.put("mrating", vo.getMrating());
			   obj.put("id", vo.getId());
			   obj.put("mrcontent", vo.getMrcontent());
			   obj.put("dbday", vo.getDbday());
			   obj.put("nickname", vo.getNickname());
			   obj.put("sessionId", sid);
			   arr.add(obj);
		   }
		   // JavaScript로 값 전송 
		   try
		   {
			   response.setContentType("text/plain;charset=UTF-8");
			   PrintWriter out=response.getWriter();
			   out.write(arr.toJSONString());
		   }catch(Exception ex) {}
	   }
	   @RequestMapping("movie/mreviewinsert.do")
	   public void mreviewinsert(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
			   
		   }catch(Exception ex) {}
		   String mcno=request.getParameter("mcno");
		   String mrrecom=request.getParameter("mrrecom");
		   String mrcontent=request.getParameter("mrcontent");
		   String dbday=request.getParameter("dbday");
		   // 로그인후에 사용이 가능 
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   String nickname=(String)session.getAttribute("nickname"); 
		   
		   MreviewVO vo=new MreviewVO();
		   vo.setMcno(Integer.parseInt(mcno));
		   vo.setMrrecom(Integer.parseInt(mrrecom));
		   vo.setId(id);
		   vo.setDbday(dbday);
		   vo.setNickname(nickname);
		   vo.setMrcontent(mrcontent);
		   String result="";
		   try
		   {
		      MreviewDAO.mreviewInsert(vo);
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
	   @RequestMapping("movie/mreviewdelete.do")
	   public void mreviewdelete(HttpServletRequest request,HttpServletResponse response)
	   {
		   String mrno=request.getParameter("mrno");
		   String result="";
		   try
		   {
			   MreviewDAO.mreviewDelete(Integer.parseInt(mrno));
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
	   @RequestMapping("movie/mreviewupdate.do")
	   public void mreviewupdate(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String mrno=request.getParameter("mrno");
		   String mrcontent=request.getParameter("mrcontent");
		   
		   String result="";
		   try
		   {
			   Map map=new HashMap();
			   map.put("mrno", mrno);
			   map.put("mrcontent", mrcontent);
			   MreviewDAO.mreviewUpdate(map);
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
	}
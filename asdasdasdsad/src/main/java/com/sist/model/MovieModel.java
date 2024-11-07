package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.vo.*;
import controller.RequestMapping;

import com.sist.dao.*;

public class MovieModel {
	@RequestMapping("movie/moviemain.do")
	public String movie_main(HttpServletRequest request,HttpServletResponse response)
	{
		List<MovieVO> tList=MovieDAO.movieTopData();
		request.setAttribute("tList", tList);
		request.setAttribute("main_jsp", "../movie/moviemain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("movie/movielist1.do")
	public String movie_list1(HttpServletRequest request,HttpServletResponse response)
	{
		String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=16;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   map.put("start", start);
		   map.put("end", end);
		   List<MovieVO> mlList1=MovieDAO.movieListData1(map);
		   int totalpage=MovieDAO.movieTotalPage1();
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("mlList1", mlList1);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   
		   int count1=MovieDAO.movieListCount1();
		   request.setAttribute("count1", count1);
		   
		   request.setAttribute("main_jsp", "../movie/movielist1.jsp");
			return "../main/main.jsp";
	}
	@RequestMapping("movie/movielist2.do")
	public String movie_list2(HttpServletRequest request,HttpServletResponse response)
	{
		String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   Map map=new HashMap();
		   int rowSize=16;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=rowSize*curpage;
		   
		   map.put("start", start);
		   map.put("end", end);
		   List<MovieVO> mlList2=MovieDAO.movieListData2(map);
		   int totalpage=MovieDAO.movieTotalPage2();
		   
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("mlList2", mlList2);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   
		   int count2=MovieDAO.movieListCount2();
		   request.setAttribute("count2", count2);
		   
		   request.setAttribute("main_jsp", "../movie/movielist2.jsp");
			return "../main/main.jsp";
	}
	  @RequestMapping("movie/moviedetail_before.do")
	   public String movie_detail_before(HttpServletRequest request,HttpServletResponse response)
	   {
		   String mno=request.getParameter("mno");
		  /*
		   // 쿠키 
		   Cookie cookie=new Cookie("movie_"+mno, mno);
		   cookie.setMaxAge(60*60*24);
		   cookie.setPath("/");
		 
		   // 브라우저로 전송 
		   response.addCookie(cookie);
		     */
		   return "redirect:../movie/moviedetail.do?mno="+mno;
	   }
	  
	@RequestMapping("movie/moviedetail.do")
	public String movie_detail(HttpServletRequest request,HttpServletResponse response)
	{
		  String mno=request.getParameter("mno");
		   // 데이터베이스 연동 
		   MovieVO vo=MovieDAO.movieDetailData(Integer.parseInt(mno));
		   request.setAttribute("vo", vo);
		   MovieBookVO mbvo = new MovieBookVO();
		   request.setAttribute("mbvo", mbvo);
		   HttpSession session = request.getSession();
		   String id=(String)session.getAttribute("id");
		 	 
		   Map map1=new HashMap();
		   map1.put("mno",Integer.parseInt(mno));
		   List<MovieBookVO> mbList=MovieDAO.movieBookData(map1);
		   request.setAttribute("mbList", mbList);
		  
		    Map map2=new HashMap();
		 	map2.put("tno", Integer.parseInt(mno));
		 	map2.put("type", 1);
		 	int rcount=MreviewDAO.reviewCount(map2);
		 	double avg=MreviewDAO.reviewAverage(map2);
		 	 request.setAttribute("rcount", rcount);
		 	 request.setAttribute("avg", avg);
		 	 request.setAttribute("id", id);
		  
		   request.setAttribute("main_jsp", "../movie/moviedetail.jsp");
		 return "../main/main.jsp";
	}	
	@RequestMapping("movie/moviefind1.do")
	   public String moviefind1(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String ss=request.getParameter("ss");
		   if(ss==null)
			   ss="사랑";
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   int rowSize=16;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=(rowSize*curpage);
		   
		   Map map=new HashMap();
		   map.put("start",start);
		   map.put("end", end);
		   map.put("ss", ss);
		   // 데이터 읽기
		   List<MovieVO> mfList1=MovieDAO.movieFindData1(map);
		   int totalpage=MovieDAO.movieFindTotalPage1(ss);
		   // 총페이지 읽기 
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("mfList1", mfList1);
		   request.setAttribute("ss", ss);
		   // BLOCK별 처리 
		   request.setAttribute("main_jsp", "../movie/moviefind1.jsp");
	
		   return "../main/main.jsp";
	   }
	@RequestMapping("movie/moviefind2.do")
	   public String moviefind2(HttpServletRequest request,HttpServletResponse response)
	   {
		   try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		   String ss=request.getParameter("ss");
		   if(ss==null)
			   ss=" ";
		   String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   int rowSize=16;
		   int start=(rowSize*curpage)-(rowSize-1);
		   int end=(rowSize*curpage);
		   
		   Map map=new HashMap();
		   map.put("start",start);
		   map.put("end", end);
		   map.put("ss", ss);
		   // 데이터 읽기
		   List<MovieVO> mfList2=MovieDAO.movieFindData2(map);
		   int totalpage=MovieDAO.movieFindTotalPage2(ss);
		   // 총페이지 읽기 
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   if(endPage>totalpage)
			   endPage=totalpage;
		   
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("mfList2", mfList2);
		   request.setAttribute("ss", ss);
		   // BLOCK별 처리 
		   request.setAttribute("main_jsp", "../movie/moviefind2.jsp");
	
		   return "../main/main.jsp";
	   }

}

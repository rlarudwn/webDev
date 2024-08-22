package com.sist.model;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class MemberModel {
  @RequestMapping("member/login.do")
  //                       MemberVO vo
  public void member_login(HttpServletRequest request,HttpServletResponse response)
  {
	  // data:{"id":id,"pwd":pwd}
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
	  MemberVO vo=MemberDAO.isLogin(id, pwd);
	  if(vo.getMsg().equals("OK"))
	  {
		  HttpSession session=request.getSession();
		  session.setAttribute("id", vo.getId());
		  session.setAttribute("name", vo.getName());
		  session.setAttribute("admin", vo.getAdmin());
	  }
	  // ajax로 전송 
	  try
	  {
		  PrintWriter out=response.getWriter();
		  out.write(vo.getMsg());
	  }catch(Exception ex) {}
  }
  @RequestMapping("member/logout.do")
  public void member_logout(HttpServletRequest request,HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  session.invalidate();
	  try
	  {
		  PrintWriter out=response.getWriter();
		  out.write("OK");
	  }catch(Exception ex) {}
  }
  @RequestMapping("member/join.do")
  public String member_join(HttpServletRequest request,HttpServletResponse response)
  {
	  request.setAttribute("main_jsp", "../member/join.jsp");
	  // 아이디 중복 체크 , 우편번호 검색 => daum라이브러리 
	  CommonsModel.footerPrint(request);
	  return "../main/main.jsp";
  }
  @RequestMapping("member/idCheck.do")
  public String membeeIdCheck(HttpServletRequest request, HttpServletResponse response) {
  	return "../member/idCheck.jsp";
  }
  @RequestMapping("member/idCheckOk.do")
  public void memberIdCheckOk(HttpServletRequest request, HttpServletResponse response) {
  	String id=request.getParameter("id");
  	int count=MemberDAO.memberIdCount(id);
  	try {
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		} catch (Exception e) {}
  }
  @RequestMapping("member/joinOk.do")
  public String memberJoinOk(HttpServletRequest request, HttpServletResponse response) {
  	try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
  	String id=request.getParameter("id");
  	String pwd=request.getParameter("pwd");
  	String name=request.getParameter("name");
  	String sex=request.getParameter("sex");
  	String birthday=request.getParameter("birthday");
  	String post=request.getParameter("post");
  	String addr1=request.getParameter("addr1");
  	String addr2=request.getParameter("addr2");
  	String email=request.getParameter("email");
  	String phone1=request.getParameter("phone1");
  	String phone2=request.getParameter("phone2");
  	String content=request.getParameter("content");
  	MemberVO vo=new MemberVO();
  	vo.setId(id);
  	vo.setPwd(pwd);
  	vo.setName(name);
  	vo.setSex(sex);
  	vo.setBirthday(birthday);
  	vo.setPost(post);
  	vo.setAddr1(addr1);
  	vo.setAddr2(addr2);
  	vo.setEmail(email);
  	vo.setContent(content);
  	vo.setPhone(phone1+phone2);
  	MemberDAO.memberUpdate(vo);
  	return "redirect:../main/main.do";
  }
  @RequestMapping("member/idfind.do")
  public String memberIdfind(HttpServletRequest request, HttpServletResponse response) {
  	request.setAttribute("main_jsp", "../member/idFind.jsp");
  	return "../main/main.jsp";
  }
  @RequestMapping("member/idFindOk.do")
  public void memberIdFindOk(HttpServletRequest request, HttpServletResponse response) {
  	try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
  	String name=request.getParameter("name");
  	String email=request.getParameter("email");
  	String phone=request.getParameter("phone");
  	MemberVO vo=new MemberVO();
  	vo.setName(name);
  	vo.setEmail(email);
  	vo.setPhone(phone);
  	String result="";
  	if(phone==null)
  		result=MemberDAO.memberIdFindEmailData(vo);
  	else
  		result=MemberDAO.memberIdFindPhoneData(vo);
  	try {
  		PrintWriter out=response.getWriter();
  		out.write(result);
		} catch (Exception e) {}
  }
}

package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

public class MyPageModel {
	@RequestMapping("mypage/myPageMain.do")
	public String myPageMain(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("title", "마이페이지 홈");
		request.setAttribute("mypage_jsp", "../mypage/myPageHome.jsp");
		request.setAttribute("main_jsp", "../mypage/myPageMain.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	@RequestMapping("member/joinUpdate.do")
	public String myPageJoinUpdate(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		MemberVO vo=MemberDAO.memberUpdateData(id);
		String phone=vo.getPhone();
		phone=phone.substring(phone.indexOf("010")+3);
		vo.setPhone(phone);
		request.setAttribute("detail", vo);
		request.setAttribute("title", "회원 수정");
		request.setAttribute("mypage_jsp", "../member/joinUpdate.jsp");
		request.setAttribute("main_jsp", "../mypage/myPageMain.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	@RequestMapping("member/joinUpdateOk.do")
	public String myPageJoinUpdateOk(HttpServletRequest request, HttpServletResponse response) {
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
  	MemberDAO.memberInsert(vo);
		return "../member/joinUpdateOk.jsp";
	}
}

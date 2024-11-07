/*
	http://localhost/JSPBackProjec_3/MyServlet
	URL입력	=> 웹서버 요청
				=> HTML, XML, JSON	=> 바로 처리(브라우저로 전송)
				=> Java(Servlet), JSP	=> 번역 필요	=> WAS(Web Application Server) : Tomcat
				
	사용자 요청	=> 요청시 어떤 값을 전송
					GET	=> 단순한 데이터	=> 페이지번호, 상세보기요청등
							=> <a>, 대부분
							=> ?키=값 / ?키=값&키=값
					POST	=> 데이터가 많거나 보안요구 : 노출이 안됨
							=> <form>
	서버 응답	=> 요청값을 받아서 오라클과 연결
		=> 한글은 인코딩으로 들어옴	=> 반드시 디코딩 변경
			=> setCharacterEncoding("UTF-8");
			request	=> 요청값
				getParameter()	=> 단일값
				getParameterValues()	=> 여러값
			response	=> 응답할 경우
				sendRedirect(), addCookie()
		get방식	=> doGet호출
		post방식	=> doPost호출
			=> 동시호출은 없다	=> 잘 모를경우 통합해서 사용 가능	=> service()
*/
package com.sist.servlet;

import java.io.IOException;
import java.io.ObjectInputFilter.Config;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		System.out.println("MyServlet init() call");
	}

	public void destroy() {
		System.out.println("MyServlet destroy() call");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MyServlet doGet() call");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h1>Hello Servlet</h1>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MyServlet doPost() call");
	}

}

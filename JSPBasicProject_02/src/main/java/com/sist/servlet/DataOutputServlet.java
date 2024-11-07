/*
	사용자 전송 정보
		setCharcterEncoding() : 디코딩
		String getParameter() : 단일값
		String[] getParameterValues() : 여러개 값
	추가정보
		setAttribute()
		getAttribute()
	브라우저정보
		getRemoteAddress()	=> IP
		getRequestURL()		=> 요청주소
		getRequestURI()		=> 실제요청주소
	<form>
		<in+
*/
package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DataOutputServlet")
public class DataOutputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DataOutputServlet() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		System.out.println("DataOutputServlet init() call");
	}

	public void destroy() {
		System.out.println("DataOutputServlet destroy() call");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("DataOutputServlet doPost() call");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String content = request.getParameter("content");
		String[] hobby = request.getParameterValues("hobby");
		

		PrintWriter out = response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<h3>전송된 값 : </h3>");
		out.write("이름 : "+name + "<br>");
		out.write("성별 : "+sex + "<br>");
		out.write("전화 : "+tel1 + ")" + tel2 + "<br>");
		out.write("소개 : "+content + "<br>");
		out.write("취미 : " + "<br>");
		out.write("<ul>");
		try {
			for(String s: hobby) {
			out.write("<li>" + s + "</li>");
		}
		} catch (Exception e) {
			out.write("<font color=red>취미가없습니다</font>");
		}
		out.write("</ul>");
		out.write("<a href=\"DataInputServlet\">입력</a>");
		out.write("<hr>");
		out.write("<h3>request의 기본 기능</h3>");
		out.write("서버명 : "+request.getServerName() + "<br>");
		out.write("서버포트 : "+request.getServerPort() + "<br>");
		out.write("클라이언트IP : "+request.getRemoteAddr() + "<br>");
		out.write("URL : "+request.getRequestURL() + "<br>");
		out.write("URI : "+request.getRequestURI() + "<br>");
		out.write("request는 화면을 이동 / 새로고침시 초기화<br>");
		out.write("</body>");
		out.write("</html>");
	}

}

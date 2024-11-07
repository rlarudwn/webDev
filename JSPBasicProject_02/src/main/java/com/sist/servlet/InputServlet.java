package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InputServlet")
public class InputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InputServlet() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		System.out.println("InputServlet : init() call");
	}

	public void destroy() {
		System.out.println("InputServlet : destroy() call");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("사용자가 요청한 데이터를 받아서 처리 결과를 보내주는 역할");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<html>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3><a href=OutputServlet>OutputServlet</a></h3>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	}

}

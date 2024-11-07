package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DataInputServlet")
public class DataInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DataInputServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("DataInputServlet:init() call");
	}

	public void destroy() {
		System.out.println("DataInputServlet:destroy() call");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<html>");
		out.write("<head>");
		out.write("<link rel=\"stylesheet\" href=\"table.css\">");
		out.write("</head>");
		out.write("<body>");
		out.write("<center>");
		out.write("<table class=\"table_content\" width=500>");
		out.write("<form action=\"DataOutputServlet\" method=\"post\">");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">이름</th>");
		out.write("<td width=80%><input type=\"text\" size=\"12\" name=name> </td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">성별</th>");
		out.write("<td>");
		out.write("<input type=radio value=\"남자\" name=sex checked>남자");
		out.write("<input type=radio value=\"여자\" name=sex>여자");
		out.write("</td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">전화</th>");
		out.write("<td width=80%>");
		out.write("<select name=\"tel1\">");
		out.write("<option>010</option>");
		out.write("<option>011</option>");
		out.write("<option>012</option>");
		out.write("</select>");
		out.write("<input type=\"text\" name=\"tel2\" size=15>");
		out.write("</td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">소개</th>");
		out.write("<td width=80%>");
		out.write("<textarea name=content></textarea>");
		out.write("</td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<th width=20% class=\"tdright\">취미</th>");
		out.write("<td width=80%>");
		out.write("<input type=checkbox value=\"낚시\" name=hobby>낚시");
		out.write("<input type=checkbox value=\"등산\" name=hobby>등산");
		out.write("<input type=checkbox value=\"게임\" name=hobby>게임");
		out.write("<input type=checkbox value=\"독서\" name=hobby>독서");
		out.write("<input type=checkbox value=\"영화\" name=hobby>영화");
		out.write("</td>");
		out.write("</tr>");
		out.write("<tr>");
		out.write("<td colspan=2 class=\"tdcenter\">");
		out.write("<button>전송</button>");
		out.write("</td>");
		out.write("</tr>");
		out.write("</form>");
		out.write("</table>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");
	}
}

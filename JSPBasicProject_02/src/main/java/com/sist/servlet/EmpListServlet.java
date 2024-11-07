package com.sist.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.dao.EmpDAO;
import com.sist.dao.EmpVO;

/**
 * Servlet implementation class EmpListServlet
 */
@WebServlet("/EmpListServlet")
public class EmpListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmpListServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		System.out.println("init call");
	}

	public void destroy() {
		System.out.println("destroy call");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet call");

		response.setContentType("text/html;charset=UTF-8");
		EmpDAO dao = EmpDAO.newInstance();
		List<EmpVO> list = dao.empListData();
		PrintWriter out = response.getWriter();
		out.write("<html>");
		out.write("<head>");
		out.write("<link rel=\"stylesheet\" href=\"table.css\">");
		out.write("</head>");
		out.write("<body>");
		out.write("<center>");
		out.write("<h3>사원목록</h3>");
		out.write("<table class=\"table_content\" width=600>");
		out.write("<tr>");
		out.write("<th>사번</th>");
		out.write("<th>이름</th>");
		out.write("<th>직위</th>");
		out.write("<th>입사일</th>");
		out.write("<th>성과금</th>");
		out.write("</tr>");
		
		for(EmpVO vo : list) {
			out.write("<tr class=\"datatr\">");
			out.write("<td class=\"tdcenter\">"+ vo.getEmpno() +"</td>");
			out.write("<td class=\"tdcenter\" ><a href=EmpDetailServlet?empno=" 
			+ vo.getEmpno() + ">"+ vo.getEname() +"</a></td>");
			out.write("<td class=\"tdcenter\">"+ vo.getJob() +"</td>");
			out.write("<td class=\"tdcenter\">" + vo.getHiredate().toString() + "</td>");
			out.write("<td class=\"tdcenter\">" + vo.getComm() + "</td>");
			out.write("</tr>");
		}
		out.write("</table>");
		out.write("</center>");
		out.write("</body>");
		out.write("</html>");

	}

}

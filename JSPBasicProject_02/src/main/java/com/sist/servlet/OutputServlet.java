package com.sist.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OutputServlet")
public class OutputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public OutputServlet() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		System.out.println("OutputServlet : Init() call");
	}
	public void destroy() {
		System.out.println("OutputServlet : destroy() call");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OutputServlet : doGet() call");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("OutputServlet : doPost() call");
	}

}

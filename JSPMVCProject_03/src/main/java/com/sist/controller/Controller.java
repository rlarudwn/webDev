package com.sist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.model.*;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] strCls = { "com.sist.model.ListModel", "com.sist.model.InsertModel", "com.sist.model.InsertOkModel", "com.sist.model.DetailModel", "com.sist.model.ReplyModel", "com.sist.model.ReplyOkModel", "com.sist.model.UpdateModel" };
	private String[] strCmd = { "list.do", "insert.do", "insert_ok.do", "detail.do", "reply.do", "reply_ok.do", "update.do"};
	private Map clsMap = new HashMap();

	public void init(ServletConfig config) throws ServletException {
		try {
			for (int i = 0; i < strCls.length; i++) {
				Class clsName = Class.forName(strCls[i]);
				Object obj = clsName.getDeclaredConstructor().newInstance();
				clsMap.put(strCmd[i], obj);
			}
		} catch (Exception e) {
		}
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println(cmd);
		cmd = cmd.substring(cmd.lastIndexOf("/") + 1);
		Model model = (Model) clsMap.get(cmd);
		String jsp = model.execute(request);
		System.out.println(jsp);
		if(jsp.startsWith("redirect")) {
			String s=jsp.substring(jsp.indexOf(":")+1);
			response.sendRedirect(s);
		}
		else {
			
			RequestDispatcher rd = request.getRequestDispatcher(jsp);
			rd.forward(request, response);
		}
	}

}

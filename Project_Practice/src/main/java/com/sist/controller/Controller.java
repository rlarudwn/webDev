package com.sist.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.model.ChangeModel;
import com.sist.model.Model;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] strCls = { "com.sist.model.ShoesHomeModel", "com.sist.model.ShoesListModel" , "com.sist.model.ShoesDetailModel"};
	private String[] strCmd = { "shoes_home.do?mode=0", "shoes_home.do?mode=1" , "shoes_home.do?mode=2"};
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
		cmd = cmd.substring(cmd.lastIndexOf("/") + 1);
		System.out.println(cmd);
		String mode=request.getParameter("mode");
		if(mode==null)
			mode="0";
		cmd=cmd+"?mode="+mode;
		System.out.println(cmd);
		Model model = (Model) clsMap.get(cmd);
		String jsp = model.execute(request);
		ChangeModel change=new ChangeModel();
		change.change(request);
		System.out.println(jsp);
		RequestDispatcher rd = request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}
}

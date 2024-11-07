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
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.io.*;

import com.sist.model.*;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map clsMap=new HashMap();
	@Override
	public void init(ServletConfig config) throws ServletException {
		clsMap.put("list.do", new ListModel());
		clsMap.put("insert.do", new InsertModel());
		clsMap.put("delete.do", new DeleteModel());
		clsMap.put("update.do", new UpdateModel());
		try {
			DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
			DocumentBuilder db=dbf.newDocumentBuilder();
			Document doc=db.parse(new File("C:\\webDev\\webStudy\\JSPMVCProject_02\\src\\main\\webapp\\WEB-INF\\appllication.xml"));
			Element root=doc.getDocumentElement();
			NodeList list=root.getElementsByTagName("bean");
			for(int i=0;i<list.getLength();i++) {
				Element bean=(Element)list.item(i);
				String id=bean.getAttribute("id");
				String cls=bean.getAttribute("class");
				Class clsName=Class.forName(cls);
				Object obj=clsName.getDeclaredConstructor().newInstance();
			}
		} catch (Exception e) {}
	}

	public Controller() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd=request.getRequestURI(); 
		cmd=cmd.substring(request.getContextPath().length()+1);
		Model model=(Model)clsMap.get(cmd);
		String jsp=model.execute(request);
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}

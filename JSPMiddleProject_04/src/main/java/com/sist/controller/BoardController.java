package com.sist.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.sist.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map clsMap = new HashMap();

	public BoardController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		clsMap.put("board/list.do", new BoardListModel());
		clsMap.put("board/detail.do", new BoardDetailModel());
		clsMap.put("board/insert.do", new BoardInsertModel());
		clsMap.put("board/insert_ok.do", new BoardInsertOkModel());
		clsMap.put("board/update.do", new BoardUpdateModel());
		clsMap.put("board/delete.do", new BoardDeleteModel());
		clsMap.put("board/delete_ok.do", new BoardDeleteOkModel());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getRequestURI();
		cmd = cmd.substring(request.getContextPath().length() + 1);
		String jsp = "";
		Model model=(Model)clsMap.get(cmd);
		jsp=model.execute(request);
		RequestDispatcher rd = request.getRequestDispatcher(jsp);
		rd.forward(request, response);
	}

}

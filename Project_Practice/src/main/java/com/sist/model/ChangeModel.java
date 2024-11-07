package com.sist.model;

import javax.servlet.http.HttpServletRequest;

import com.sist.change.*;

public class ChangeModel {
	public void change(HttpServletRequest request) {
		JspChange change = new JspChange();
		String mode = request.getParameter("mode");
		if (mode == null)
			mode = "0";
		String jsp = change.change(Integer.parseInt(mode));
		request.setAttribute("jsp", jsp);
	}
}

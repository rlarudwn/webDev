package com.sist.change;

public class JspChange {
	String[] jsp = {"shoes_home_section.jsp", "shoes_list_section.jsp", "shoes_detail_section.jsp", "../cart/cart_list.jsp" };

	public String change(int no) {
		return jsp[no];
	}
}

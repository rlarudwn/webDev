<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.sist.dao.*"%>
<%
String no=request.getParameter("no");
String id=(String)session.getAttribute("id");
List<CartVO> list=(List<CartVO>)session.getAttribute("cart");
for(int i=0;i<list.size();i++){
	CartVO vo=list.get(i);
	if(vo.getNo()==Integer.parseInt(no)&&vo.getId().equals(id)){
		list.remove(i);
		break;
	}
	session.setAttribute("cart", list);
}
response.sendRedirect("cart_list.jsp");
%>
package com.sist.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.dao.FoodVO;

public class FoodModel {
	FoodDAO dao=FoodDAO.newInstance();
	@RequestMapping("js/food_find.do")
	public String foodFind(HttpServletRequest request, HttpServletResponse response) {
		
		return "/food_find.jsp";
	}
	@RequestMapping("js/food_find_js.do")
	public void foodFindJs(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		String addr=request.getParameter("addr");
		if(addr==null)
			addr="마포";
		int curPage=Integer.parseInt(page);
		List<FoodVO> list=dao.foodFindData(curPage, addr);
		System.out.println(list.size());
		int totalPage=dao.foodFindTotalPage(addr);
		final int BLOCK=10;
		int startPage=(curPage-1)/BLOCK*BLOCK+1;
		int endPage=startPage+BLOCK-1;
		if(endPage>totalPage)
			endPage=totalPage;
		int i=0;
		JSONArray arr=new JSONArray();
		for(FoodVO vo:list) {
			JSONObject obj=new JSONObject();
			obj.put("fno", vo.getFno());
			obj.put("name", vo.getName());
			obj.put("poster", vo.getPoster());
			obj.put("addr", vo.getAddr());
			if(i==0) {
				obj.put("curPage", curPage);
				obj.put("totalPage", totalPage);
				obj.put("startPage", startPage);
				obj.put("endPage", endPage);
			}
			arr.add(obj);
			i++;
		}
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
		} catch (IOException e) {}
		
	}
	@RequestMapping("js/food_detail_js.do")
	public void foodDetailJs(HttpServletRequest request, HttpServletResponse response) {
		String fno=request.getParameter("fno");
		FoodVO vo=dao.foodDetailData(Integer.parseInt(fno));
		JSONObject obj=new JSONObject();
		obj.put("name", vo.getName());
		obj.put("poster", vo.getPoster());
		obj.put("phone", vo.getPhone());
		obj.put("address", vo.getAddr());
		obj.put("score", vo.getScore());
		obj.put("type", vo.getType());
		obj.put("theme", vo.getTheme());
		try {
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(obj.toJSONString());
		} catch (Exception e) {}
	}
}

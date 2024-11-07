package com.sist.model;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

public class FoodModel {
	private String[] strType = { "", "한식", "중식", "양식", "일식", "분식" };

	@RequestMapping("food/list.do")
	public String foodList(HttpServletRequest request, HttpServletResponse response) {

		return "list.jsp";
	}

	@RequestMapping("food/type.do")
	public String foodTypeList(HttpServletRequest request, HttpServletResponse rServletResponse) {
		String type = request.getParameter("type");
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		if (type == null)
			type = "1";
		int curPage = Integer.parseInt(page);
		List<FoodVO> list = FoodDAO.foodListData(curPage, strType[Integer.parseInt(type)]);
		int totalPage = FoodDAO.foodTotalPage(strType[Integer.parseInt(type)]);
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
		return "food.jsp";
	}

	@RequestMapping("food2/list.do")
	public String food2List(HttpServletRequest request, HttpServletResponse response) {
		return "list.jsp";
	}

	@RequestMapping("food2/food.do")
	public void food2TypeList(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		if (type == null)
			type = "1";
		int curPage = Integer.parseInt(page);
		List<FoodVO> list = FoodDAO.foodListData(curPage, strType[Integer.parseInt(type)]);
		int totalPage = FoodDAO.foodTotalPage(strType[Integer.parseInt(type)]);
		
		try {
			JSONArray arr=new JSONArray();
			int i=0;
			for(FoodVO vo:list) {
				JSONObject obj=new JSONObject();
				obj.put("fno", vo.getFno());
				obj.put("name", vo.getName());
				obj.put("poster", vo.getPoster());
				if(i==0) {
					obj.put("curPage", curPage);
					obj.put("totalPage", totalPage);
					obj.put("type", type);
				}
				arr.add(obj);
				i++;
			}
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(arr.toJSONString());
			} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

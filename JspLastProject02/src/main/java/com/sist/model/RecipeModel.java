package com.sist.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.RecipeDAO;
import com.sist.vo.ChefVO;
import com.sist.vo.RecipeDetailVO;
import com.sist.vo.RecipeVO;

public class RecipeModel {
	@RequestMapping("recipe/recipeList.do")
	public String recipeList(HttpServletRequest request, HttpServletResponse response) {

		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curPage = Integer.parseInt(page);
		int start = (curPage - 1) * 20 + 1;
		int end = start + 20 - 1;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		int count = RecipeDAO.recipeTotalCount();
		int totalPage = (int) (Math.ceil(count / 20.0));
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if (endPage > totalPage)
			endPage = totalPage;
		List<RecipeVO> list = RecipeDAO.recipeListData(map);
		System.out.println(list.size());
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("count", count);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../recipe/recipeList.jsp");

		return "../main/main.jsp";
	}

	@RequestMapping("recipe/recipeDetail.do")
	public String recipeDetail(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		RecipeDetailVO vo = RecipeDAO.recipeDetailData(Integer.parseInt(no));
		List<String> sList = new ArrayList<String>();
		List<String> iList = new ArrayList<String>();
		String[] temp = vo.getFoodmake().split("\n");
		for (String fn : temp) {
			StringTokenizer st = new StringTokenizer(fn, "^");
			sList.add(st.nextToken());
			iList.add(st.nextToken());
		}
		vo.setData(vo.getData().replaceAll("구매", ""));
		System.out.println(vo.getData());
		request.setAttribute("detail", vo);
		request.setAttribute("foodList", sList);
		request.setAttribute("imgList", iList);
		request.setAttribute("main_jsp", "../recipe/recipeDetail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("recipe/chefList.do")
	public String chefList(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		int start=(curPage-1)*50+1;
		int end=start+50-1;
		Map map =new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ChefVO> list= RecipeDAO.recipeChefListData(map);
		int totalPage=RecipeDAO.recipeChefTotalPage();
		
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("main_jsp", "../recipe/chefList.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("recipe/chefMake.do")
	public String chefMake(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String chef=request.getParameter("chef");
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		int start=(curPage-1)*20+1;
		int end=start+20-1;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("chef", chef);
		List<RecipeVO> list=RecipeDAO.chefMakeListData(map);
		int totalPage=RecipeDAO.chefMakeTotalPage(chef);
		
		request.setAttribute("chef", chef);
		request.setAttribute("curPage", curPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../recipe/chefMake.jsp");
		return "../main/main.jsp";
	}
}

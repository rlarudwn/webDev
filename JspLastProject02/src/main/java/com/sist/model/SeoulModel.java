package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.devtools.v85.fetch.model.RequestId;

import com.sist.commons.CommonsModel;
import com.sist.controller.RequestMapping;
import com.sist.dao.SeoulDAO;
import com.sist.vo.SeoulLocationVO;
import com.sist.vo.SeoulNatureVO;
import com.sist.vo.SeoulShopVO;

public class SeoulModel {
	@RequestMapping("seoul/location.do")
	public String seoulLocation(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curPage-1)*20+1);
		map.put("end", curPage*20);
		List<SeoulLocationVO> list=SeoulDAO.seoulLocationListData(map);
		int startPage=curPage/10*10+1;
		int endPage=startPage+10-1;
		System.out.println(startPage);
		System.out.println(endPage);
		int totalPage=SeoulDAO.seoulLocationTotalPage();
		if(endPage>totalPage)
			endPage=totalPage;
		System.out.println(totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../seoul/location.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("seoul/nature.do")
	public String seoulNature(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curPage-1)*20+1);
		map.put("end", curPage*20);
		List<SeoulNatureVO> list=SeoulDAO.seoulNatureListData(map);
		int startPage=curPage/10*10+1;
		int endPage=startPage+10-1;
		System.out.println(startPage);
		System.out.println(endPage);
		int totalPage=SeoulDAO.seoulNatureTotalPage();
		if(endPage>totalPage)
			endPage=totalPage;
		System.out.println(totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../seoul/nature.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
	@RequestMapping("seoul/shop.do")
	public String seoulShop(HttpServletRequest request, HttpServletResponse response) {
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curPage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curPage-1)*20+1);
		map.put("end", curPage*20);
		List<SeoulShopVO> list=SeoulDAO.seoulShopListData(map);
		int startPage=curPage/10*10+1;
		int endPage=startPage+10-1;
		System.out.println(startPage);
		System.out.println(endPage);
		int totalPage=SeoulDAO.seoulShopTotalPage();
		if(endPage>totalPage)
			endPage=totalPage;
		System.out.println(totalPage);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../seoul/shop.jsp");
		CommonsModel.footerPrint(request);
		return "../main/main.jsp";
	}
}

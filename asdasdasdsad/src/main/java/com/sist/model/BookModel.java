package com.sist.model;

import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;

import controller.RequestMapping;

public class BookModel {
	private String[] genres = { "", "가정 살림", "국어 외국어 사전", "건강 취미", "에세이", "청소년", "사회 정치", "초등참고서", "경제 경영", "역사", "어린이",
			"인문", "자연과학", "만화/라이트노벨", "유아", "대학교재", "자기계발", "예술", "IT 모바일", "소설/시/희곡", "종교", "수험서 자격증", "중고등참고서", "잡지",
			"여행", "인물", "전집", "ELT/사전", "유아/어린이", "인문 사회", "유아 어린이", "해외잡지", "ELT 사전", "예술 대중문화", "문학/소설", "경영/인문",
			"프랑스도서", "대학교재/전문서적", "문학 소설", "취미 라이프스타일", "컴퓨터" };

	@RequestMapping("book/list.do")
	public String book_list(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
		}

		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 20;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		String genre = request.getParameter("genre");
		String search = request.getParameter("search");

		if (genre == null)
			genre = "0";
		if (search == null)
			search = "";

		Map map = new HashMap();
		map.put("genre", genres[Integer.parseInt(genre)]);
		map.put("search", search);
		map.put("start", start);
		map.put("end", end);

		List<BookVO> hList = BookDAO.bookNewData(map);
		List<BookVO> bList = BookDAO.bookListData(map);
		int totalpage = BookDAO.bookFindTotalPage(map);

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			endPage = totalpage;

		Cookie[] cookies = request.getCookies();
		List<BookVO> cookieList = new ArrayList();
		if (cookies != null) {
			Map<String, BookVO> bookMap = new LinkedHashMap();
			for (int i = cookies.length - 1; i >= 0; i--) {
				if (cookies[i].getName().startsWith("book_")) {
					String bno = cookies[i].getValue();
					BookVO vo = BookDAO.bookDetailData(Integer.parseInt(bno));
					if (vo != null) {
						bookMap.put(bno, vo);
					}
				}
			}
			int count = 0;
			for (Map.Entry<String, BookVO> entry : bookMap.entrySet()) {
				if (count >= 4)
					break;
				cookieList.add(entry.getValue());
				count++;
			}
		}

		// 세션에 최근 본 도서 저장
		HttpSession session = request.getSession();
		session.setAttribute("recentBooks", cookieList);

		request.setAttribute("genres", genres);
		request.setAttribute("hList", hList);
		request.setAttribute("bList", bList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("search", search);
		request.setAttribute("genre", genre);
		request.setAttribute("cList", cookieList);

		int count = BookDAO.bookListCount(genres[Integer.parseInt(genre)]);
		request.setAttribute("count", count);

		request.setAttribute("main_jsp", "../book/list.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("book/detail.do")
	public String book_detail(HttpServletRequest request, HttpServletResponse response) {
		String bno = request.getParameter("bno");
		BookVO vo = BookDAO.bookDetailData(Integer.parseInt(bno));
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("book_" + bno)) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					break;
				}
			}
		}
		Cookie cookie = new Cookie("book_" + bno, bno);
		cookie.setMaxAge(60 * 60 * 24);
		cookie.setPath("/");
		response.addCookie(cookie);

		Map map = new HashMap();
		map.put("tno", bno);
		map.put("type", 2);
		int rcount = ReviewDAO.reviewCount(map);
		double avg = ReviewDAO.reviewAverage(map);
		request.setAttribute("rcount", rcount);
		request.setAttribute("avg", avg);
		request.setAttribute("id", id);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../book/detail.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("book/new.do")
	public String book_new(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 20;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<BookVO> nList = BookDAO.bookNewData(map);
		int totalpage = BookDAO.bookNewListCount();

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			endPage = totalpage;

		Cookie[] cookies = request.getCookies();
		List<BookVO> cookieList = new ArrayList();
		if (cookies != null) {
			Map<String, BookVO> bookMap = new LinkedHashMap();
			for (int i = cookies.length - 1; i >= 0; i--) {
				if (cookies[i].getName().startsWith("book_")) {
					String bno = cookies[i].getValue();
					BookVO vo = BookDAO.bookDetailData(Integer.parseInt(bno));
					if (vo != null) {
						bookMap.put(bno, vo);
					}
				}
			}
			int count = 0;
			for (Map.Entry<String, BookVO> entry : bookMap.entrySet()) {
				if (count >= 4)
					break;
				cookieList.add(entry.getValue());
				count++;
			}
		}

		HttpSession session = request.getSession();
		session.setAttribute("recentBooks", cookieList);

		request.setAttribute("nList", nList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		request.setAttribute("main_jsp", "../book/new.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("book/best.do")
	public String book_best(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		if (page == null)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 20;
		int start = (rowSize * curpage) - (rowSize - 1);
		int end = rowSize * curpage;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);

		List<BookVO> tList = BookDAO.bookBestData(map);
		int totalpage = BookDAO.bookBestListCount();

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		if (endPage > totalpage)
			endPage = totalpage;

		Cookie[] cookies = request.getCookies();
		List<BookVO> cookieList = new ArrayList();
		if (cookies != null) {
			Map<String, BookVO> bookMap = new LinkedHashMap();
			for (int i = cookies.length - 1; i >= 0; i--) {
				if (cookies[i].getName().startsWith("book_")) {
					String bno = cookies[i].getValue();
					BookVO vo = BookDAO.bookDetailData(Integer.parseInt(bno));
					if (vo != null) {
						bookMap.put(bno, vo);
					}
				}
			}
			int count = 0;
			for (Map.Entry<String, BookVO> entry : bookMap.entrySet()) {
				if (count >= 4)
					break;
				cookieList.add(entry.getValue());
				count++;
			}
		}

		HttpSession session = request.getSession();
		session.setAttribute("recentBooks", cookieList);

		request.setAttribute("tList", tList);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

		request.setAttribute("main_jsp", "../book/best.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("book/cookie.do")
	public String book_cookie(HttpServletRequest request, HttpServletResponse response) {
		String bno = request.getParameter("bno");

		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("book_" + bno)) {
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
					break;
				}
			}
		}

		Cookie cookie = new Cookie("book_" + bno, bno);
		cookie.setMaxAge(60 * 60 * 24);
		cookie.setPath("/");
		response.addCookie(cookie);

		return "redirect:../book/detail.do?bno=" + bno;
	}

	@RequestMapping("book/cart.do")
	public void addToCart(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
		}

		int tno = Integer.parseInt(request.getParameter("tno"));
		String price = request.getParameter("price");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int count = Integer.parseInt(request.getParameter("count"));
		int type = Integer.parseInt(request.getParameter("type"));

		Map map = new HashMap();
		map.put("tno", tno);
		map.put("price", price);
		map.put("id", id);
		map.put("count", count);
		map.put("type", type);

		BookDAO.insertCart(map);

	}

	@RequestMapping("book/recomm.do")
	public String book_recomm(HttpServletRequest request, HttpServletResponse response) {
	    try {
	        request.setCharacterEncoding("UTF-8");
	    } catch (Exception e) {}

	    String id = (String) request.getSession().getAttribute("id");

	    List<Integer> bnoList = BookDAO.getCartBnoList(id);
        Map map=new HashMap();
	    List<BookVO> cRList = BookDAO.cartRecomm(id, bnoList);
	    List<BookVO> bRList = BookDAO.buyRecomm(id, bnoList);
	    List<BookVO> rRList = BookDAO.randomRecomm(map);

	    // 쿠키 처리
	    Cookie[] cookies = request.getCookies();
	    List<BookVO> cookieList = new ArrayList();
	    if (cookies != null) {
	        Map<String, BookVO> bookMap = new LinkedHashMap();
	        for (int i = cookies.length - 1; i >= 0; i--) {
	            if (cookies[i].getName().startsWith("book_")) {
	                String bnoValue = cookies[i].getValue();
	                BookVO vo = BookDAO.bookDetailData(Integer.parseInt(bnoValue));
	                if (vo != null) {
	                    bookMap.put(bnoValue, vo);
	                }
	            }
	        }
	        int count = 0;
	        for (Map.Entry<String, BookVO> entry : bookMap.entrySet()) {
	            if (count >= 4) break;
	            cookieList.add(entry.getValue());
	            count++;
	        }
	    }

	    HttpSession session = request.getSession();
	    session.setAttribute("recentBooks", cookieList);

	    request.setAttribute("cRList", cRList);
	    request.setAttribute("bRList", bRList);
	    request.setAttribute("rRList", rRList);
	    request.setAttribute("main_jsp", "../book/recomm.jsp");
	    return "../main/main.jsp";
	}

}

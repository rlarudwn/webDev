package com.sist.model;

import com.sist.controller.RequestMapping;
import com.sist.dao.PokeDAO;
import com.sist.dao.PokeVO;
import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PokeModel {
	PokeDAO dao = PokeDAO.newInstance();

	@RequestMapping("poke/detail.do")
	public String pokeDetail(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String no = request.getParameter("no");
		PokeVO vo = this.dao.pokeDetailData(Integer.parseInt(no));
		boolean bCheck = this.dao.pokeIsLike(Integer.parseInt(no), id);
		request.setAttribute("check", bCheck);
		request.setAttribute("detail", vo);
		request.setAttribute("main_jsp", "../poke/detail.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("poke/list.do")
	public String pokeList(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException var10) {
		}

		String name = request.getParameter("name");
		if (name == null) {
			name = "";
		}

		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}

		int curPage = Integer.parseInt(page);
		int startPage = (curPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		int totalPage = this.dao.pokeTotalPage(name);
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		System.out.println(totalPage);
		List<PokeVO> list = this.dao.pokeListData(curPage, name);
		request.setAttribute("name", name);
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("main_jsp", "../poke/list.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("poke/find.do")
	public String pokeFind(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException var14) {
		}

		String mode = request.getParameter("mode");
		if (mode == null) {
			mode = "1";
		}

		String typeSql = "";
		String genSql = "";
		int startPage;
		int endPage;
		if (mode.equals("1")) {
			String[] type = request.getParameterValues("type");
			String[] gen = request.getParameterValues("gen");
			String s;
			String[] var11;
			if (type != null) {
				var11 = type;
				endPage = type.length;

				for (startPage = 0; startPage < endPage; ++startPage) {
					s = var11[startPage];
					typeSql = typeSql + s + "|";
				}

				if (typeSql.length() > 0) {
					typeSql = typeSql.substring(0, typeSql.length() - 1);
				}
			}

			if (gen != null) {
				var11 = gen;
				endPage = gen.length;

				for (startPage = 0; startPage < endPage; ++startPage) {
					s = var11[startPage];
					genSql = genSql + s + "|";
				}

				if (genSql.length() > 0) {
					genSql = genSql.substring(0, genSql.length() - 1);
				}
			}

			if (typeSql.length() == 0) {
				typeSql = ".*";
			}

			if (genSql.length() == 0) {
				genSql = ".*";
			}
		} else {
			typeSql = request.getParameter("type");
			genSql = request.getParameter("gen");
		}

		String name = request.getParameter("name");
		if (name == null) {
			name = "";
		}

		String page = request.getParameter("page");
		if (page == null) {
			page = "1";
		}

		int curPage = Integer.parseInt(page);
		startPage = (curPage - 1) / 10 * 10 + 1;
		endPage = startPage + 10 - 1;
		int totalPage = this.dao.pokeFindTotalPage(typeSql, genSql, name);
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		List<PokeVO> list = this.dao.pokeFindData(curPage, typeSql, genSql, name);
		String[] typeList = new String[] { "노말", "불꽃", "물", "풀", "전기", "얼음", "격투", "독", "땅", "비행", "에스퍼", "벌레", "바위", "고스트",
				"드래곤", "악", "강철", "페어리" };
		request.setAttribute("type", typeSql);
		request.setAttribute("gen", genSql);
		request.setAttribute("typeList", typeList);
		request.setAttribute("name", name);
		request.setAttribute("list", list);
		request.setAttribute("curPage", curPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("main_jsp", "../poke/find.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("poke/like.do")
	public String pokeLike(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String no = request.getParameter("no");
		String id = (String) session.getAttribute("id");
		this.dao.pokeLike(Integer.parseInt(no), id);
		return "redirect:../poke/detail.do?no=" + no;
	}

	@RequestMapping("poke/unlike.do")
	public String pokeUnLike(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String no = request.getParameter("no");
		String id = (String) session.getAttribute("id");
		this.dao.pokeUnLike(Integer.parseInt(no), id);
		return "redirect:../poke/detail.do?no=" + no;
	}
}
package com.sist.model;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import controller.RequestMapping;

import com.sist.dao.CartDAO;
import com.sist.dao.LikeDAO;
import com.sist.dao.MemberDAO;
import com.sist.dao.MusicDAO;
import com.sist.vo.*;

public class MyPageModel {
	private String[] liketype = { "", "", "영화", "도서", "음악" }; // 배열 이름 변경
	private String[] carttype = {"", "", "도서"," 음악"};
	@RequestMapping("mypage/mypage_main.do")
	public String mypage_main(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String nickname = (String) session.getAttribute("nickname");
		String name = (String) session.getAttribute("name");
		String bday = (String) session.getAttribute("bday");
		String email = (String) session.getAttribute("email");
		String post = (String) session.getAttribute("post");
		String addr1 = (String) session.getAttribute("addr1");
		String addr2 = (String) session.getAttribute("addr2");

		session.setAttribute("id", id);
		session.setAttribute("nickname", nickname);
		session.setAttribute("name", name);
		session.setAttribute("bday", bday);
		session.setAttribute("email", email);
		session.setAttribute("post", post);
		session.setAttribute("addr1", addr1);
		session.setAttribute("addr2", addr2);

		request.setAttribute("title", "마이페이지 홈");
		request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("mypage/my_cart.do")
	public String my_cart(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("check");

		try {
			String page = request.getParameter("page");
			if (page == null)
				page = "1";

			// 변수 이름 변경
			String tlikeIndexStr = request.getParameter("tcart");
			if (tlikeIndexStr == null)
				tlikeIndexStr = "1";

			int tcart = Integer.parseInt(tlikeIndexStr); // 문자열을 정수로 변환
			String selectedcart = carttype[tcart]; // 배열 인덱스를 사용하여 값 선택

//			int curPage = Integer.parseInt(page);
//			int rowSize = 50;
//			int start = (curPage - 1) * rowSize + 1;
//			int end = start + rowSize - 1;

			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			String type = (String) session.getAttribute("tcart");

			Map map = new HashMap();
//			map.put("start", start);
//			map.put("end", end);
			map.put("tcart", selectedcart); // 배열에서 선택한 값 사용
			map.put("id", id);
//       map.put("type", type);

			/*List<CartVO> allcart = CartDAO.allcartListData(map);
			List<CartVO> bocart = CartDAO.bocartListData(map);
			List<CartVO> ascart = CartDAO.ascartListData(map);*/


//       LikeDAO.likecancel(Integer.parseInt("tno"));

//			int totalPage = LikeDAO.likeTotalPage(selectedTlike); // 배열에서 선택한 값 사용
//			int startPage = (curPage - 1) / 10 * 10 + 1;
//			int endPage = startPage + 10 - 1;

			System.out.println(tlikeIndexStr + "str");
			System.out.println(tcart + "tcart");

			/*if (tcart == 1) {
				request.setAttribute("allcart", allcart);
			} else if (tcart == 2) {
				request.setAttribute("bocart", bocart);
			} else if (tcart == 3) {
				request.setAttribute("ascart", ascart);
			} */

			request.setAttribute("tlike", tlikeIndexStr); // 배열에서 선택한 값 사용
//			request.setAttribute("curPage", curPage);
//			request.setAttribute("startPage", startPage);
//			request.setAttribute("endPage", endPage);
//			request.setAttribute("totalPage", totalPage);

			request.setAttribute("title", "장바구니");
			request.setAttribute("mypage_jsp", "../mypage/my_cart.jsp");
			request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "../main/main.jsp";
	}

	@RequestMapping("mypage/my_change_pwd.do")
	public String my_change_pwd(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("title", "비밀번호 변경");
		request.setAttribute("mypage_jsp", "../mypage/my_change_pwd.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("mypage/my_change_pwd_ok.do")
	public String my_change_pwd_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace(); // Exception 처리 개선
		}

		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		System.out.println(oldpwd + "mo old");
		System.out.println(newpwd + "mo new");
		System.out.println(id + "mo id");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", newpwd);
		map.put("oldpwd", oldpwd);

		boolean bCheck = MemberDAO.changePwd(map);
		request.setAttribute("result", bCheck);

		return "../mypage/my_change_pwd_ok.jsp";
	}

	@RequestMapping("mypage/my_edit_member_ok.do")
	public String mypage_join_update_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {
			ex.printStackTrace(); // Exception 처리 개선
		}

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String nickname = request.getParameter("nickname");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String birthdayStr = request.getParameter("birthday");
		String post = request.getParameter("post");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String email = request.getParameter("email");
		String msg = request.getParameter("msg");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");

		Date birthday = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (birthdayStr != null && !birthdayStr.isEmpty()) {
				birthday = sdf.parse(birthdayStr);
			}
		} catch (Exception e) {
			e.printStackTrace(); // 날짜 파싱 예외 처리
		}

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setNickname(nickname);
		vo.setSex(sex);
		vo.setEmail(email);
		vo.setBirthdate(birthday);
		vo.setPost(post);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setMsg(msg);
		vo.setPhone(phone1 + ")" + phone2);

		boolean bCheck = MemberDAO.memberUpdate(vo);

		// 세션 업데이트
		if (bCheck) {
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			session.setAttribute("nickname", nickname);
			session.setAttribute("name", name);
			session.setAttribute("sex", sex);
			session.setAttribute("bday", birthdayStr); // 날짜는 문자열로 저장
			session.setAttribute("email", email);
			session.setAttribute("post", post);
			session.setAttribute("addr1", addr1);
			session.setAttribute("addr2", addr2);
			session.setAttribute("phone", phone1 + ")" + phone2);
		}

		request.setAttribute("result", bCheck);

		return "../mypage/my_edit_member_ok.jsp";
	}

	@RequestMapping("mypage/my_edit_member.do")
	public String my_edit_member(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		MemberVO vo = MemberDAO.memberUpdateData(id);

		String phone = vo.getPhone();
		phone = phone.substring(phone.indexOf(")") + 1);
		vo.setPhone(phone);
		request.setAttribute("vo", vo);
		request.setAttribute("title", "회원 정보 수정");
		request.setAttribute("mypage_jsp", "../mypage/my_edit_member.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("mypage/my_like.do")
	public String likeList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("check");

		try {
			String page = request.getParameter("page");
			if (page == null)
				page = "1";

			// 변수 이름 변경
			String tlikeIndexStr = request.getParameter("tlike");
			if (tlikeIndexStr == null)
				tlikeIndexStr = "1";

			int tlike = Integer.parseInt(tlikeIndexStr); // 문자열을 정수로 변환
			String selectedTlike = liketype[tlike]; // 배열 인덱스를 사용하여 값 선택

			int curPage = Integer.parseInt(page);
			int rowSize = 50;
			int start = (curPage - 1) * rowSize + 1;
			int end = start + rowSize - 1;

			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			String type = (String) session.getAttribute("tlike");

			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			map.put("tlike", selectedTlike); // 배열에서 선택한 값 사용
			map.put("id", id);
//       map.put("type", type);

			List<LikeVO> mulike = LikeDAO.mulikeListData(map);
			List<LikeVO> molike = LikeDAO.molikeListData(map);
			List<LikeVO> bolike = LikeDAO.bolikeListData(map);
			List<LikeVO> allike = LikeDAO.allikeListData(map);

//       LikeDAO.likecancel(Integer.parseInt("tno"));

			int totalPage = LikeDAO.likeTotalPage(selectedTlike); // 배열에서 선택한 값 사용
			int startPage = (curPage - 1) / 10 * 10 + 1;
			int endPage = startPage + 10 - 1;

			System.out.println(mulike + "model mulike");
			System.out.println(tlikeIndexStr + "str");
			System.out.println(tlike + "tlike");

			if (tlike == 1) {
				request.setAttribute("allike", allike);
			} else if (tlike == 2) {
				request.setAttribute("molike", molike);
			} else if (tlike == 3) {
				request.setAttribute("bolike", bolike);
			} else if (tlike == 4) {
				request.setAttribute("mulike", mulike);
			}

			request.setAttribute("tlike", tlikeIndexStr); // 배열에서 선택한 값 사용
			request.setAttribute("curPage", curPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("totalPage", totalPage);

			request.setAttribute("title", "좋아요");
			request.setAttribute("mypage_jsp", "../mypage/my_like.jsp");
			request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "../main/main.jsp";
	}

	@RequestMapping("mypage/my_member_exit.do")
	public String my_member_exit(HttpServletRequest request, HttpServletResponse response) {
//	   HttpSession session = request.getSession();
//	   String id=(String)session.getAttribute("id");
//	   
//	   String pwd =request.getParameter("pwdjsp");
//	   Map map=new HashMap();
//	   map.put("id", id);
//	   map.put("pwdjsp", pwd);
//	   
//	   System.out.println(id+pwd+" mo.do");
//
//	   MemberDAO.deleteMember(id, pwd);

		request.setAttribute("title", "회원 탈퇴");
		request.setAttribute("mypage_jsp", "../mypage/my_member_exit.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("mypage/my_member_exit_ok.do")
	public String my_member_exit_ok(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String pwd = request.getParameter("pwdjsp");

		System.out.println("id:" + id + "  pwd:" + pwd + "  mo_ok.do");
		Map map = new HashMap();
		map.put("id", id);
		map.put("pwdjsp", pwd);

//	   MemberDAO.deleteMember(id, pwd);	   

		boolean bCheck = MemberDAO.deleteMember(id, pwd);

		session.invalidate();

		request.setAttribute("result", bCheck);
		request.setAttribute("title", "회원 탈퇴");

		return "../mypage/my_member_exit_ok.jsp";
	}

	@RequestMapping("mypage/my_playlist.do")
	public String my_playlist(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		List<PlayListVO> list = MusicDAO.playListListData(id);
		request.setAttribute("list", list);
		request.setAttribute("title", "플레이 리스트");
		request.setAttribute("mypage_jsp", "../mypage/myPlayList.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("mypage/myPlayListDetail.do")
	public String myPlayListDetail(HttpServletRequest request, HttpServletResponse response) {
		String plno = request.getParameter("plno");
		request.setAttribute("plno", plno);
		request.setAttribute("title", "플레이 리스트");
		request.setAttribute("mypage_jsp", "../mypage/myPlayListDetail.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("mypage/myPlayListMusicList.do")
	public void myPlayListMusicList(HttpServletRequest request, HttpServletResponse response) {
		try {
			String plno = request.getParameter("plno");
			String type = request.getParameter("type");
			System.out.println(plno);
			System.out.println(type);
			List<MusicVO> list = MusicDAO.playListMusicList(Integer.parseInt(plno), Integer.parseInt(type));
			JSONArray arr = new JSONArray();
			for (MusicVO vo : list) {
				JSONObject obj = new JSONObject();
				obj.put("mno", vo.getMno());
				obj.put("title", vo.getTitle());
				obj.put("poster", vo.getPoster());
				obj.put("urlmp3", vo.getUrlmp3());
				obj.put("aname", vo.getAname());
				obj.put("altitle", vo.getAltitle());
				obj.put("size", list.size());
				arr.add(obj);
			}
			System.out.println(arr.toString());
			response.setContentType("text/plain;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write(arr.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("mypage/myPlayListDelete.do")
	public String myPlayListDelete(HttpServletRequest request, HttpServletResponse response) {
		String plno = request.getParameter("plno");
		MusicDAO.playListDelete(Integer.parseInt(plno));
		return "redirect:../mypage/my_playlist.do";
	}

	@RequestMapping("mypage/myPlayListMake.do")
	public String myPlayListMake(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
		}
		String plname = request.getParameter("plname");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		Map map = new HashMap();
		map.put("id", id);
		map.put("plname", plname);
		MusicDAO.playListInsert(map);
		return "redirect:../mypage/my_playlist.do";
	}

	@RequestMapping("mypage/my_reserve.do")
	public String my_reserve(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("title", "나의 예약");
		request.setAttribute("mypage_jsp", "../mypage/my_reserve.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("mypage/my_text.do")
	public String my_text(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("title", "내가 쓴 글");
		request.setAttribute("mypage_jsp", "../mypage/my_text.jsp");
		request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
		return "../main/main.jsp";
	}

}
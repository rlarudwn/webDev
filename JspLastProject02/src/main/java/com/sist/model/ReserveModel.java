package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;
import com.sist.vo.ReserveVO;

import java.util.*;
import java.io.PrintWriter;
import java.text.*;

public class ReserveModel {
	@RequestMapping("reserve/main.do") // if과 동일한 역할
	public String reserve_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../reserve/main.jsp");
		return "../main/main.jsp";
	}

	@RequestMapping("reserve/dateInfo.do")
	public String date_info(HttpServletRequest request, HttpServletResponse response) {
		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");
		String strDay = "";

		String strFno = request.getParameter("fno");

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		String today = sdf.format(date);
		StringTokenizer st = new StringTokenizer(today, "-");

		String sy = st.nextToken();
		String sm = st.nextToken();
		strDay = st.nextToken();
		/////////////////// 오늘 날짜만 저장
		String tday = strDay;
		String tyear = sy;
		String tmonth = sm;
		///////////////////
		if (strYear == null) {
			strYear = sy;
		}
		if (strMonth == null) {
			strMonth = sm;
		}

		int year = Integer.parseInt(strYear);
		int month = Integer.parseInt(strMonth);
		int day = Integer.parseInt(strDay);

		// 요일 구하기 / 마지막 날
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DATE, 1);

		int week = cal.get(Calendar.DAY_OF_WEEK);
		week = week - 1;

		int lastday = cal.getActualMaximum(Calendar.DATE);

		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		request.setAttribute("week", week);
		request.setAttribute("lastday", lastday);
		request.setAttribute("fno", strFno);

		// 예약 가능한 날 => 1,2,3,19,20....
		if (strFno != null) {
			String rdays = FoodDAO.foodReserveDateData(Integer.parseInt(strFno));
			int[] reserveDays = new int[32];
			if (month == Integer.parseInt(tmonth) && year == Integer.parseInt(tyear)) {
				st = new StringTokenizer(rdays, ",");

				while (st.hasMoreTokens()) {
					int d = Integer.parseInt(st.nextToken());
					if (d >= day) {
						reserveDays[d] = 1;
					}
				}
			} else {
				st = new StringTokenizer(rdays, ",");
				while (st.hasMoreTokens()) {
					int d = Integer.parseInt(st.nextToken());
					reserveDays[d] = 1;

				}
			}

			request.setAttribute("rday", reserveDays);
		}

		String[] weeks = { "일", "월", "화", "수", "목", "금", "토" };
		request.setAttribute("weeks", weeks);
		return "../reserve/dateInfo.jsp";
	}

	@RequestMapping("reserve/foodInfo.do")
	public String reserve_food_type(HttpServletRequest request, HttpServletResponse response) {
		String type=request.getParameter("type");
	  if(type==null)
		  type="한식";
	  List<FoodVO> list=FoodDAO.foodTypeData(type);
	  request.setAttribute("fList", list);
		return "../reserve/foodInfo.jsp";
	}

	@RequestMapping("reserve/timeInfo.do")
	public String reserveTimeInfo(HttpServletRequest request, HttpServletResponse response) {
		 String day=request.getParameter("day");
		  // 데이터베이스 연동 
		  String times=FoodDAO.foodReserveTimeData(Integer.parseInt(day));
		  List<String> tList=new ArrayList<String>();
		  StringTokenizer st=new StringTokenizer(times,",");
		  while(st.hasMoreTokens())
		  {
			  String time=FoodDAO.foodTimeSelectData(Integer.parseInt(st.nextToken()));
			  tList.add(time);
		  }
		  request.setAttribute("tList", tList);
		return "../reserve/timeInfo.jsp";
	}

	@RequestMapping("reserve/inwonInfo.do")
	public String reserveInwonInfo(HttpServletRequest request, HttpServletResponse response) {
		return "../reserve/inwon.jsp";
	}
	@RequestMapping("mypage/mypageReserve.do")
  public String mypage_reserve(HttpServletRequest request,HttpServletResponse response)
  {
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  
	  List<ReserveVO> list=FoodDAO.reserveMyPageData(id);
	  request.setAttribute("recvList", list);
	  request.setAttribute("mypage_jsp", "../mypage/myPageReserve.jsp");
	  request.setAttribute("main_jsp", "../mypage/myPageMain.jsp");
	  return "../main/main.jsp";
  }
	@RequestMapping("reserve/reserveOk.do")
  public String reserve_ok(HttpServletRequest request,HttpServletResponse response)
  {
	  // 예약정보 
	  try
	  {
		  request.setCharacterEncoding("UTF-8");
	  }catch(Exception ex) {}
	  String fno=request.getParameter("fno");
	  String date=request.getParameter("date");
	  String time=request.getParameter("time");
	  String inwon=request.getParameter("inwon");
	  
	  System.out.println("맛집 번호:"+fno);
	  System.out.println("예약일:"+date);
	  System.out.println("예약시간:"+time);
	  System.out.println("인원:"+inwon);
	  
	  HttpSession session=request.getSession();
	  String id=(String)session.getAttribute("id");
	  
	  ReserveVO vo=new ReserveVO();
	  vo.setFno(Integer.parseInt(fno));
	  vo.setId(id);
	  vo.setInwon(inwon);
	  vo.setTime(time);
	  vo.setDay(date);
	  
	  FoodDAO.reserveInsert(vo);
	  
	  return "redirect:../mypage/mypageReserve.do";
  }
	@RequestMapping("admin/adminPageReserve.do")
	public String adminPageReserve(HttpServletRequest request, HttpServletResponse response) {
		List<ReserveVO> recvList=FoodDAO.reserveAdminPageData();
		request.setAttribute("recvList", recvList);
		request.setAttribute("admin_jsp", "../admin/adminPageReserve.jsp");
		request.setAttribute("main_jsp", "../admin/adminPageMain.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/adminPageReserveOk.do")
	public String adminPageReserveOk(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rno");
		FoodDAO.reserveOk(Integer.parseInt(rno));
		return "redirect:../admin/adminPageReserve.do";
	}
	@RequestMapping("mypage/mypageReserveCancle.do")
	public String mypageReserveCancle(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rno");
		FoodDAO.reserveCancel(Integer.parseInt(rno));
		return "redirect:../mypage/mypageReserve.do";
	}
	@RequestMapping("mypage/myPageReserveInfo.do")
	public void myPageReserveInfo(HttpServletRequest request, HttpServletResponse response) {
		String rno=request.getParameter("rno");
		ReserveVO vo=FoodDAO.myPageReserveInfoData(Integer.parseInt(rno));
		JSONObject obj=new JSONObject();
		obj.put("rno", vo.getRno());
		obj.put("day", vo.getDay());
		obj.put("time", vo.getTime());
		obj.put("inwon", vo.getInwon());
		obj.put("name", vo.getFvo().getName());
		obj.put("poster", "https://www.menupan.com/"+vo.getFvo().getPoster());
		obj.put("address", vo.getFvo().getAddress());
		obj.put("phone", vo.getFvo().getPhone());
		obj.put("theme", vo.getFvo().getTheme());
		obj.put("score", vo.getFvo().getScore());
		obj.put("dbday", vo.getDbday());
		obj.put("content", vo.getFvo().getContent());
		try {
			response.setContentType("text.plain;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(obj.toJSONString());
		} catch (Exception e) {}
	}
}
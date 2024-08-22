package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.openqa.selenium.grid.data.Session;

import com.sist.vo.FoodVO;
import com.sist.vo.ReserveVO;

public class FoodDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static List<FoodVO> foodTopHitData() {
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("foodTopHitData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static List<FoodVO> foodTopLikeData() {
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("foodTopLikeData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static List<FoodVO> foodTopJjimData() {
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("foodTopJjimData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int foodListCount() {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("foodListCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static List<FoodVO> foodListData(Map map) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("foodListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static FoodVO foodDetailData(int fno) {
		FoodVO vo = new FoodVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("foodHitIncrement", fno);
			session.commit();
			vo = session.selectOne("foodDetailData", fno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;

	}

	public static List<FoodVO> foodFindListData(Map map) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("foodFindListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int foodFindTotalPage(String ss) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("foodFindTotalPage", ss);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}

	public static List<FoodVO> foodNearListData(String ss) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("foodNearListData", ss);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static List<FoodVO> foodTypeData(String type) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("foodTypeData", type);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static String foodTimeSelectData(int tno) {
		String times = "";
		SqlSession session = null; // Connection
		try {
			session = ssf.openSession();
			times = session.selectOne("foodTimeSelectData", tno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return times;
	}
	

	public static String foodReserveDateData(int fno) {
		String rdays = "";
		SqlSession session = null;
		try {
			session = ssf.openSession();
			rdays = session.selectOne("foodReserveDateData", fno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return rdays;
	}

	public static String foodReserveTimeData(int dno) {
		String time = "";
		SqlSession session = null;
		try {
			session = ssf.openSession();
			time = session.selectOne("foodReserveTimeData", dno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return time;
	}

	public static void reserveInsert(ReserveVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("reserveInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static List<ReserveVO> reserveMyPageData(String id) {
		List<ReserveVO> list = new ArrayList<ReserveVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("reserveMyPageData", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static List<ReserveVO> reserveAdminPageData() {
		List<ReserveVO> list = new ArrayList<ReserveVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("reserveAdminPageData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static void reserveOk(int rno) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("reserveOk", rno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	public static void reserveCancel(int rno) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("reserveCancel", rno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	public static ReserveVO myPageReserveInfoData(int rno) {
		ReserveVO vo=new ReserveVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo=session.selectOne("myPageReserveInfoData", rno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

}

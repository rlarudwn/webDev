package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.CartVO;

public class CartDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static void cartInsert(CartVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("cartInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static List<CartVO> cartListData(String id) {
		List<CartVO> list = new ArrayList<CartVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("cartListData", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}

		return list;
	}

	public static int cartGetGnoCount(Map map) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("cartGetGnoData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static int cartGetCno(Map map) {
		int cno = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			cno = session.selectOne("cartGetCno", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return cno;
	}

	public static void cartGnoUpdate(Map map) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("cartGnoUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static List<CartVO> buyListData(String id) {
		List<CartVO> list = new ArrayList<CartVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("buyListData", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int buyTotalPrice(String id) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("buyTotalPrice", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}

	public static void cartCancel(int cno) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("cartCancel", cno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void cartUpdate(int cno) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("cartBuyUpdate", cno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
}

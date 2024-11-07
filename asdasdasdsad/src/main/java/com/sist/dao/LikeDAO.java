package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class LikeDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static int likeOn(Map map) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.insert("likeOn", map);
			session.update("likeCountIncrement", map);
			session.commit();
			count = session.selectOne("likeCount", map);
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static int likeOff(Map map) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.insert("likeOff", map);
			session.update("likeCountDecrement", map);
			session.commit();
			count = session.selectOne("likeCount", map);
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	public static void likeIncrement(Map map) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("likeCountIncrement", map);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	public static void likeDecrement(Map map) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("likeCountDecrement", map);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	public static int likeCheck(Map map) {
		int count=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("likeCheck", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	public static int likeTotalPage(String tlike) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("likeTotalPage", tlike);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	public static List<LikeVO> likeListData(Map map) {
		List<LikeVO> list = new ArrayList<LikeVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("likeListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	
	public static List<LikeVO> mulikeListData(Map map){
		List<LikeVO> mulike = new ArrayList<LikeVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			mulike = session.selectList("mulikeListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println(mulike+"dao mulike");
		return mulike; 

	}
	public static List<LikeVO> molikeListData(Map map){
		List<LikeVO> molike = new ArrayList<LikeVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			molike = session.selectList("molikeListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println(molike+"dao molike");
		return molike; 
		
	}
	public static List<LikeVO> bolikeListData(Map map){
		List<LikeVO> bolike = new ArrayList<LikeVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			bolike = session.selectList("bolikeListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println(bolike+"dao bolike");
		return bolike; 
	}
	
	public static List<LikeVO> allikeListData(Map map){
		List<LikeVO> allike = new ArrayList<LikeVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			allike = session.selectList("allikeListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println(allike+"dao allike");
		return allike; 
		
	}
//	public static void likecancel(int tno) {
//		SqlSession session = null;
//		try {
//			session = ssf.openSession();
//			session.delete("likecancel", tno);
//			session.commit();
//		} catch (Exception e) {
//		} finally {
//			if (session != null)
//				session.close();
//		}
//	}
	
	
}


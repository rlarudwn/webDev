package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.AllJjimVO;

public class AllJjimDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static void allJjimInsert(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.insert("allJjimInsert", map);
			System.out.println("check");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!= null)
				session.close();
		}
	}
	public static int allJjimCheck(Map map) {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("allJjimCheck", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!= null)
				session.close();
		}
		return total;
	}
	public static void allJjimIncrement(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("allJjimIncrement", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!= null)
				session.close();
		}
	}
	public static List<AllJjimVO> jjimMyPageListData(String id){
		List<AllJjimVO> list=new ArrayList<AllJjimVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("jjimMyPageListData", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!= null)
				session.close();
		}
		return list;
	}
}

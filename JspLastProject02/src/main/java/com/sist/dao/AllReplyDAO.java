package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.AllReplyVO;

public class AllReplyDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static void allReplyInsert(AllReplyVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.insert("allReplyInsert", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	public static List<AllReplyVO> allReplyListData(Map map){
		List<AllReplyVO> list=new ArrayList<AllReplyVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("allReplyListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static void allReplyDelete(int rno){
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.delete("allReplyDelete", rno);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	public static void allReplyUpdate(Map map) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("allReplyUpdate", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
}

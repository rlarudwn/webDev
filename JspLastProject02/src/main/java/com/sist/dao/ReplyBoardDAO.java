package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.ReplyBoardVO;

public class ReplyBoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<ReplyBoardVO> replyBoardListData(Map map){
		List<ReplyBoardVO> list=new ArrayList<ReplyBoardVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("replyBoardListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static void replyBoardInsert(ReplyBoardVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("replyBoardInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	public static int replyBoardRowCount() {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			total=session.selectOne("replyBoardRowCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	public static List<ReplyBoardVO> adminReplyBoardListData(Map map){
		List<ReplyBoardVO> list=new ArrayList<ReplyBoardVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("adminReplyBoardListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static void adminReplyBoardInsert(int no, ReplyBoardVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.insert("adminReplyBoardInsert", vo);
			session.update("adminReplyUpdate", no);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	public static ReplyBoardVO adminReplyInfoData(int no) {
		ReplyBoardVO vo=new ReplyBoardVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("adminReplyInfoData", no);
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	public static void adminReplyDelete(int no) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("daminReplyDelete", no);
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
}

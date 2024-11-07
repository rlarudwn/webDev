package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;


public class ReplyBoardDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	/////////////////////////// 1:1 문의 리스트 ////////////////////////
	public static List<ReplyBoardVO> replyBoardListData(Map map)
	{
		List<ReplyBoardVO> list = new ArrayList<ReplyBoardVO>();
		SqlSession session=null;
		try
		{
			session = ssf.openSession();
			list = session.selectList("replyBoardListData",map);
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	/////////////////////////// 1:1 문의 쓰기 ////////////////////////
	public static void replyBoardInsert(ReplyBoardVO vo)
	{
		SqlSession session = null;
		try
		{
			session=ssf.openSession(true);
			session.insert("replyBoardInsert",vo);			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	
	/////////////////////////// 1:1 문의 RowCount ////////////////////////
	public static int replyBoardRowCount()
	{
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("replyBoardRowCount");
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	////////////////////////// 1:1문의 리스트(admin) ///////////////////////////
	public static List<ReplyBoardVO> adminReplyBoardListData(Map map)
	{
		List<ReplyBoardVO> list = new ArrayList<ReplyBoardVO>();
		SqlSession session = null;
		try {
			session=ssf.openSession();
			list=session.selectList("adminReplyBoardListData",map);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	 
	//////////////////////// admin 응답 ///////////////////////////
	public static void adminReplyBoardInsert(int no,ReplyBoardVO vo)
	{
		SqlSession session = null;
		try
		{
			session=ssf.openSession();
			session.insert("adminReplyBoardInsert",vo);
			session.update("adminReplyUpdate",no);
			session.commit();
			
		}
		catch(Exception ex)
		{
			session.rollback();
			ex.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	
	///////////////////////// admin /////////////////////////////
	public static ReplyBoardVO adminReplyInfoData(int no)
	  {
		  ReplyBoardVO vo = new ReplyBoardVO();
		  SqlSession session = null;
		  try
		  {
			  session = ssf.openSession(true);
			  vo = session.selectOne("adminReplyInfoData",no);
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session != null)
				  session.close();
		  }
		  return vo;
	  }
	
	//////////////////////////1:1 응답 삭제 => 미구현예정 ///////////////////////////	
	public static void adminReplyDelete(int no,int group_id)
	  {
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  session.delete("adminReplyDelete",group_id);
			  session.update("adminReplyUpdate2",no);
			  session.commit();
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null)
				  session.close();
		  }
	  }
	
	
}

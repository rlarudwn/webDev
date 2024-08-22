package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.NoticeVO;

public class NoticeDAO {
	
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<NoticeVO> noticeListData(Map map){
		List<NoticeVO> list=new ArrayList<NoticeVO>();
		System.out.println(map.get("start"));
		System.out.println(map.get("end"));
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("noticeListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static void noticeInsert(NoticeVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("noticeInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	public static int noticeRowCount() {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("noticeRowCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	public static List<NoticeVO> noticeTop5Data(){
		List<NoticeVO> list=new ArrayList();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("noticeTop5Data");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	public static NoticeVO noticeUpdateData(int no) {
		NoticeVO vo=new NoticeVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("noticeDetailData", no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	public static void noticeUpdate(NoticeVO vo) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("noticeUpdate", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	public static void noticeDelete(int no) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.delete("noticeDelete", no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
	}
	public static NoticeVO noticeDetailData(int no) {
		NoticeVO vo=new NoticeVO();
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("noticeHitIncrement", no);
			vo=session.selectOne("noticeDetailData", no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
}

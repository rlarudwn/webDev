package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.BoardVO;

public class BoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static void boardInsert(BoardVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.insert("boardInsert", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	public static List<BoardVO> boardListData(Map map){
		List<BoardVO> list=new ArrayList<BoardVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			System.out.println(map.get("start")); 
			System.out.println(map.get("end")); 
			list=session.selectList("boardListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		System.out.println(list.size());
		return list;
	}
	public static int boardRowCount() {
		int count=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count=session.selectOne("boardRowCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}
	public static BoardVO boardDetailData(int no) {
		BoardVO vo=new BoardVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("boardHitIncrement", no);
			session.commit();
			vo=session.selectOne("boardDetailData", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	public static BoardVO boardUpdateData(int no) {
		BoardVO vo=new BoardVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo=session.selectOne("boardDetailData", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
	public static String boardUpdate(BoardVO vo) {
		String result="";
		return result;
	}
}
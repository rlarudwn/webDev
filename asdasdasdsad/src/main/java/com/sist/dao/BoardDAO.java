package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.BoardVO;
import com.sist.vo.ReplyVO;

public class BoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static List<BoardVO> boardListData(Map map) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("boardListData", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static List<BoardVO> boardFindListData(Map map) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("boardFindListData", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int boardTotalCount(String type) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			total = session.selectOne("boardTotalCount", type);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}

	public static int boardFindTotalCount(Map map) {
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			total = session.selectOne("boardFindTotalCount", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}

	public static void boardInsert(BoardVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("boardInsert", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static BoardVO boardDetailData(int fbno) {
		BoardVO vo = new BoardVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("boardHitIncrement", fbno);
			vo = session.selectOne("boardDetailData", fbno);
			session.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	public static int boardReplyCount(int fbno) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("boardReplyCount", fbno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static void replyInsert(ReplyVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("replyInsert", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static void reReplyInsert(ReplyVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("reReplyInsert", vo);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static List<ReplyVO> replyList(int fbno) {
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("replyList", fbno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int replyCheck(int root) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("replyCheck", root);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static int replyCount(int fbno) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("replyCount", fbno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static void replyDelete(int frno) {
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.delete("replyDelete", frno);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
	public static void boardDelete(int fbno) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.delete("boardDelete", fbno);
			session.delete("boardReplyDeleteAll", fbno);
			session.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}
}

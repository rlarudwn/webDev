package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<BoardVO> boardListData(int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		Map map=new HashMap();
		int row = 10;
		int start = (page - 1) * row + 1;
		int end=start+row-1;
		map.put("start", start);
		map.put("end", end);
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("boardListData", map);
		} catch (Exception e) {
		} finally {
			session.close();
		}
		return list;
	}
	public static int boardRowCount() {
		SqlSession session=ssf.openSession();
		int rowcount=session.selectOne("boardRowCount");
		session.close();
		return rowcount;
	}
	public static void boardInsert(BoardVO vo) {
		SqlSession session=ssf.openSession();
		try {
			session.insert("boardInsert", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
	}
	public static BoardVO boardDetailData(int no) {
		SqlSession session=ssf.openSession();
		session.update("boardHitIncrement", no);
		session.commit();
		BoardVO vo=session.selectOne("boardDetailData", no);
		session.close();
		return vo;
	}
	public static boolean boardDelete(int no, String pwd) {
		boolean bCheck=false;
		SqlSession session=ssf.openSession();
		String pwd_temp=session.selectOne("boardGetPwd", no);
		if(pwd_temp.equals(pwd)) {
			bCheck=true;
			session.delete("boardDelete", no);
			session.commit();
		}
		session.close();
		return bCheck;
	}
	public static BoardVO boardUpdateData(int no) {
		SqlSession session=ssf.openSession();
		BoardVO vo=session.selectOne("boardDetailData", no);
		session.close();
		return vo;
	}
	/*
	<insert id="boardInsert" parameterType="BoardVO">
 INSERT INTO board VALUES(
 	board_noseq.nextval, #{name}, #{subject}, #{content}, #{pwd}, sysdate, 0
 )
 </insert>
	 */
}

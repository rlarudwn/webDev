package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.AlbumVO;
import com.sist.vo.MusicVO;

public class MusicDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static List<MusicVO> musicListData(Map map) {
		List<MusicVO> list = new ArrayList<MusicVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("musicListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static int musicTotalPage(String genre) {
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("musicTotalPage", genre);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	public static List<AlbumVO> albumListData(Map map){
		List<AlbumVO> list = new ArrayList<AlbumVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("albumListData", map);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}
	public static int albumTotalPage(String genre) {
		int total=0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("albumTotalPage", genre);
		} catch (Exception e) {
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
}

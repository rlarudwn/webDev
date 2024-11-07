package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.MusicVO;

public class MusicDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static List<MusicVO> musicListData(Map map){
		List<MusicVO> list=new ArrayList<MusicVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("musicListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int musicTotalPage(){
		int page=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			page=session.selectOne("musicTotalPage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return page;
	}
	public static MusicVO musicDetailData(int mno){
		List<MusicVO> list=new ArrayList<MusicVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("musicListData", mno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list.get(0);
	}
}

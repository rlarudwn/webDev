package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.GoodsVO;
import com.sist.vo.MusicVO;

public class GoodsDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	public static List<GoodsVO> goodsListData(Map map){
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("goodsListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int goodsTotalPage() {
		int page=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			page=session.selectOne("goodsTotalPage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return page;
	}
}

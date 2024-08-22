package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.GoodsVO;

public class GoodsDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static List<GoodsVO> goodsListData(Map map) {
		List<GoodsVO> list = new ArrayList<GoodsVO>();
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
	public static int goodsTotalPage(String table_name) {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("goodsTotalPage", table_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	public static GoodsVO goodDetailData(Map map) {
		GoodsVO vo=new GoodsVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			session.update("goodsHitIncrement", map);
			session.commit();
			vo=session.selectOne("goodsDetailData", map);
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

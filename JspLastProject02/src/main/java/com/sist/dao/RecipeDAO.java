package com.sist.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.ChefVO;
import com.sist.vo.RecipeDetailVO;
import com.sist.vo.RecipeVO;

public class RecipeDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	public static List<RecipeVO> recipeListData(Map map){
		List<RecipeVO> list=new ArrayList<RecipeVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("recipeListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int recipeTotalCount() {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("recipeTotalCount");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		
		return total;
	}
	public static RecipeDetailVO recipeDetailData(int no) {
		RecipeDetailVO vo=new RecipeDetailVO();
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("recipeHitIncrement", no);
			vo=session.selectOne("recipeDetailData", no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	public static List<ChefVO> recipeChefListData(Map map){
		List<ChefVO> list=new ArrayList<ChefVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("recipeChefListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int recipeChefTotalPage(){
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("recipeChefTotalPage");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	public static List<RecipeVO> chefMakeListData(Map map){
		List<RecipeVO> list=new ArrayList<RecipeVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("chefMakeListData", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		
		return list;
	}
	public static int chefMakeTotalPage(String chef) {
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("chefMakeTotalPage", chef);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
}

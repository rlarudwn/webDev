package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class MovieDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}
	 public static List<MovieVO> movieTopData()
	   {
		   List<MovieVO> list=new ArrayList<MovieVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieTopData");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	 public static List<MovieVO> movieListData1(Map map)
	   {
		   List<MovieVO> list=new ArrayList<MovieVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieListData1",map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	 public static int movieTotalPage1()
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("movieTotalPage1");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return total;
	   }
	 public static int movieListCount1()
	   {
		   int count=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   count=session.selectOne("movieListCount1");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return count;
	   }
	 public static List<MovieVO> movieListData2(Map map)
	   {
		   List<MovieVO> list=new ArrayList<MovieVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieListData2",map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	 public static int movieTotalPage2()
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("movieTotalPage2");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return total;
	   }
	 public static int movieListCount2()
	   {
		   int count=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   count=session.selectOne("movieListCount2");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return count;
	   }
	 public static MovieVO movieDetailData(int mno)
	   {
		   MovieVO vo=new MovieVO();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   /*
			   // 조회수 증가 
			   session.update("movieHitIncrement",mno);
			   session.commit(); // insert,update,delete
			   */
			   // 데이터 읽기 
			   vo=session.selectOne("movieDetailData",mno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return vo;
	   }
	 public static List<MovieVO> movieFindData1(Map map)
	   {
		   List<MovieVO> list=new ArrayList<MovieVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieFindData1",map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static int movieFindTotalPage1(String ss)
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("movieFindTotalPage1",ss);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return total;
	   }
	   public static List<MovieVO> movieFindData2(Map map)
	   {
		   List<MovieVO> list=new ArrayList<MovieVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieFindData2",map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static int movieFindTotalPage2(String ss)
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("movieFindTotalPage2",ss);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return total;
	   }
	   public static List<MovieBookVO> movieBookData(Map map)
	   {
		   List<MovieBookVO> list=new ArrayList<MovieBookVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieBookData", map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static List<MovieVO> movieTitleData()
	   {
		   List<MovieVO> list=new ArrayList<MovieVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieTitleData");
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static List<Integer> movieTnoData(int mno)
	   {
		   List<Integer> list= new ArrayList<Integer>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieTnoData", mno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static List<String> movieTlocData(List<Integer> tnolist)
	   {
		   List<String> list=new ArrayList<String>();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieTlocData", tnolist);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static List<String> movieTnameData(String tloc)
	   {
		   List<String> list=new ArrayList<String>();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieTnameData", tloc);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   
	   public static int movieTnoData2(Map map)
	   {
		   int tnonum=0;
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   tnonum=session.selectOne("movieTnoData2", map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return tnonum;
	   }
	   public static List<Integer> movieTdnoData(int tno)
	   {
		   List<Integer> list= new ArrayList<Integer>();
		   SqlSession session=null; //Connection
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("movieTdnoData", tno);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   public static List<MscheduleVO> mscheduleData(Map map)
	   {
		   List<MscheduleVO> list=new ArrayList<MscheduleVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("mscheduleData", map);
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   
}

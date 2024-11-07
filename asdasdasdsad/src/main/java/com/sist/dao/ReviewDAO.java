package com.sist.dao;
import java.sql.Connection;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.database.DataBaseConnection;
import com.sist.vo.*;
public class ReviewDAO {
	private static SqlSessionFactory ssf;
	  static
	  {
		  try
		  {
		    ssf=CreateSqlSessionFactory.getSsf();
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
	  }
	  
	  public static void reviewInsert(Map map)
	  {
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession(true);
			  session.insert("reviewInsert",map);
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null)
				  session.close();
		  }
	  }
	  public static List<ReviewVO> reviewListData(Map map)
	  {
		  List<ReviewVO> list=new ArrayList<ReviewVO>();
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  list=session.selectList("reviewListData",map);  
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
	  // 삭제
	  public static void reviewDelete(int trno)
	  {
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession(true);
			  session.delete("reviewDelete",trno);
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null)
				  session.close();
		  }
	  }
	  public static void reviewUpdate(Map map)
	  {
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession(true);
			  session.update("reviewUpdate",map);
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null)
				  session.close();
		  }
	  }
	  public static int reviewCount(Map map)
	  {
		  int count=0;
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  count=session.selectOne("reviewCount",map);  
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
	  public static double reviewAverage(Map map)
	  {
		  double avg=0.0;
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  double avg1=session.selectOne("reviewAverage",map);
			  avg=avg1;
		  }catch(Exception ex)
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
			  if(session!=null)
				  session.close();
		  }
		  return avg;
	  }
	  
	  public static boolean CheckedReview(Map map) {
		    boolean Checkedr = false;
		    SqlSession session = null;
		    try {
		        session = ssf.openSession();
		        int count = session.selectOne("CheckedReview", map);
		        Checkedr = count > 0;
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } finally {
		        if (session != null) session.close();
		    }
		    return Checkedr;
		}
	  
	}
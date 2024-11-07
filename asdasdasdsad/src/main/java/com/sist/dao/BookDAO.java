package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class BookDAO {
	private static SqlSessionFactory ssf;
	  static
	  {
		  ssf=CreateSqlSessionFactory.getSsf();
	  }
	  public static List<BookVO> bookListData(Map map)
	  {
		  List<BookVO> list=new ArrayList<BookVO>();
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  list=session.selectList("bookListData",map);
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
	  public static int bookTotalPage(String genre)
	  {
		  int total=0;
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  total=session.selectOne("bookTotalPage",genre);
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
	  public static int bookListCount(String genre)
	   {
		   int count=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   count=session.selectOne("bookListCount",genre);
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
	   public static BookVO bookDetailData(int bno)
	   {
		   BookVO vo=new BookVO();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("bookDetailData",bno);
			   
			   vo=session.selectOne("bookDetailData",bno);
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
	   public static List<BookVO> bookNewData(Map map)
	   {
		   List<BookVO> list=new ArrayList<BookVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("bookNewData",map);
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
	   public static int bookNewListCount()
	   {
		   int count=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   count=session.selectOne("bookNewListCount");
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
	   public static List<BookVO> bookFindListData(Map map)
	   {
		   List<BookVO> list=new ArrayList<BookVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("bookFindListData",map);
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
	   public static int bookFindTotalPage(Map map)
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("bookFindTotalPage",map);
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
	   public static List<BookVO> bookBestData(Map map)
	   {
		   List<BookVO> list=new ArrayList<BookVO>();
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("bookBestData",map);
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
	   public static int bookBestListCount()
	   {
		   int count=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   count=session.selectOne("bookBestListCount");
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
	   public static void insertCart(Map map) {
		    SqlSession session = null;
		    try {
		        session = ssf.openSession(true); 
		        session.insert("insertCart", map);
		    } catch (Exception ex) 
		    {
		        ex.printStackTrace();
		    } 
		    finally 
		    {
		        if (session != null) 
		            session.close();
		    }
		}
	   public static List<BookVO> cartRecomm(String id, List<Integer> bnoList) {
		    List<BookVO> list = new ArrayList();
		    SqlSession session = null;
		    try 
		    {
		        session = ssf.openSession();
		        Map map = new HashMap();
		        map.put("id", id);
		        map.put("bnoList", bnoList);
		        list = session.selectList("CartRecomm", map);
		    } catch (Exception ex) 
		    {
		        ex.printStackTrace();
		    } 
		    finally 
		    {
		        if (session != null) 
		        {
		            session.close();
		        }
		    }
		    return list;
		}

	   public static List<BookVO> buyRecomm(String id, List<Integer> bnoList) {
		    List<BookVO> list = new ArrayList();
		    SqlSession session = null;
		    try 
		    {
		        session = ssf.openSession();
		        Map map = new HashMap();
		        map.put("id", id);
		        map.put("bnoList", bnoList);
		        list = session.selectList("BuyRecomm", map);
		    } catch (Exception ex) 
		    {
		        ex.printStackTrace();
		    } 
		    finally 
		    {
		        if (session != null) 
		        {
		            session.close();
		        }
		    }
		    return list;
		}

	   public static List<Integer> getCartBnoList(String userId) {
		    List<Integer> bnoList = new ArrayList<Integer>();
		    SqlSession session = null;
		    try {
		        session = ssf.openSession();
		        bnoList = session.selectList("getCartBnoList", userId);
		    } catch (Exception ex) {
		        ex.printStackTrace();
		    } finally {
		        if (session != null) {
		            session.close();
		        }
		    }
		    return bnoList;
		}

	    public static List<BookVO> randomRecomm(Map map) {
	        List<BookVO> list = new ArrayList<BookVO>();
	        SqlSession session = null;
	        try {
	            session = ssf.openSession();
	            list = session.selectList("RandomRecomm", map);
	        } catch (Exception ex) {
	            ex.printStackTrace();
	        } finally {
	            if (session != null)
	                session.close();
	        }
	        return list;
	    }

}

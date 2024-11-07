package com.sist.dao;
import java.util.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
public class AlStoreDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
/*
 	<select id="alStoreListData" resultType="AlStoreVO" parameterType="hashmap">
 		SELECT ano,aname,adisprice,aphoto num
 		FROM (SELECT ano,aname,adisprice,aphoto,rownum as num
 		FROM (SELECT ano,aname,adisprice,aphoto
 		FROM ${table_name} ORDER BY no ASC))
 		WHERE num BETWEEN #{start}AND#{end}
 	</select>
*/
	public static List<AlStoreVO> alStoreListData(Map map){
		
		List<AlStoreVO> list=new ArrayList<AlStoreVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("alStoreListData",map);
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
/*
  	<select id="alStoreTotalPage" resultType="int" parameterType="hashmap">
  		 SELECT CEIL(COUNT(*)/20.0) FROM ${table_name}
  	</select>
 */
	  public static int alStoreTotalPage(Map map)
	  {
		  int total=0;
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  total=session.selectOne("alStoreTotalPage",map);
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
	  
	  public static int alstoreListCount()
	   {
		   int count=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   count=session.selectOne("alstoreListCount");
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
	  
	  public static AlStoreVO alStoreDetailData(int ano)
	  {
		  AlStoreVO vo=new AlStoreVO();
		  SqlSession session=null;
		  try
		  {
			  session=ssf.openSession();
			  session.commit();
			  vo=session.selectOne("alStoreDetailData",ano);
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
	
	
}




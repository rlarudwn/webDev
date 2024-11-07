package com.sist.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static List<ZipcodeVO> postFind(String dong){
		List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("postFind", dong);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return list;
	}
	public static int postFindCount(String dong) {
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("postFindCount", dong);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return count;
	}
	public static boolean idCheck(String id) {
		boolean bCheck=false;	
		SqlSession session=ssf.openSession();
		int count=session.selectOne("idCheck", id);
		if(count>0)
			bCheck=true;
		return bCheck;
	}
	public static int idCheckCount(String id) {
		int count=0;
		SqlSession session=ssf.openSession();
		count=session.selectOne("idCheck", id);
		return count;
	}
}

package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;

public class NoticeBoardDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	// 공지 리스트 데이터 
	public static List<NoticeBoardVO> noticeListData(Map map)
	{
		List<NoticeBoardVO> list = new ArrayList<NoticeBoardVO>();
		
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("noticeListData",map);
		} 
		catch(Exception ex)	{
			ex.printStackTrace();
		}
		finally	{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	/*<insert id="noticeboardInsert" parameterType="NoticeBoardVO">
	<selectKey keyProperty="no" resultType="int" order="BEFORE">
		SELECT NVL(MAX(no)+1,1) as no FROM noticeboard
	</selectKey>
		INSERT INTO noticeboard(no,type,subject,content)
		VALUES (#{vo},#{type},#{subject},#{content})
</insert>*/
	// 공지 insert
	public static void noticeBoardInsert(NoticeBoardVO vo)
	{
		
		SqlSession session = null;
		try
		{
			session=ssf.openSession(true);
			session.insert("noticeBoardInsert",vo);
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}
	}
	
}





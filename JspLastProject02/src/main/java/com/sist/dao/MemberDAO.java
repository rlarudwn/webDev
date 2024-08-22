package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.MemberVO;
public class MemberDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  ssf=CreateSqlSessionFactory.getSsf();
  }
  /*
   *   <select id="memberIdCountData" resultType="int" parameterType="string">
		  SELECT COUNT(*) FROM member
		  WHERE id=#{id}
		 </select>
		 <select id="memberInfoData" resultType="MemberVO" parameterType="string">
		   SELECT * FROM member
		   WHERE id=#{id}
		 </select>
   */
  public static MemberVO isLogin(String id,String pwd)
  {
	  MemberVO vo=new MemberVO();
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession();
		  int count=session.selectOne("memberIdCountData",id);// id => #{id}
		  if(count==0)
		  {
			  vo.setMsg("NOID");
		  }
		  else
		  {
			  vo=session.selectOne("memberInfoData",id);
			  if(pwd.equals(vo.getPwd())) // 로그인
			  {
				  vo.setMsg("OK");
			  }
			  else // 비밀번호가 틀린 상태 
			  {
				  vo.setMsg("NOPWD");
			  }
		  }
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  if(session!=null)
			  session.close(); // DBCP => POOL안으로 반환 => 재사용
	  }
	  return vo;
  }
  public static int memberIdCount(String id) {
  	int total=0;
  	SqlSession session=null;
  	try {
			session=ssf.openSession();
			total=session.selectOne("memberIdCountData", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
  	finally {
			if(session!=null)
				session.close();
		}
  	return total;
  }
  public static void memberInsert(MemberVO vo) {
  	SqlSession session=null;
  	try {
			session=ssf.openSession(true);
			session.insert("memberInsert", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
  	finally {
			if(session!=null)
				session.close();
		}
  }
  public static MemberVO memberUpdateData(String id) {
  	MemberVO vo=new MemberVO();
  	SqlSession session=null;
  	try {
			session=ssf.openSession();
			vo=session.selectOne("memberUpdateData", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
  	finally {
			if(session!=null)
				session.close();
		}
  	return vo;
  }
  public static boolean memberUpdate(MemberVO vo) {
  	boolean bCheck=false;
  	SqlSession session=null;
  	try {
			session=ssf.openSession();
			MemberVO vo1=session.selectOne("memberInfoData", vo.getId());
			if(vo.getPwd().equals(vo1.getPwd())) {
				session.update("memberUpdate", vo);
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
  	finally {
			if(session!=null)
				session.close();
		}
  	return bCheck;
  }
  public static String memberIdFindEmailData(MemberVO vo) {
  	String result="";
  	SqlSession session=null;
  	try {
			session=ssf.openSession();
			int count=session.selectOne("memberIdFindEmailCount", vo);
			if(count==0) {
				result="NO";
			}
			else {
				result=session.selectOne("memberIdFindEmailData", vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
  	finally {
			if(session!=null)
				session.close();
		}
  	return result;
  }
  public static String memberIdFindPhoneData(MemberVO vo) {
  	String result="";
  	SqlSession session=null;
  	try {
  		session=ssf.openSession();
  		int count=session.selectOne("memberIdFindPhoneCount", vo);
  		if(count==0) {
  			result="NO";
  		}
  		else {
  			result=session.selectOne("memberIdFindPhoneData", vo);
  		}
  	} catch (Exception e) {
  		e.printStackTrace();
  	}
  	finally {
  		if(session!=null)
  			session.close();
  	}
  	return result;
  }
}








package com.sist.dao;

import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.taglibs.standard.lang.jstl.EqualityOperator;

import com.sist.vo.MemberVO;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static MemberVO memberLogIn(String id, String pwd) {
		MemberVO vo = new MemberVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			int count = session.selectOne("memberIdCheck", id);
			if (count == 0) {
				vo.setMsg("NOID");
			} else {
				vo = session.selectOne("memberInfoData", id);
				if (pwd.equals(vo.getPwd())) {
					vo.setMsg("OK");
				} else {
					vo.setMsg("NOPWD");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	public static String memberIdCheck(String id) {
		String result = "";
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberIdCheck", id.toLowerCase());
		if (count == 0) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}

	public static String memberNickCheck(String nickname) {
		String result = "";
		SqlSession session = ssf.openSession();
		int count = session.selectOne("memberNickCheck", nickname.toLowerCase());
		if (count == 0) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}

	public static String memberEmailCheck(String email) {
		String result = "";
		SqlSession session = ssf.openSession();
		System.out.print(email);
		int count = session.selectOne("memberEmailCheck", email);
		if (count == 0) {
			result = "OK";
		} else {
			result = "NO";
		}
		return result;
	}

	public static void memberInsert(MemberVO vo) {
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.insert("memberInsert", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
	}

	public static MemberVO memberUpdateData(String id) {
		MemberVO vo = new MemberVO();
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			vo = session.selectOne("memberUpdateData", id);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	public static boolean memberUpdate(MemberVO vo) {
		boolean bCheck = false;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			String pwd = session.selectOne("memberGetPassword", vo.getId());
			if (pwd.equals(vo.getPwd())) {
				bCheck = true;
				session.update("memberUpdate", vo);
				session.commit();
			} else {
				bCheck = false;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return bCheck;
	}

	public static MemberVO memberinfo(String id) {
		MemberVO vo = new MemberVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.selectOne("memberInfoData", id);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}

	public static int memberGetPassword(Map map) {
		int count = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			count = session.selectOne("memberGetPassword", map);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return count;
	}

	public static boolean changePwd(Map<String, Object> map) {
	    boolean bCheck = false;
	    SqlSession session = null;
	    try {
	        session = ssf.openSession();
	        
	        // 데이터베이스에서 현재 비밀번호 조회
	        String pwd = session.selectOne("memberGetPassword", map.get("id"));
	        
	        // 현재 비밀번호와 입력된 비밀번호가 일치하는지 확인
	        if (pwd != null && pwd.equals(map.get("oldpwd"))) {
	            // 비밀번호가 일치하면 새로운 비밀번호로 업데이트
	            session.update("changePwd", map);
	            session.commit(); // 트랜잭션 커밋
	            bCheck = true; // 비밀번호 변경 성공
	        } else {
	            bCheck = false; // 비밀번호 변경 실패
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 처리
	    } finally {
	        if (session != null) {
	            session.close(); // SqlSession 종료
	        }
	    }
	    return bCheck; // 비밀번호 변경 성공 여부 반환
	}



	public static boolean deleteMember(String id, String pwd) {
	    boolean bCheck = false;
	    System.out.println("id: "+id+" pwd: "+pwd+" dao1");

	    SqlSession session = null;
	    try {
	        session = ssf.openSession();
	        String pwdjsp = session.selectOne("memberGetPassword", id);
	        
	        if (pwdjsp != null && pwdjsp.equals(pwd)) {
	        	bCheck = true;
	            session.delete("deleteMember", id);
	            session.commit();	            
	        } else {
	        	bCheck = false;
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    } finally {
	        if (session != null)
	            session.close();
	    }
	    System.out.println("id: "+id+" pwd: "+pwd+" dao2");
	    return bCheck;
	}


}

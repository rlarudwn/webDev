package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.MemberVO;

public class MemberDAO {
	private static SqlSessionFactory ssf;
	static {
		ssf = CreateSqlSessionFactory.getSsf();
	}

	public static MemberVO isLogin(String id, String pwd) {
		MemberVO vo = new MemberVO();
		SqlSession session = ssf.openSession();
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
		return vo;
	}
}

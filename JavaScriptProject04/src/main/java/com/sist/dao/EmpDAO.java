package com.sist.dao;

import java.io.*;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class EmpDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static List<EmpVO> empListData() {
		List<EmpVO> list = new ArrayList<EmpVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("empListData");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static EmpVO empDetailData(int empno) {
		EmpVO vo=new EmpVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("empDetailData", empno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return vo;
	}
}

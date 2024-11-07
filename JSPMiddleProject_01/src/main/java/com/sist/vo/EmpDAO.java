package com.sist.vo;

import java.util.*;
import java.sql.*;
import javax.sql.*;


import javax.naming.*;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static EmpDAO dao;

	public static EmpDAO newInstance() {
		if (dao == null)
			dao = new EmpDAO();
		return dao;
	}

	// 미리 톰캣에 의해 생성된 Connection 주소를 얻어온다
	/*
	*     => JNDI => new InitialContext()
	*     =================java://comp/env==========================
	*       ====================================
	*        new Connection() false jdbc/oracle 
	*                         =====
	*                          true
	*       ====================================
	*        new Connection() false jdbc/oracle
	*       ====================================
	*        
	*     ===========================================
	*/
	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java://comp/env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// 다시 Connection 관리영역(POOL) 으로 반환 => 연결에 소모되는 시간을 절약하기 위해
	// Connection을 일정하게 관리 할 수 있다
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
		}
	}
	
	public List<EmpVO> empListData(){
		List<EmpVO> list=new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql="SELECT empno, ename, sal, job, hiredate "
					+ "FROM emp";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				EmpVO vo=new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setSal(rs.getInt(3));
				vo.setJob(rs.getString(4));
				vo.setHiredate(rs.getDate(5));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return list;
	}
}

package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MemberDAO dao;

	public static MemberDAO newInstance() {
		if (dao == null)
			dao = new MemberDAO();
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
	public MemberVO isLogin(String id, String pwd) {
		MemberVO vo = new MemberVO();
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM member WHERE id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			if(count==0)
				vo.setMsg("NOID");
			else {
				sql="SELECT name, pwd FROM member WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(2);
				String name=rs.getString(1);
				rs.close();
				if(db_pwd.equals(pwd)) {
					vo.setPwd(db_pwd);
					vo.setName(name);
					vo.setMsg("OK");
				}
				else
					vo.setMsg("NOPWD");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return vo;
	}

}

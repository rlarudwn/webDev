package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.database.*;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MemberDAO dao;
	private DataBaseConnection dbConn = new DataBaseConnection();
	
	public static MemberDAO newInstance() {
		if(dao==null)
			dao=new MemberDAO();
		return dao;
	}
	public MemverVO isLogin(String id, String pwd) {
		MemverVO vo=new MemverVO();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT COUNT(*) FROM member WHERE id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			if(count==0) {
				vo.setMsg("NOID");
			}
			else {
				sql="SELECT pwd, name FROM member WHERE id=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, id);
				rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				String name=rs.getString(2);
				rs.close();
				if(db_pwd.equals(pwd)) {
					vo.setMsg("OK");
					vo.setName(name);
				}
				else {
					vo.setMsg("NOPWD");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
}

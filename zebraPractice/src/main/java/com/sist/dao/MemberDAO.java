package com.sist.dao;

import com.sist.controller.DbcpConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private PreparedStatement ps;
	private Connection conn;
	private static MemberDAO dao;
	private DbcpConnection dbConn = new DbcpConnection();

	public static MemberDAO newInstance() {
		if (dao == null) {
			dao = new MemberDAO();
		}

		return dao;
	}

	public MemberVO isLogin(String id, String pwd) {
		MemberVO vo = new MemberVO();

		try {
			this.conn = this.dbConn.getConnection();
			String sql = "SELECT COUNT(*) FROM member WHERE id=?";
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setString(1, id);
			ResultSet rs = this.ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			rs.close();
			if (count == 1) {
				sql = "SELECT pwd, name FROM member WHERE id=?";
				this.ps = this.conn.prepareStatement(sql);
				this.ps.setString(1, id);
				rs = this.ps.executeQuery();
				rs.next();
				String temp = rs.getString(1);
				String name = rs.getString(2);
				rs.close();
				if (pwd.equals(temp)) {
					vo.setPwd(pwd);
					vo.setMsg("OK");
					vo.setName(name);
				} else {
					vo.setMsg("NOPWD");
				}
			} else {
				vo.setMsg("NOID");
			}
		} catch (Exception var12) {
			var12.printStackTrace();
		} finally {
			this.dbConn.disConnection(this.conn, this.ps);
		}

		return vo;
	}
}
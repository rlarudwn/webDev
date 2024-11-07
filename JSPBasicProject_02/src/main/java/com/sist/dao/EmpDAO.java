package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.database.DataBaseConnection;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private DataBaseConnection dbConn = new DataBaseConnection();
	private static EmpDAO dao;
	public EmpDAO() {
		try {
			Class.forName("oracle.jcbc.driver.OracleDriver");
		} catch (Exception e) {}
	}
	public static EmpDAO newInstance() {
		if(dao == null)
			dao = new EmpDAO();
		return dao;
	}
	public List<EmpVO> empListData(){
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT empno, ename, job, hiredate, comm "
					+ "FROM emp "
					+ "ORDER BY empno ASC";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setHiredate(rs.getDate(4));
				vo.setComm(rs.getInt(5));
				
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
}
	
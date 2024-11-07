/*
	dbcp
	미리 일정 개수의 connection을 만들어서 pool에 저장
	인원 초과	=> 최대 connection	=> maxActive
	사용자가 요청하면 connection의 주소를 제공해 사용가능하게 만든다
	사용 종료시 pool안으로 반환한다
	db연결 시간 단축
	connection을 일정갯수로 관리 가능
	동시 접속자가 많아도 쉽게 다운되지 않음
	
	톰캣이 connection을 pool에 저장
		pool안에서 connection을 가져온다
		connection을 이용해 db작업 수행
		수행 종료시 pool로 반환
	
	Web에서만 사용 가능
	
	주소 : java://conf/env
		jdbc/oracle new Connection() false
		jdbc/oracle new Connection() false
		jdbc/oracle new Connection() false
		jdbc/oracle new Connection() false
		jdbc/oracle new Connection() false
		
	
 */
package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.sql.*;
import javax.naming.*; // 이름으로 Connection주소 찾기
/*
	Pool : 연결된 Connection을 저장하는 공간
*/

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static EmpDAO dao;

	public void getConnection() {
		// 미리 오라클 연결해서 저장된 Connection의 주소를 얻어온다
		try {
			// 1. pool에 연결
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java://comp/env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void disConnection() {
		// 사용후 반환
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

	public static EmpDAO newInstance() {
		if (dao == null)
			dao = new EmpDAO();
		return dao;
	}

	public List<EmpVO> empListData() {
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql = "SELECT empno, ename, job, hiredate, comm " + "FROM emp " + "ORDER BY empno ASC";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
		} finally {
			disConnection();
		}
		return list;
	}

	public EmpVO empDetailData(int empno) {
		EmpVO vo = new EmpVO();
		try {
			getConnection();
			String sql = "SELECT empno, ename, job, hiredate, sal, comm, emp.deptno, dname, loc, grade "
					+ "FROM emp JOIN dept " + "ON emp.deptno=dept.deptno " + "JOIN salgrade "
					+ "ON emp.sal BETWEEN losal AND hisal " + "WHERE emp.empno=" + empno;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setEmpno(rs.getInt(1));
			vo.setEname(rs.getString(2));
			vo.setJob(rs.getString(3));
			vo.setHiredate(rs.getDate(4));
			vo.setSal(rs.getInt(5));
			vo.setComm(rs.getInt(6));
			vo.setDeptno(rs.getInt(7));
			vo.getDvo().setDname(rs.getString(8));
			vo.getDvo().setLoc(rs.getString(9));
			vo.getSvo().setGrade(rs.getInt(10));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}

	public List<EmpVO> empSubqueryData() {
		List<EmpVO> list = new ArrayList<EmpVO>();
		try {
			getConnection();
			String sql = "SELECT empno, ename, job, hiredate, deptno, "
					+ "(SELECT dname FROM dept where deptno=emp.deptno), "
					+ "(SELECT loc FROM dept WHERE deptno=emp.deptno) " + "FROM emp";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				EmpVO vo = new EmpVO();
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setHiredate(rs.getDate(4));
				vo.setDeptno(rs.getInt(5));
				vo.getDvo().setDname(rs.getString(6));
				vo.getDvo().setLoc(rs.getString(7));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return list;
	}
}

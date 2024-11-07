package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ReplyDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static ReplyDAO dao;

	public static ReplyDAO newInstance() {
		if (dao == null)
			dao = new ReplyDAO();
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
	public List<ReplyVO> replyListData(int no, int type){
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		try {
			getConnection();
			String sql="SELECT /*+ INDEX_DESC(test_reply tr_rno_pk)*/"
					+ "rno, no, name, id, msg, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') "
					+ "FROM test_reply "
					+ "WHERE no="+no+" AND type="+type;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ReplyVO vo=new ReplyVO();
				vo.setRno(rs.getInt(1));
				vo.setNo(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setId(rs.getString(4));
				vo.setMsg(rs.getString(5));
				vo.setRegdate(rs.getString(6));
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
	public void replyInsert(ReplyVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO test_reply";
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
}

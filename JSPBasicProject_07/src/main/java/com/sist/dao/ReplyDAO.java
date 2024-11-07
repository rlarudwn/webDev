package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.database.DataBaseConnection;

import oracle.net.aso.c;

public class ReplyDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static ReplyDAO dao;
	private DataBaseConnection dbConn = new DataBaseConnection();

	public static ReplyDAO newInstance() {
		if (dao == null)
			dao = new ReplyDAO();
		return dao;
	}

	/*
	try {
			conn=dbConn.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
	 */
	/*
	  RNO                                       NOT NULL NUMBER
 ID                                                 VARCHAR2(100)
 NAME                                      NOT NULL VARCHAR2(50)
 MSG                                       NOT NULL CLOB
 REGDATE                                            DATE
 FNO                                                NUMBER
	 */
	public void replyInsert(ReplyVO vo) {
		try {
			conn = dbConn.getConnection();
			String sql = "INSERT INTO food_reply values(fr_rno_seq.nextval, ?, ?, ?, SYSDATE, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getName());
			ps.setString(3, vo.getMsg());
			ps.setInt(4, vo.getFno());
			ps.setInt(5, vo.getType());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
	}
	public List<ReplyVO> replyListData(int fno, int type){
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT /*+ INDEX_DESC(food_reply fr_rno_pk)*/ rno, fno, id, name, msg, "
					+ "TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS') "
					+ "FROM food_reply "
					+ "WHERE fno="+fno +" AND type="+type;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ReplyVO vo=new ReplyVO();
				vo.setRno(rs.getInt(1));
				vo.setFno(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setMsg(rs.getString(5));
				vo.setDbday(rs.getString(6));
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
	public void replyDelete(int rno) {
		try {
			conn=dbConn.getConnection();
			String sql="DELETE FROM food_reply WHERE rno="+rno;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
	}
	public void replyUpdate(ReplyVO vo) {
		try {
			conn=dbConn.getConnection();
			String sql="UPDATE food_reply SET "
					+ "msg=? "
					+ "WHERE rno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getMsg());
			ps.setInt(2, vo.getRno());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
	}
}

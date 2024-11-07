package com.sist.dao;

import com.sist.controller.DbcpConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	private PreparedStatement ps;
	private Connection conn;
	private static BoardDAO dao;
	private DbcpConnection dbConn = new DbcpConnection();

	public static BoardDAO newInstance() {
		if (dao == null) {
			dao = new BoardDAO();
		}

		return dao;
	}

	public List<BoardVO> boardListData(int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		int row = 10;
		int start = (page - 1) * row + 1;
		int end = start + row - 1;

		try {
			this.conn = this.dbConn.getConnection();
			String sql = "SELECT no, name, subject, hit, likecount, TO_CHAR(regdate, 'YYYY-MM-DD'), tag, num FROM (SELECT no, name, subject, hit, likecount, regdate, tag, rownum as num FROM (SELECT /*+INDEX_DESC(poke_board pb_no_pk)*/ no, name, subject, hit, likecount, regdate, tag FROM poke_board)) WHERE num BETWEEN ? AND ?";
			this.ps = this.conn.prepareStatement(sql);
			this.ps.setInt(1, start);
			this.ps.setInt(2, end);
			ResultSet rs = this.ps.executeQuery();

			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setHit(rs.getInt(4));
				vo.setLikecount(rs.getInt(5));
				vo.setDbday(rs.getString(6));
				vo.setTag(rs.getString(7));
				vo.setRownum(rs.getInt(8));
				list.add(vo);
			}

			rs.close();
		} catch (Exception var12) {
			var12.printStackTrace();
		} finally {
			this.dbConn.disConnection(this.conn, this.ps);
		}

		return list;
	}

	public int boardTotalCount() {
		int total = 0;

		try {
			this.conn = this.dbConn.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10.0) FROM poke_board";
			this.ps = this.conn.prepareStatement(sql);
			ResultSet rs = this.ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception var7) {
			var7.printStackTrace();
		} finally {
			this.dbConn.disConnection(this.conn, this.ps);
		}

		return total;
	}

	public BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();

		try {
			this.conn = this.dbConn.getConnection();
			String sql = "UPDATE board SET hit=hit+1 WHERE no=" + no;
			this.ps = this.conn.prepareStatement(sql);
			this.ps.executeUpdate();
			sql = "SELECT no, subject, id, name, content, hit, likecount, TO_CHAR(regdate, 'YYYY-MM-DD') FROM poke_board WHERE no="
					+ no;
			this.ps = this.conn.prepareStatement(sql);
			ResultSet rs = this.ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setSubject(rs.getString(2));
			vo.setId(rs.getString(3));
			vo.setName(rs.getString(4));
			vo.setContent(rs.getString(5));
			vo.setHit(rs.getInt(6));
			vo.setLikecount(rs.getInt(7));
			vo.setDbday(rs.getString(8));
			rs.close();
		} catch (Exception var8) {
			var8.printStackTrace();
		} finally {
			this.dbConn.disConnection(this.conn, this.ps);
		}

		return vo;
	}

	public void pokeReplyInsert(ReplyVO vo) {
		try {
			conn = dbConn.getConnection();
			String sql = "INSERT INTO poke_reply VALUES(pr_no_seq.nextval, ?, ?, ?, ?, sysdate, ?, ";
			if(vo.getRoot()==0)
				sql=sql+"pr_no_seq.currval)";
			else
				sql=sql+vo.getRoot()+")";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getBno());
			ps.setString(2, vo.getId());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getContent());
			ps.setInt(5, vo.getDepth());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
	}

	public List<ReplyVO> pokeReplyListData(int bno) {
		List<ReplyVO> list = new ArrayList<ReplyVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no, bno, id, name, content, TO_CHAR(regdate, 'YYYY-MM-DD'), depth, root "
					+ "FROM (SELECT/*+INDEX_DESC(poke_reply pr_no_pk)*/ no, bno, id, name, content, regdate, depth, root "
					+ "FROM poke_reply) "
					+ "WHERE bno=" + bno
					+ " ORDER BY root DESC, depth ASC";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ReplyVO vo = new ReplyVO();
				vo.setNo(rs.getInt(1));
				vo.setBno(rs.getInt(2));
				vo.setId(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setContent(rs.getString(5));
				vo.setDbday(rs.getString(6));
				vo.setDepth(rs.getInt(7));
				vo.setRoot(rs.getInt(8));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
}
/*
NO                                        NOT NULL NUMBER
 BNO                                       NOT NULL NUMBER
 ID                                        NOT NULL VARCHAR2(100)
 NAME                                      NOT NULL VARCHAR2(1000)
 CONTENT                                   NOT NULL CLOB
 REGDATE                                            DATE
 RNO                                                NUMBER
 
try {
			conn=dbConn.getConnection();
			String sql="";
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
 */

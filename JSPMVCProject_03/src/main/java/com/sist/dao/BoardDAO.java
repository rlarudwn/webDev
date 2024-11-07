package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import oracle.net.aso.l;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;

	public static BoardDAO newInstance() {
		if (dao == null)
			dao = new BoardDAO();
		return dao;
	}

	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java://comp//env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

	public List<BoardVO> boardListData(int page) {
		int row = 10;
		int start = (page - 1) * row + 1;
		int end = start + row - 1;
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			getConnection();
			String sql = "SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, group_tab, num "
					+ "FROM (SELECT no, subject, name, regdate, hit, group_tab, rownum as num "
					+ "FROM (SELECT no, subject, name, regdate, hit, group_tab "
					+ "FROM replyboard ORDER BY group_id DESC, group_step ASC)) " + "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setGroup_tab(rs.getInt(6));
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

	public int boardRowCount() {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM replyboard";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return total;
	}

	public void boardInsert(BoardVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO replyboard(no, name, subject, content, pwd, group_id) "
					+ "VALUES(rb_no_seq.nextval, ?, ?, ?, ?, " + "(SELECT NVL(MAX(group_id)+1, 1) FROM replyboard))";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}

	public BoardVO boardDetaildata(int no) {
		BoardVO vo = new BoardVO();
		try {
			getConnection();
			String sql = "UPDATE replyboard SET " + "hit=hit+1 " + "WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			sql = "SELECT no, name, subject, content, hit, TO_CHAR(regdate, 'YYYY-MM-DD') " + "FROM replyboard "
					+ "WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setHit(rs.getInt(5));
			vo.setDbday(rs.getString(6));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}

	public void boardReplyInsert(int pno, BoardVO vo) {
		try {
			getConnection();
			conn.setAutoCommit(false);
			String sql = "SELECT group_id, group_step, group_tab " + "FROM replyboard " + "WHERE no=" + pno;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			int gi = rs.getInt(1);
			int gs = rs.getInt(2);
			int gt = rs.getInt(3);
			rs.close();
			sql = "UPDATE replyboard SET " + "group_step=group_step+1 " + "WHERE group_id=? AND group_step=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, gi);
			ps.setInt(2, gs);
			ps.executeUpdate();
			sql = "INSERT INTO replyboard(no, name, subject, content, pwd, " + "group_id, group_step, group_tab, root) "
					+ "VALUES(rb_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setInt(5, gi);
			ps.setInt(6, gs + 1);
			ps.setInt(7, gt + 1);
			ps.setInt(8, pno);
			ps.executeUpdate();
			sql = "UPDATE replyboard SET " + "dept=dept+1 " + "WHERE no=" + pno;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception e2) {
				e2.printStackTrace();
			} finally {
				try {
					conn.setAutoCommit(true);
					disConnection();
				} catch (Exception e3) {
					e3.printStackTrace();
				}
			}
		} finally {
			disConnection();
		}
	}

	public BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		try {
			getConnection();
			String sql = "SELECT no, name, subject, content " + "FROM replyboard " + "WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}
}

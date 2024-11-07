package com.sist.dao;

import java.util.*;

import com.sist.database.DataBaseConnection;

import oracle.net.aso.l;

import java.sql.*;

public class BoardDAO {
	String[] mod = {"", "name", "subject", "content"};
	
	private Connection conn;
	private PreparedStatement ps;
	private static BoardDAO dao;
	private DataBaseConnection dbConn = new DataBaseConnection();

	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
		}
	}

	public static BoardDAO newInstance() {
		if (dao == null)
			dao = new BoardDAO();
		return dao;
	}
	
	public List<BoardVO> boardListData(int type, String key, int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, num "
					+ "FROM (SELECT no, subject, name, regdate, hit, rownum as num "
					+ "FROM (SELECT /*+ INDEX_DESC(board, board_no_pk)*/ no, subject, name, regdate, hit "
					+ "FROM board WHERE "+ mod[type]+" LIKE '%'||?||'%')) " + "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int rowSize = 10;
			int start = (page - 1) * rowSize + 1;
			int end = start + rowSize - 1;
			ps.setString(1, key);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDb_day(rs.getString(4));
				vo.setHit(rs.getInt(5));
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
	public int boardTotalPage(int type, String key) {
		int total = 0;
		try {
			conn = dbConn.getConnection();
			String sql= "SELECT COUNT(*) FROM board WHERE " + mod[type] +" LIKE '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, key);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	public BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();
		try {
			conn = dbConn.getConnection();
			String sql = "UPDATE board SET hit = hit + 1 WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
					
			sql = "SELECT no, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD'), hit "
					+ "FROM board WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDb_day(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		
		return vo;
	}
	public void boardInsertData(BoardVO vo) {
		try {
			conn = dbConn.getConnection();
			String sql = "INSERT INTO board (no, name, subject, content, pwd, regdate) "
					+ "VALUES (board_noseq.nextval, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
	}
	public BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no, name, subject, content, TO_CHAR(regdate, 'YYYY-MM-DD'), hit "
					+ "FROM board WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDb_day(rs.getString(5));
			vo.setHit(rs.getInt(6));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
	public boolean boardUpdate(BoardVO vo) {
		boolean bCheck = false;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT pwd FROM board WHERE no =?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getNo());
			ResultSet rs = ps.executeQuery();
			rs.next();
			if(rs.getString(1).equals(vo.getPwd()))
			{
				bCheck = true;
				sql = "UPDATE board SET "
						+ "name = ? "
						+ "subject = ? "
						+ "content = ? "
						+ "WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getNo());
			ps.executeUpdate();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
	public boolean boardDeleteData(int no, String pwd) {
		boolean bCheck = false;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT pwd FROM board WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			if(rs.getString(1).equals(pwd)) {
				bCheck = true;
				sql = "DELETE FROM board WHERE no = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
}

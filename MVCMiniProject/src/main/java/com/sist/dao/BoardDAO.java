package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.controller.DbcpConnection;
import com.sist.vo.BoardVO;

public class BoardDAO {
	private PreparedStatement ps;
	private Connection conn;
	private static BoardDAO dao;
	private DbcpConnection dbConn = new DbcpConnection();
	int row = 10;

	public static BoardDAO newInstance() {
		if (dao == null)
			dao = new BoardDAO();
		return dao;
	}

	public List<BoardVO> boardListData(int page) {
		List<BoardVO> list = new ArrayList<BoardVO>();
		int start = (page - 1) * row + 1;
		int end = start + row - 1;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no, subject, name, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, num "
					+ "FROM (SELECT no, subject, name, regdate, hit, rownum as num "
					+ "FROM (SELECT /*+INDEX_DESC(board board_no_pk)*/ no, subject, name, regdate, hit "
					+ "FROM board)) " + "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNo(rs.getInt(1));
				vo.setSubject(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setDbDay(rs.getString(4));
				vo.setHit(rs.getInt(5));
				vo.setRownum(rs.getInt(6));
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

	public int boardTotalPage() {
		int total = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/10) FROM board";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}

	public int boardTotalCount() {
		int total = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT COUNT(*) FROM board";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}

	public BoardVO boardDetailData(int no) {
		BoardVO vo = new BoardVO();
		try {
			conn = dbConn.getConnection();
			String sql = "UPDATE board SET hit=hit+1 WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			sql = "SELECT/*+INDEX_DESC(board board_noseq)*/ no, subject, name, content, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, rownum "
					+ "FROM board " + "WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setSubject(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setDbDay(rs.getString(5));
			vo.setHit(rs.getInt(6));
			vo.setRownum(rs.getInt(7));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}

	public void boardInsert(BoardVO vo) {
		try {
			conn = dbConn.getConnection();
			String sql = "INSERT INTO board VALUES(board_noseq.nextval, ?, ?, ?, ?, sysdate, 0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
	}

	public int boardPrev(int no) {
		int max = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no_prev "
					+ "FROM (SELECT no, LAG(no) OVER(ORDER BY no ASC) as no_prev from board) WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			max = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return max;
	}

	public int boardNext(int no) {
		int min = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no_next "
					+ "FROM (SELECT no, LEAD(no) OVER(ORDER BY no ASC) as no_next from board) WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			min = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return min;
	}

	public BoardVO boardUpdateData(int no) {
		BoardVO vo = new BoardVO();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no, subject, name, content, pwd " + "FROM board " + "WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setSubject(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setPwd(rs.getString(5));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}

	public boolean boardUpdate(BoardVO vo) {
		boolean bCheck=false;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT pwd FROM board WHERE no="+vo.getNo();
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String pwd_tmp=rs.getString(1);
			rs.close();
			if(pwd_tmp.equals(vo.getPwd())) {
				bCheck=true;
				sql="UPDATE board set "
						+ "subject=?, "
						+ "name=?, "
						+ "content=? "
						+ "WHERE no="+vo.getNo();
				ps=conn.prepareStatement(sql);
				ps.setString(1, vo.getSubject());
				ps.setString(2, vo.getName());
				ps.setString(3, vo.getContent());
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
	public boolean boardDelete(int no, String pwd) {
		boolean bCheck=false;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT pwd FROM board WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String pwd_tmp=rs.getString(1);
			rs.close();
			if(pwd_tmp.equals(pwd)) {
				bCheck=true;
				sql="DELETE FROM board "
						+ "WHERE no="+no;
				ps=conn.prepareStatement(sql);
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
/*
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

package com.sist.dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class DataBoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static DataBoardDAO dao;

	public static DataBoardDAO newInstance() {
		if (dao == null)
			dao = new DataBoardDAO();
		return dao;
	}

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
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

	public List<DataBoardVO> databoardListData(int page) {
		List<DataBoardVO> list = new ArrayList<DataBoardVO>();
		int rowPage = 10;
		int start = (page - 1) * rowPage + 1;
		int end = start + rowPage - 1;
		try {
			getConnection();
			String sql = "SELECT no, name, subject, TO_CHAR(regdate, 'YYYY-MM-DD'), hit, num "
					+ "FROM(SELECT no, name, subject, regdate, hit, rownum as num "
					+ "FROM(SELECT /*+ INDEX_DESC(databoard db_no_pk) */ no, name, subject, regdate, hit "
					+ "FROM databoard)) WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DataBoardVO vo = new DataBoardVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setSubject(rs.getString(3));
				vo.setDbday(rs.getString(4));
				vo.setHit(rs.getInt(5));
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

	public int databoardRowCount() {
		int count = 0;
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM databoard";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			count = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return count;
	}

	public DataBoardVO databoardDetailData(int no) {
		DataBoardVO vo = new DataBoardVO();
		try {
			getConnection();
			String sql = "UPDATE databoard SET " + "hit=hit+1 " + "WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();

			sql = "SELECT no, name, subject, content, hit, TO_CHAR(regdate, 'YYYY-MM-DD HH24:MI:SS'), "
					+ "filename, filesize " + "FROM databoard " + "WHERE no=" + no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSubject(rs.getString(3));
			vo.setContent(rs.getString(4));
			vo.setHit(rs.getInt(5));
			vo.setDbday(rs.getString(6));
			vo.setFilename(rs.getString(7));
			vo.setFilesize(rs.getInt(8));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return vo;
	}

	public void databoardInsert(DataBoardVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO databoard (no, name, subject, content, pwd, filename, filesize) "
					+ "VALUES(db_no_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getPwd());
			ps.setString(5, vo.getFilename());
			ps.setInt(6, vo.getFilesize());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}

	public void databoardDelete(int no) {

	}

	public DataBoardVO databoardUpdateData(int no) {
		DataBoardVO vo = new DataBoardVO();
		try {
			getConnection();
			String sql = "SELECT no, name, subject, content "
						+ "FROM databoard " 
						+ "WHERE no=" + no;
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
	public boolean databoardUpdate(DataBoardVO vo) {
		boolean bCheck=false;
		try {
			getConnection();
			String sql="SELECT pwd FROM databoard WHERE no="+vo.getNo();
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String password=rs.getString(1);
			rs.close();
			if(password.equals(vo.getPwd())) {
			sql="UPDATE databoard SET "
					+ "name=?, "
					+ "content=?, "
					+ "subject=? "
					+ "WHERE no="+vo.getNo();
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getSubject());
			ps.executeUpdate();
			bCheck=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return bCheck;
	}
	public DataBoardVO databoardFileInfoData(int no) {
		DataBoardVO vo=new DataBoardVO();
		try {
			getConnection();
			String sql="SELECT filename, filesize "
					+ "FROM databoard "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setFilename(rs.getString(1));
			vo.setFilesize(rs.getInt(2));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return vo;
	}
	public String datavoardDeleteData(int no, String pwd) {
		String result="";
		try {
			getConnection();
			String sql="SELECT pwd FROM databoard "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String dbPwd=rs.getString(1);
			rs.close();
			if(dbPwd.equals(pwd)) {
				result="yes";
				sql="DELETE FROM databoard "
						+ "WHERE no="+no;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
			}
			else
				result="no";
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return result;
	}
}

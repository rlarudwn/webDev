package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.controller.DbcpConnection;
import com.sist.vo.FoodVO;
import com.sist.vo.LocationVO;

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

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	private DbcpConnection dbConn = new DbcpConnection();
	int row = 20;

	public static FoodDAO newInstance() {
		if (dao == null)
			dao = new FoodDAO();
		return dao;
	}

	public List<FoodVO> foodTopData() {
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT fno, poster, name, rownum " + "FROM (SELECT fno, poster, name "
					+ "FROM food_house ORDER BY hit DESC) " + "WHERE rownum<=12";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
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

	public int foodTotalPage() {
		int total = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/20.0) FROM food_house";
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

	public List<FoodVO> foodListData(int page) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		int start = (page - 1) * row + 1;
		int end = start + row - 1;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT fno, poster, name, num " + "FROM (SELECT fno, poster, name, rownum as num "
					+ "FROM (SELECT /*+INDEX_ASC(food_house fh_fno_pk)*/ fno, poster, name " + "FROM food_house)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
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

	public FoodVO foodDetailData(int fno) {
		FoodVO vo = new FoodVO();
		try {
			conn = dbConn.getConnection();
			String sql = "UPDATE food_house SET hit=hit+1 WHERE fno=" + fno;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			sql = "SELECT fno, name, type, phone, address, theme, poster, content, score " + "FROM food_house " + "WHERE fno="
					+ fno;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setFno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setType(rs.getString(3));
			vo.setPhone(rs.getString(4));
			vo.setAddr(rs.getString(5));
			vo.setTheme(rs.getString(6));
			vo.setPoster(rs.getString(7));
			vo.setContent(rs.getString(8));
			vo.setScore(rs.getDouble(9));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}

	public List<FoodVO> foodLocation(String addr) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT fno, name, poster, address, rownum " + "FROM food_house " + "WHERE rownum<=6 "
					+ "AND address LIKE '%" + addr + "%'";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setAddr(rs.getString(4));
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

	public List<FoodVO> foodFindData(int page, String addr) {
		List<FoodVO> list = new ArrayList<FoodVO>();
		int start = (page - 1) * row + 1;
		int end = start + row - 1;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT fno, name, poster, address num " + "FROM (SELECT fno, name, poster, address, rownum as num "
					+ "FROM (SELECT /*+INDEX_ASC(food_house fh_fno_pk)*/ fno, name, poster, address " + "FROM food_house "
					+ "WHERE address LIKE '%" + addr + "%')) " + "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setAddr(rs.getString(4));
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

	public int foodFindCount(String addr) {
		int total = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT COUNT(*) FROM food_house WHERE address LIKE '%" + addr + "%'";
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

	public int foodFindTotalPage(String addr) {
		int total = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/20.0) FROM food_house WHERE address LIKE '%" + addr + "%'";
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

	public List<FoodVO> foodFooterData() {
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT fno, name, hit, rownum "
					+ "FROM (SELECT fno, name, hit "
					+ "FROM food_house ORDER BY hit DESC) "
					+ "WHERE rownum<=7";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				FoodVO vo=new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setHit(rs.getInt(3));
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

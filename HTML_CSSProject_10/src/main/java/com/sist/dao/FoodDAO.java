package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.List;

import com.sist.database.DataBaseConnection;

public class FoodDAO {
	private String[] mod = {"", "한식", "중식", "일식", "양식"};
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	private DataBaseConnection dbConn = new DataBaseConnection();
	public static FoodDAO newInstance() {
		if(dao == null)
			dao = new FoodDAO();
		return dao;
	}
	public List<FoodVO> foodFindData(String addr, int page){
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT fno, name, poster, num "
					+ "FROM (SELECT fno, name, poster, rownum as num "
					+ "FROM (SELECT fno, name, poster "
					+ "FROM food_house WHERE address like '%'||?||'%')) "
					+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int rowSize = 12;
			int start = (page - 1) * rowSize +1;
			int end = start + rowSize - 1;
			ps.setString(1, addr);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
		} catch (Exception e) {
			System.out.println("foodFindData	=> error");
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	public int foodFindTotalPage(String addr) {
		int total = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT (CEIL(COUNT(*)) / 12.0 ) "
					+ "FROM food_house "
					+ "WHERE address Like '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, addr);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (Exception e) {
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	public List<FoodVO> foodListData(int type, int page){
		List<FoodVO> list = new ArrayList<FoodVO>();
		int start = (page - 1) * 12 + 1;
		int end = start + 11;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT fno, name, poster, num "
					+ "FROM (SELECT fno, name, poster, rownum as num "
					+ "FROM (SELECT fno, name, poster "
					+ "FROM food_house WHERE type LIKE '%'||?||'%')) "
					+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mod[type]);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			System.out.println(type);
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3).replace("https", "http"));
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
	public int foodListTotalPage(int type) {
		int total = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT CEIL(COUNT(*) / 12.0) FROM food_house WHERE type LIKE '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mod[type]);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
}

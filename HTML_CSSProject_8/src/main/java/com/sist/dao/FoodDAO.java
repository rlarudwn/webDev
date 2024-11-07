package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import com.sist.database.DataBaseConnection;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	DataBaseConnection dbconn = new DataBaseConnection();
	public FoodDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {}
	}
	public static FoodDAO newInstance(){
		if(dao == null)
			dao = new FoodDAO();
		return dao;
	}
	
	public List<FoodVO> foodListData(int page){
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			conn = dbconn.getConnection();
			int start = 12 * (page - 1) + 1;
			int end = start + 11;
			String sql = "SELECT fno, poster, name, num "
					+ "FROM (SELECT fno, poster, name, rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC(food_house fh_fno_pk)*/ fno, poster, name "
					+ "FROM food_house)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				list.add(vo);
			}
		} catch (Exception e) {
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	public int foodTotalPage() {
		int total = 0;
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT CEIL(COUNT(*) / 12.0) FROM food_house";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return total;
	}
	public FoodVO foodDetailData(int fno) {
		FoodVO vo = new FoodVO();
		try {
			conn = dbconn.getConnection();
			String sql = "UPDATE food_house set "
					+ "hit = hit + 1 "
					+ "WHERE fno = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ps.executeUpdate();
			sql = "SELECT fno, name, type, phone, address, theme, poster, content, score "
					+ "FROM food_house "
					+ "WHERE fno = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setFno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setType(rs.getString(3));
			vo.setPhone(rs.getString(4));
			vo.setAddress(rs.getString(5));
			vo.setTheme(rs.getString(6));
			vo.setPoster(rs.getString(7).replace("https", "http"));
			vo.setContent(rs.getString(8));
			vo.setScore(rs.getDouble(9));
			rs.close();
		} catch (Exception e) {
			System.out.println("sql에러");
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
}

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
			String sql = "SELECT fno, poster, name, num "
					+ "FROM (SELECT fno, poster, name, rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC(food_house fh_fno_pk)*/ fno, poster, name "
					+ "FROM food_house "
					+ "WHERE num BETWEEN ? AND ?";
			int start = 12 * (page - 1) + 1;
			int end = start + 11;
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
}

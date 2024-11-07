package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.database.DataBaseConnection;

public class FoodDAO {
	private PreparedStatement ps;
	private Connection conn;
	private static FoodDAO dao;
	private DataBaseConnection dbConn = new DataBaseConnection();
	public FoodDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {}
	}
	public static FoodDAO newInstance() {
		if(dao==null)
			dao=new FoodDAO();
		return dao;
	}
	public List<FoodVO> foodListData(int page){
		List<FoodVO> list = new ArrayList<FoodVO>();
		int row = 12;
		int start = (page - 1) * row + 1;
		int end = start + row - 1;
		try {
			conn = dbConn.getConnection();
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
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
	public int foodTotalPage() {
		int total = 0;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT CEIL(COUNT(*) /12.0) FROM food_house";
			ps = conn.prepareStatement(sql);
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
	public FoodVO foodDetailData(int fno) {
		FoodVO vo = new FoodVO();
		try {
			conn=dbConn.getConnection();
			String sql = "SELECT fno, name, type, phone, theme, address, score, poster, content, hit, likecount"
					+ " FROM food_house WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fno);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setFno(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setType(rs.getString(3));
			vo.setPhone(rs.getString(4));
			vo.setTheme(rs.getString(5));
			vo.setAddr(rs.getString(6));
			vo.setScore(rs.getDouble(7));
			vo.setPoster(rs.getString(8));
			vo.setContent(rs.getString(9));
			vo.setHit(rs.getInt(10));
			vo.setLikecount(rs.getInt(11));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
}

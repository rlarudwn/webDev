package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.database.*;

public class FoodDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static FoodDAO dao;
	private DataBaseConnection dbConn = new DataBaseConnection();
	
	public static FoodDAO newInstance() {
		if(dao == null)
			dao = new FoodDAO();
		return dao;
	}
	public List<FoodVO> foodListData(){
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT fno, name, poster, type, rownum "
					+ "FROM (SELECT fno, name, poster, type "
					+ "FROM food_house ORDER BY fno ASC) "
					+ "WHERE rownum <= 50";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				FoodVO vo = new FoodVO();
				vo.setFno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setType(rs.getString(4));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return list;
	}
}

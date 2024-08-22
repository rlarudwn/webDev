package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import io.netty.handler.codec.http.HttpContentEncoder.Result;

public class DayDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	public DayDAO(){
		try {
			getClass().forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {}
	}
	public void getConnection() {
		try {
			conn=DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception e) {}
	}
	public void disConnection() {
		try {
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		} catch (Exception e) {}
	}
	
	public List<Integer> foodGetFno(){
		List<Integer> list=new ArrayList<Integer>();
		try {
			getConnection();
			String sql="SELECT fno FROM project_food_house "
					+ "ORDER BY fno ASC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return list;
	}
	public void foodRdayUpdate(int fno, String rdays) {
		try {
			getConnection();
			String sql="UPDATE project_food_house SET "
					+ "rdays=? "
					+ "WHERE fno=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, rdays);
			ps.setInt(2, fno);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
	public void timeInsert(int dno, String times) {
		try {
			getConnection();
			String sql="INSERT INTO reserve_date VALUES(?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dno);
			ps.setString(2, times);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		
	}
}

package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MusicDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MusicDAO dao;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public MusicDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {}
	}
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
		} catch (SQLException e) {}
	}
	public void disConnection() {
		try {
			if(ps!= null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {}
	}
	public static MusicDAO newInstance() {
		if(dao == null)
			dao = new MusicDAO();
		return dao;
	}
	public void musicInsert(MusicVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO genie_music VALUES("
					+ "gm_mno_seq.nextval, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getSinger());
			ps.setString(3, vo.getAlbum());
			ps.setString(4, vo.getPoster());
			ps.setString(5, vo.getState());
			ps.setInt(6, vo.getIncrement());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
	public List<MusicVO> musicAllDate(){
		List<MusicVO> list = new ArrayList<MusicVO>();
		try {
			getConnection();
			String sql = "SELECT mno, state, IDCREMENT, poster, title, singer "
					+ "FROM genie_music "
					+ "ORDER BY mno";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				MusicVO vo = new MusicVO();
				vo.setMno(rs.getInt(1));
				vo.setState(rs.getString(2));
				vo.setIncrement(rs.getInt(3));
				vo.setPoster(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setSinger(rs.getString(6));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return list;
	}
	
}

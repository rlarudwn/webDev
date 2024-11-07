package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MusicDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MusicDAO dao;
	private final String URL = "jdbc:oracle:thin:@192.168.10.124:1521:XE";
	public MusicDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {	}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr3", "happy");
		} catch (Exception e) {}
	}
	
	public void disConnection() {
		try {
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {}
	}
	
	public static MusicDAO newInstance() {
		if(dao == null)
			dao = new MusicDAO();
		return dao;
	}
	/*
	ANO       NOT NULL NUMBER         
	NAME      NOT NULL VARCHAR2(1000) 
	POSTER             VARCHAR2(2000) 
	TYPE               VARCHAR2(300)  
	DEBUTYEAR          VARCHAR2(300)  
	DEBUTSONG          VARCHAR2(300)  
	ACTIVE             VARCHAR2(1000) 
	NATION             VARCHAR2(1000) 
	CONTENT 					 CLOB
	LIKECOUNT          NUMBER  
	 */
	public void musicInsert(MusicVO vo) {
		
	}
	public boolean musicIs(String title) {
		boolean bCheck=false;
		try {
			getConnection();
			String sql="SELECT count(*) FROM music WHERE title=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, title);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			if(count>0)
				bCheck=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return bCheck;
	}
	public void albumInsert(AlbumVO vo) {
		
	}
	public void artistInsert(ArtistVO vo) {
		try {
			getConnection();
			String sql="INSERT INTO artist VALUES(art_ano_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, 0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPoster());
			ps.setString(3, vo.getType());
			ps.setString(4, vo.getDeutyear());
			ps.setString(5, vo.getDebutsong());
			ps.setString(6, vo.getActive());
			ps.setString(7, vo.getNation());
			ps.setString(8, vo.getContent());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
	/*
	ANO       NOT NULL NUMBER         
	NAME      NOT NULL VARCHAR2(1000) 
	POSTER             VARCHAR2(2000) 
	TYPE               VARCHAR2(300)  
	DEBUTYEAR          VARCHAR2(300)  
	DEBUTSONG          VARCHAR2(300)  
	ACTIVE             VARCHAR2(1000) 
	NATION             VARCHAR2(1000) 
	CONTENT 					 CLOB
	LIKECOUNT          NUMBER  
	 */
	public boolean artistIsIn(String name, String type) {
		boolean bCheck=false;
		try {
			getConnection();
			String sql="SELECT count(*) from artist WHERE name=? AND type=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, type);
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			if(count!=0)
				bCheck=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return bCheck;
	}
}

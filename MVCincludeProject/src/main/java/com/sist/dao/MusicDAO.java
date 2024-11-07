package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.controller.DbcpConnection;

public class MusicDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static MusicDAO dao;
	private DbcpConnection dbConn=new DbcpConnection();
	
	public static MusicDAO newInstance() {
		if(dao==null)
			dao=new MusicDAO();
		return dao;
	}
	public List<MusicVO> musicListData(int page){
		List<MusicVO> list=new ArrayList<MusicVO>();
		int row=20;
		int start=(page-1)*row+1;
		int end=start+row-1;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT mno, title, poster, singer, state, idcrement, num "
					+ "FROM (SELECT mno, title, poster, singer, state, idcrement, rownum as num "
					+ "FROM (SELECT mno, title, poster, singer, state, idcrement  "
					+ "FROM genie_music)) WHERE mno BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				MusicVO vo=new MusicVO();
				vo.setMno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setSinger(rs.getString(4));
				vo.setState(rs.getString(5));
				vo.setIdcrement(rs.getInt(6));
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
	public int musicTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/20.0) FROM genie_music";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return total;
	}
	public MusicVO musicDetailData(int mno) {
		MusicVO vo=new MusicVO();
		try {
			conn=dbConn.getConnection();
			String sql="SELECT mno, title, singer, album, state, idcrement, key ";
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbConn.disConnection(conn, ps);
		}
		return vo;
	}
}

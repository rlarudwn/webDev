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

public class SeoulDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static SeoulDAO dao;
	int row=20;
	private DbcpConnection dbConn=new DbcpConnection();

	public static SeoulDAO newInstance() {
		if (dao == null)
			dao = new SeoulDAO();
		return dao;
	}


	public List<LocationVO> seoulTopData() {
		List<LocationVO> list = new ArrayList<LocationVO>();
		try {
			conn=dbConn.getConnection();
			String sql = "SELECT no, title, poster, rownum "
					+ "FROM seoul_location "
					+ "WHERE rownum<=12";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				LocationVO vo=new LocationVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
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
	public int seoulTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/20.0) FROM seoul_location";
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
	public List<LocationVO> seoulListData(int page){
		List<LocationVO> list=new ArrayList<LocationVO>();
		int start=(page-1)*row+1;
		int end=start+row-1;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no, title, poster, num "
					+ "FROM (SELECT no, title, poster, rownum as num "
					+ "FROM (SELECT /*+INDEX_ASC(seoul_location sl_no_pk)*/ no, title, poster "
					+ "FROM seoul_location)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				LocationVO vo=new LocationVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
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
}

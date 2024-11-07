package com.sist.dao;

import java.util.*;

import com.sist.database.DataBaseConnection;

import java.sql.*;

public class GoodsDAO {
	private String[] mod = {"", "goods_all", "goods_best", "goods_new", "goods_special"};
	private String[] index = {"", "ga_no_pk", "gb_no_pk", "gn_no_pk", "gs_no_pk"};
	private Connection conn;
	private PreparedStatement ps;
	private static GoodsDAO dao;
	DataBaseConnection dbconn = new DataBaseConnection();
	
	public GoodsDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {}
	}
	public static GoodsDAO newInstance() {
		if(dao == null)
			dao = new GoodsDAO();
		return dao;
	}
	
	public int totalPage(int type, String key) {
		int total = 0;
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT CEIL(COUNT(*) / 16.0) FROM "+mod[type]
					+ " WHERE goods_name LIKE '%'||?||'%'";
			ps = conn.prepareStatement(sql);
			ps.setString(1, key);
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
	
	/*
	public List<GoodsVO> goodsListData(int page){
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT no, goods_name, goods_poster, num "
					+ "FROM (SELECT no, goods_name, goods_poster, rownum as num "
					+ "FROM (SELECT no, goods_name, goods_poster "
					+ "FROM goods_all)) "
					+ "WHERE num BETWEEN ? AND ?";
			int total = 16;
			int start = (page - 1) * total + 1;
			int end = start + total - 1;
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo = new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
			rs.close();
			} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	*/
	public GoodsVO goodsDetailData(int type, int no) {
		GoodsVO vo = new GoodsVO();
		try {
			conn = dbconn.getConnection();
			String sql = "UPDATE " +mod[type] + " SET HIT = HIT + 1 WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
			
			sql ="SElECT no, goods_name, goods_sub, goods_price, goods_poster, goods_first_price, goods_delivery, goods_discount, hit "
					+ "FROM " + mod[type]
					+ " WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSub(rs.getString(3));
			vo.setPrice(rs.getString(4));
			vo.setPoster(rs.getString(5));
			vo.setFirst_price(rs.getString(6));
			vo.setDelivery(rs.getString(7));
			vo.setDiscount(rs.getInt(8));
			vo.setHit(rs.getInt(9));
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	public List<GoodsVO> goodsListData(int type, String key, int page){
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		int paging = 16;
		int start = (page - 1) * paging + 1;
		int end = start + paging - 1;
		try {
			conn = dbconn.getConnection();
			String sql = "SELECT no, goods_name, goods_poster, num "
					+ "FROM (SELECT no, goods_name, goods_poster, rownum as num "
					+ "FROM (SELECT /*+ INDEX_ASC("+mod[type]+" "+index[type]+")*/ no, goods_name, goods_poster "
					+ "FROM " + mod[type] + " WHERE goods_name LIKE '%'||?||'%')) "
					+ "WHERE num BETWEEN ? AND ?";
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			ps.setString(1, key);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo = new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			dbconn.disConnection(conn, ps);
		}
		return list;
	}

}

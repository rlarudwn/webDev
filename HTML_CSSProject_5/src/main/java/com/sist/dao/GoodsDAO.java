package com.sist.dao;

import java.util.*;
import java.sql.*;

public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static GoodsDAO dao;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	
	public GoodsDAO() {
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
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {}
	}
	public static GoodsDAO newInstance() {
		if(dao == null)
			dao = new GoodsDAO();
		return dao;
	}
	
	/*
	NO                                        NOT NULL NUMBER
 GOODS_NAME                                NOT NULL VARCHAR2(1000)
 GOODS_SUB                                          VARCHAR2(1000)
 GOODS_PRICE                               NOT NULL VARCHAR2(50)
 GOODS_DISCOUNT                                     NUMBER
 GOODS_FIRST_PRICE                                  VARCHAR2(20)
 GOODS_DELIVERY                            NOT NULL VARCHAR2(20)
 GOODS_POSTER                                       VARCHAR2(260)
 */
	
	public List<GoodsVO> goodsListData(){
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		try {
			getConnection();
			String sql = "SELECT no, goods_poster, goods_name, goods_first_price, rownum "
					+ "FROM goods_all "
					+ "WHERE rownum<=50";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo = new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setPoster(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setPrice(rs.getString(4));
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
	public GoodsVO goodsDetailData(int no) {
		GoodsVO vo = new GoodsVO();
		try {
			getConnection();
			String sql = "SELECT no, goods_name, goods_poster, goods_price,"
					+ "goods_sub, goods_delivery, goods_discount, goods_first_price "
					+ "FROM goods_all "
					+ "WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setPoster(rs.getString(3));
			String price = rs.getString(8);
			vo.setPrice(rs.getString(4));
			vo.setSub(rs.getString(5));
			vo.setDeilivery(rs.getString(6));
			vo.setDiscount(rs.getInt(7));
			vo.setFirst_price(price);
			String rp = price.replaceAll("[^0-9]", "");
			vo.setRprice(Integer.parseInt(rp));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return vo;
	}
}

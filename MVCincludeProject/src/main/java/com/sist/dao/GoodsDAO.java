package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.controller.DbcpConnection;

import oracle.jdbc.logging.annotations.DisableTrace;

public class GoodsDAO {
	private PreparedStatement ps;
	private Connection conn;
	private static GoodsDAO dao;
	private DbcpConnection dbConn=new DbcpConnection();
	
	public static GoodsDAO newInstance() {
		if(dao==null)
			dao=new GoodsDAO();
		return dao;
	}
	
	public List<GoodsVO> goodsListData(int page){
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		int row=12;
		int start=(page-1)*row+1;
		int end=start+row-1;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT no, goods_name, goods_price, goods_poster, num "
					+ "FROM (SELECT no, goods_name, goods_price, goods_poster, rownum as num "
					+ "FROM (SELECT /*+INDEX_ASC(goods_all ga_no_pk)*/ no, goods_name, goods_price, goods_poster "
					+ "FROM goods_all)) "
					+ "WHERE num BETWEEN ? AND ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				GoodsVO vo=new GoodsVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPrice(rs.getString(3));
				vo.setPoster(rs.getString(4));
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
	public int goodsTotalPage() {
		int total=0;
		try {
			conn=dbConn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM goods_all";
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
	public GoodsVO goodsDetailData(int no) {
		GoodsVO vo=new GoodsVO();
		try {
			conn=dbConn.getConnection();
			String sql="UPDATE goods_all SET hit=hit+1 WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
			sql="SELECT no, goods_name, goods_sub, goods_price, goods_discount, goods_poster, hit "
					+ "FROM goods_all "
					+ "WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setSub(rs.getString(3));
			vo.setPrice(rs.getString(4));
			vo.setDiscount(rs.getInt(5));
			vo.setPoster(rs.getString(6));
			vo.setHit(rs.getInt(7));
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

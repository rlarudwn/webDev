package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sist.database.DataBaseConnection;

import oracle.net.aso.l;

public class ShoesDAO {
	private String[] mod = {"", "name_kor", "brand"};
	private Connection conn;
	private PreparedStatement ps;
	private static ShoesDAO dao;

	public static ShoesDAO newInstance() {
		if (dao == null)
			dao = new ShoesDAO();
		return dao;
	}

	// 미리 톰캣에 의해 생성된 Connection 주소를 얻어온다
	/*
	*     => JNDI => new InitialContext()
	*     =================java://comp/env==========================
	*       ====================================
	*        new Connection() false jdbc/oracle 
	*                         =====
	*                          true
	*       ====================================
	*        new Connection() false jdbc/oracle
	*       ====================================
	*        
	*     ===========================================
	*/
	public void getConnection() {
		try {
			Context init = new InitialContext();
			Context c = (Context) init.lookup("java://comp/env");
			DataSource ds = (DataSource) c.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	// 다시 Connection 관리영역(POOL) 으로 반환 => 연결에 소모되는 시간을 절약하기 위해
	// Connection을 일정하게 관리 할 수 있다
	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
		}
	}
	public int shoesTotalPage(int type, String key) {
		int total = 0;
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*) / 24.0) FROM shoes WHERE " +mod[type] + " LIKE '%'||?||'%'";
			System.out.println(sql);
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
			disConnection();
		}
		return total;
	}
	public int shoesFindTotalPage(int type, String key) {
		int total = 0;
		String key1 = key.toUpperCase();
		String key2 = key.toLowerCase();
		try {
			getConnection();
			String sql = "SELECT CEIL(COUNT(*) /24.0) FROM shoes WHERE REGEXP_LIKE(" + mod[type] +", '"+ key1+"|"+key2+"')";
			ps = conn.prepareStatement(sql); 	
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return total;
	}
	public void shoesInsertData(ShoesVO vo) {
		try {
			getConnection();
			String sql = "INSERT INTO shoes (no, name_kor, poster, brand, price, procode) "
					+ "VALUES (sh_no_seq.nextval, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getName());
			ps.setString(2, vo.getPoster());
			ps.setString(3, vo.getBrand());
			ps.setString(4, vo.getPrice());
			ps.setString(5, vo.getCode());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
	public List<ShoesVO> shoesListData(int type, String key, int page){
		List<ShoesVO> list = new ArrayList<ShoesVO>();
		String key1 = key.toUpperCase();
		String key2 = key.toLowerCase();
		try {
			getConnection();
			String sql = "SELECT no, name_kor, poster, num "
					+ "FROM (SELECT no, name_kor, poster, rownum as num "
					+ "FROM (SELECT no, name_kor, poster "
					+ "FROM shoes WHERE REGEXP_LIKE(" + mod[type] +", '"+ key1+"|"+key2+"'))) "
					+ "WHERE num BETWEEN ? AND ?";
			System.out.println(sql);
			ps = conn.prepareStatement(sql);
			int rowPage = 24;
			int start = (page - 1) * rowPage + 1;
			int end = start + rowPage - 1;
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ShoesVO vo = new ShoesVO();
				vo.setNo(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return list;
	}
	public List<ShoesVO> shoesRankListData(){
		List<ShoesVO> list=new ArrayList<ShoesVO>();
		try {
			getConnection();
			String sql="SELECT poster, name_kor, no, num "
					+ "FROM (SELECT poster, name_kor, no, rownum as num "
					+ "FROM (SELECT poster, name_kor, no "
					+ "FROM shoes)) "
					+ "WHERE num BETWEEN 1 AND 15";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				ShoesVO vo=new ShoesVO();
				vo.setPoster(rs.getString(1));
				vo.setName(rs.getString(2));
				vo.setNo(rs.getInt(3));
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
	public List<ShoesVO> shoesFindData(int type, String key, int page){
		List<ShoesVO> list = new ArrayList<ShoesVO>();
		try {
			getConnection();
			String sql = "SELECT no, name_kor, poster, num "
					+ "FROM (SELECT no, name_kor, poster, rownum as num "
					+ "FROM (SELECT no, name_kor, poster FROM shoew "
					+ "WHERE ? LIKE '%'||?||''%)) "
					+ "WHERE num BETWEEN ? AND B";
			int rowPage = 24;
			int start = (page - 1) * rowPage + 1;
			int end = start + rowPage - 1;
			ps = conn.prepareStatement(sql);
			ps.setString(1, mod[type]);
			ps.setString(2, key);
			ps.setInt(3, start);
			ps.setInt(4, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ShoesVO vo = new ShoesVO();
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
			disConnection();
		}
		return list;
	}
	/*
 NO                                        NOT NULL NUMBER
 NAME_KOR                                           VARCHAR2(1000)
 POSTER                                             VARCHAR2(1000)
 BRAND                                              VARCHAR2(1000)
 PRICE                                              VARCHAR2(1000)
 PROCODE                                            VARCHAR2(100)
	 */
	public ShoesVO shoesDetailData(int no) {
		ShoesVO vo = new ShoesVO();
		try {
			getConnection();
			String sql = "SELECT no, name_kor, poster, brand, price, procode "
					+ "FROM shoes "
					+ "WHERE no = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setName(rs.getString(2));
			vo.setPoster(rs.getString(3));
			vo.setBrand(rs.getString(4));
			vo.setPrice(rs.getString(5));
			vo.setCode(rs.getString(6));
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

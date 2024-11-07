package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CartDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static CartDAO dao;

	public static CartDAO newInstance() {
		if (dao == null)
			dao = new CartDAO();
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
	public List<CartVO> cartListData(){
		List<CartVO> list=new ArrayList<CartVO>();
		return list;
	}
	public void cartInsert(CartVO vo) {
		try {
			getConnection();
			String sql="SELECT count(*) FROM shoes_cart where id=? and sno="+vo.getSno();
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ResultSet rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			rs.close();
			if(count == 0) {
				sql="INSERT INTO shoes_cart (no, sno, id, account, regdate) "
						+ "values(sc_no_seq.nextval, ?, ?, ?, sysdate)";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, vo.getSno());
				ps.setString(2, vo.getId());
				ps.setInt(3, vo.getAccount());
				ps.executeUpdate();
			}
			else {
				sql="UPDATE shoes_cart SET account=account+"
						+vo.getAccount()+" WHERE sno="+vo.getSno();
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
	public List<CartVO> cartListData(String id){
		List<CartVO> list=new ArrayList<CartVO>();
		try {
			getConnection();
			String sql="SELECT shoes_cart.no, shoes.poster, shoes.name_kor, shoes_cart.account, TO_CHAR(shoes_cart.regdate, 'YYYY-MM-DD'), shoes.price, shoes_cart.sno "
					+ "FROM shoes JOIN shoes_cart "
					+ "ON shoes.no=shoes_cart.sno "
					+ "WHERE shoes_cart.id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				CartVO vo=new CartVO();
				vo.setNo(rs.getInt(1));
				vo.getSvo().setPoster(rs.getString(2));
				vo.getSvo().setName(rs.getString(3));
				vo.setAccount(rs.getInt(4));
				vo.setDbDay(rs.getString(5));
				vo.getSvo().setPrice(rs.getString(6));
				vo.setSno(rs.getInt(7));
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
	public void cartDelete(int no) {
		try {
			getConnection();
			String sql="DELETE FROM shoes_cart WHERE no="+no;
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
	}
}

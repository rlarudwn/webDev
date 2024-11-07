package com.sist.dao;

/*
 *   table => VO , DAO 
 *   ===== table 여러개 혼합 => Service
 *                          ======== board/reply
 *                          ======== food / jjim / like
 *    C/S => 네트워크 통신 
 *                request(JSP) => URL           
 *    브라우저   ================> 서버
 *            <================
 *              response(HTML) => 메모리를 읽어 간다 
 *              
 *                 SQL문장 PreparedStatement
 *    클라이언트  ===============> 오라클 
 *             <===============
 *               실제 저장된 데이터  PreparedStatement => OutputStream , BufferedReader
 */
import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class GoodsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static GoodsDAO dao;

	public static GoodsDAO newInstance() {
		if (dao == null)
			dao = new GoodsDAO();
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
	public List<GoodsVO> goodsListData(int page){
		List<GoodsVO> list=new ArrayList<GoodsVO>();
		int row=12;
		int start=(page-1)*row+1;
		int end=start+row-1;
		try {
			getConnection();
			String sql="SELECT no, goods_name, goods_poster, goods_price, num "
					+ "FROM (SELECT no, goods_name, goods_poster, goods_price, rownum as num "
					+ "FROM(SELECT /*+ INDEX_ASC(goods_all ga_no_pk)*/ no, goods_name, goods_poster, goods_price "
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
				vo.setPoster(rs.getString(3));
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
	public int goodsTotalPage() {
		int total=0;
		try {
			getConnection();
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
			disConnection();
		}
		return total;
	}
}

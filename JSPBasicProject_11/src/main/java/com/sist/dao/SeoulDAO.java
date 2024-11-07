package com.sist.dao;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class SeoulDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static SeoulDAO dao;
	
	public static SeoulDAO newInstance() {
		if(dao==null)
			dao=new SeoulDAO();
		return dao;
	}
	public void getConnection() {
		try {
			Context init=new InitialContext();
			Context c=(Context)init.lookup("java://comp//env");
			DataSource ds=(DataSource)c.lookup("jdbc/oracle");
			conn=ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void disConnection() {
		try {
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		} catch (Exception e) {}
	}
	public List<LocationVO> seoulLocationListData(int page){
		List<LocationVO> list=new ArrayList<LocationVO>();
		int rowPage=12;
		int start=(page-1)*rowPage+1;
		int end=start+rowPage-1;
		try {
			getConnection();
			String sql="SELECT no, title, poster num "
					+ "FROM(SELECT no, title, poster, rownum as num "
					+ "FROM(SELECT /*+ INDEX_ASC(seoul_location sl_no_pk) */ no, title, poster "
					+ "FROM seoul_location)) WHERE num BETWEEN ? and ?";
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
			disConnection();
		}
		return list;
	}
	public int seoulLocationTotalPage() {
		int total=0;
		try {
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) FROM seoul_location";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disConnection();
		}
		return total;
	}
}

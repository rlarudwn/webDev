package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.controller.DbcpConnection;
import com.sist.database.DataBaseConnection;

public class PokeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private static PokeDAO dao;
	DbcpConnection dbConn = new DbcpConnection();
	DataBaseConnection dbConn1 = new DataBaseConnection();
	int row = 12;

	public static PokeDAO newInstance() {
		if (dao == null) {
			dao = new PokeDAO();
		}

		return dao;
	}

	public void pokeInsert(PokeVO vo) {
		try {
			conn = dbConn1.getConnection();
			String sql = "insert into poke values(po_no_seq.nextval, ?, ?, ?, ?, '', ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getPno());
			ps.setInt(2, vo.getGen());
			ps.setString(3, vo.getComm());
			ps.setString(4, vo.getName());
			ps.setString(5, vo.getType1());
			ps.setString(6, vo.getType2());
			ps.setString(7, vo.getHeight());
			ps.setString(8, vo.getWeight());
			ps.setString(9, vo.getSpecies());
			ps.setString(10, vo.getAbility1());
			ps.setString(11, vo.getForm());
			ps.setString(12, vo.getPoster());
			ps.setString(13, vo.getAbility2());
			ps.executeUpdate();
		} catch (Exception var6) {
			var6.printStackTrace();
		} finally {
			dbConn1.disConnection(conn, ps);
		}

	}

	public List<PokeVO> pokeBestData() {
		List<PokeVO> list = new ArrayList<PokeVO>();

		try {
			conn = dbConn.getConnection();
			String sql = "SELECT pno, name, poster, no FROM poke WHERE name LIKE '%이상해%'";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				PokeVO vo = new PokeVO();
				vo.setPno(rs.getInt(1));
				vo.setName(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setNo(rs.getInt(4));
				list.add(vo);
			}

			rs.close();
		} catch (Exception var8) {
			var8.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}

		return list;
	}

	public List<PokeVO> pokeCardListData() {
		List<PokeVO> list = new ArrayList<PokeVO>();

		try {
			conn = dbConn.getConnection();
			int start = (int) (Math.random() * 1252.0D - 15.0D + 1.0D);
			int end = start + 14;
			String sql = "SELECT no, pno, name, poster, num FROM (SELECT no, pno, name, poster, rownum as num FROM (SELECT /*+ INDEX_ASC(poke po_no_pk)*/ no, pno, name, poster FROM poke)) WHERE no BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				PokeVO vo = new PokeVO();
				vo.setNo(rs.getInt(1));
				vo.setPno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setPoster(rs.getString(4));
				list.add(vo);
			}

			rs.close();
		} catch (Exception var10) {
			var10.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}

		return list;
	}

	public PokeVO pokeDetailData(int no) {
		PokeVO vo = new PokeVO();

		try {
			conn = dbConn.getConnection();
			String sql = "SELECT pno, gen, comm, name, type1, type2, height, weight, species, ability1, ability2, form, poster, likecount, no FROM poke WHERE no="
					+ no;
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			vo.setPno(rs.getInt(1));
			vo.setGen(rs.getInt(2));
			vo.setComm(rs.getString(3));
			vo.setName(rs.getString(4));
			vo.setType1(rs.getString(5));
			vo.setType2(rs.getString(6));
			vo.setHeight(rs.getString(7));
			vo.setWeight(rs.getString(8));
			vo.setSpecies(rs.getString(9));
			vo.setAbility1(rs.getString(10));
			vo.setAbility2(rs.getString(11));
			vo.setForm(rs.getString(12));
			vo.setPoster(rs.getString(13));
			vo.setLike(rs.getInt(14));
			vo.setNo(rs.getInt(15));
			rs.close();
		} catch (Exception var8) {
			var8.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}

		return vo;
	}

	public List<PokeVO> pokeListData(int page, String name) {
		List<PokeVO> list = new ArrayList<PokeVO>();
		int start = (page - 1) * row + 1;
		int end = start + row - 1;

		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no, pno, name, poster, num FROM (SELECT no, pno, name, poster, rownum as num FROM (SELECT /*+INDEX_ASC(poke po_no_pk)*/ no, pno, name, poster FROM poke WHERE name LIKE '%"
					+ name + "%')) " + "WHERE (num BETWEEN ? AND ?) ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				PokeVO vo = new PokeVO();
				vo.setNo(rs.getInt(1));
				vo.setPno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setPoster(rs.getString(4));
				list.add(vo);
			}

			rs.close();
		} catch (Exception var12) {
			var12.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}

		return list;
	}

	public int pokeTotalPage(String name) {
		int total = 0;

		try {
			conn = dbConn.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12.0) FROM poke WHERE name LIKE '%" + name + "%'";
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception var8) {
			var8.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}

		return total;
	}

	public List<PokeVO> pokeFindData(int page, String type, String gen, String name) {
		List<PokeVO> list = new ArrayList<PokeVO>();
		int start = (page - 1) * row + 1;
		int end = start + row - 1;

		try {
			conn = dbConn.getConnection();
			String sql = "SELECT no, pno, name, poster, num FROM (SELECT no, pno, name, poster, rownum as num FROM (SELECT /*+INDEX_ASC(poke po_no_pk)*/ no, pno, name, poster FROM poke WHERE name LIKE '%"
					+ name + "%' " + "AND REGEXP_LIKE(gen, ?) " + "AND (REGEXP_LIKE(type1, ?) " + "OR REGEXP_LIKE(type2, ?)))) "
					+ "WHERE (num BETWEEN ? AND ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, gen);
			ps.setString(2, type);
			ps.setString(3, type);
			ps.setInt(4, start);
			ps.setInt(5, end);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				PokeVO vo = new PokeVO();
				vo.setNo(rs.getInt(1));
				vo.setPno(rs.getInt(2));
				vo.setName(rs.getString(3));
				vo.setPoster(rs.getString(4));
				list.add(vo);
			}

			rs.close();
		} catch (Exception var14) {
			var14.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}

		return list;
	}

	public int pokeFindTotalPage(String type, String gen, String name) {
		int total = 0;

		try {
			conn = dbConn.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12.0) FROM poke WHERE name LIKE '%" + name + "%' " + "AND REGEXP_LIKE(gen, ?) "
					+ "AND (REGEXP_LIKE(type1, ?) " + "OR REGEXP_LIKE(type2, ?))";
			ps = conn.prepareStatement(sql);
			ps.setString(1, gen);
			ps.setString(2, type);
			ps.setString(3, type);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception var10) {
			var10.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}

		return total;
	}

	public void pokeLike(int no, String id) {
		try {
			conn = dbConn.getConnection();
			String sql = "UPDATE poke SET likecount=likecount+1 where no=" + no;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			sql = "INSERT INTO poke_like VALUES(pl_lno_seq.nextval, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, id);
			ps.executeUpdate();
		} catch (Exception var7) {
			var7.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}

	}

	public void pokeUnLike(int no, String id) {
		try {
			conn = dbConn.getConnection();
			String sql = "UPDATE poke SET likecount=likecount-1 where no=" + no;
			ps = conn.prepareStatement(sql);
			ps.executeUpdate();
			sql = "DELETE FROM poke_like WHERE pno=" + no + " AND id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception var7) {
			var7.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}

	}

	public boolean pokeIsLike(int no, String id) {
		boolean bCheck = false;
		try {
			conn = dbConn.getConnection();
			String sql = "SELECT count(*) from poke_like WHERE pno=? AND id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			ps.setString(2, id);
			ResultSet rs = ps.executeQuery();
			rs.next();
			if (rs.getInt(1) > 0) {
				bCheck = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbConn.disConnection(conn, ps);
		}
		return bCheck;
	}
}
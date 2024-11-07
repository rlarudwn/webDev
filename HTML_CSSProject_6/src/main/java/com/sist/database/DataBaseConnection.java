package com.sist.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DataBaseConnection {
	private Connection conn;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	public DataBaseConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {}
	}
	public Connection getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception e) {}
		return conn;
	}
	public void disConnection(Connection conn, PreparedStatement ps) {
		try {
			if(ps != null) ps.close();
			if(conn != null)conn.close();
		} catch (Exception e) {}
		
	}
}

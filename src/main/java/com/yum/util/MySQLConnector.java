package com.yum.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLConnector {
	
	protected Connection conn = null;
	protected PreparedStatement pstmt = null;
	protected ResultSet rs = null;

	private final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
	private final String DB_URL = "jdbc:mysql://localhost:3306/";
	private final String DB_NAME = "yumyum";
	private final String DB_MYSQL = DB_URL + DB_NAME;
	private final String MYSQL_ID = "root";
	private final String MYSQL_PW = "1234";
	
	public MySQLConnector() {
		
	}

	public Connection getConnection() {
		if (this.conn == null) {
			try {
				Class.forName(DB_DRIVER);
				this.conn = DriverManager.getConnection(DB_MYSQL, MYSQL_ID, MYSQL_PW);
				return this.conn;
			
			} catch (ClassNotFoundException | SQLException e) {
				System.out.println("MySQLConnector() ERR : " + e.getMessage());
			}

		}
		return this.conn;

	}

	
	public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		 if(rs!=null) {
	         try {
	            rs.close();
	         } catch (Exception e) {
	            System.err.println("ResultSet CLOSE ERR : "+ e.getMessage());
	         }
	      }
	      
	      if(pstmt!=null) {
	         try {
	            pstmt.close();
	         } catch (Exception e) {
	            System.err.println("PreparedStatement CLOSE ERR: "+ e.getMessage());
	         }
	      }
	      if(conn!=null) {
	         try {
	            conn.close();
	         } catch (Exception e) {
	            System.err.println("Connection CLOSE ERR: "+ e.getMessage());
	         }
	      }

	}


}

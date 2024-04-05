package com.yum.recipe.dao;

import java.sql.SQLException;

import com.yum.util.MySQLConnector;

public class RecipeDAO extends MySQLConnector {
	
	public RecipeDAO() {
		getConnection();
	}

//	예시
//	/**
//	 * 아이디 중복 조회
//	 * @param String
//	 * @return
//	 */
//	public boolean checkId(String id) {
//		try {
//			String query = "SELECT id FROM tblmember WHERE id = ?";
//			pstmt = conn.prepareStatement(query);
//			pstmt.setString(1, id);
//			
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				return true;
//			}
//		} catch (SQLException e) {
//			System.err.println("checkId() ERR : " + e.getMessage());
//		} finally {
//			close(rs, pstmt, conn);
//		}
//		
//		return false;
//	}
	
}
package com.yum.recipe.dao;

import java.sql.SQLException;

import com.yum.recipe.dto.RecipeDTO;
import com.yum.util.MySQLConnector;

public class RecipeDAO extends MySQLConnector {

	public RecipeDAO() {
	}

	/**
	 * 마지막 보드 인데스 조회
	 * @return
	 */
	public int maxBoardIdx() {
		conn = null;
		pstmt = null;
		rs = null;
		int result = -1;
		try {
			conn = getConnection();
			String query = "SELECT IFNULL(MAX(boardIdx), 0) FROM recipe_board";
			pstmt = conn.prepareStatement(query);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.err.println("maxBoardIdx() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		return result;
	}

	/**
	 * 레시피 등록
	 * @param RecipeDTO
	 */
	public void recipeWrite(RecipeDTO recipe) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query = "INSERT INTO recipe_board (userId, category, title, content, cookHour, cookMinute, ingredient, thumbnail) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, recipe.getUserId());
			pstmt.setString(2, recipe.getCategory());
			pstmt.setString(3, recipe.getTitle());
			pstmt.setString(4, recipe.getContent());
			pstmt.setInt(5, recipe.getCookHour());
			pstmt.setInt(6, recipe.getCookMinute());
			pstmt.setString(7, recipe.getIngredient());
			pstmt.setString(8, recipe.getThumbnail());
			System.out.println(pstmt.toString());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("recipeWrite() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}

//   예시
//   /**
//    * 아이디 중복 조회
//    * @param String
//    * @return
//    */
//   public boolean checkId(String id) {
//      try {
//         String query = "SELECT id FROM tblmember WHERE id = ?";
//         pstmt = conn.prepareStatement(query);
//         pstmt.setString(1, id);
//         
//         rs = pstmt.executeQuery();
//         
//         if(rs.next()) {
//            return true;
//         }
//      } catch (SQLException e) {
//         System.err.println("checkId() ERR : " + e.getMessage());
//      } finally {
//         close(rs, pstmt, conn);
//      }
//      
//      return false;
//   }

}
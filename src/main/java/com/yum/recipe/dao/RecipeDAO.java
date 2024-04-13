package com.yum.recipe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yum.note.dto.NoteDTO;
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
	 * 유저 닉네임 가져오기
	 * @param String
	 * @return
	 */
	public String getNickname(String userId) {
		String writer = "";
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			String query = "SELECT nickname  FROM member WHERE userId=? ";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				writer = rs.getString(1);
			}
			
		} catch (SQLException e) {
			System.err.println("getNickname() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		return writer;
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
			String query = "INSERT INTO recipe_board (userId, writer, category, title, content, cookHour, cookMinute, ingredient, thumbnail) values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, recipe.getUserId());
			pstmt.setString(2, recipe.getWriter());
			pstmt.setString(3, recipe.getCategory());
			pstmt.setString(4, recipe.getTitle());
			pstmt.setString(5, recipe.getContent());
			pstmt.setInt(6, recipe.getCookHour());
			pstmt.setInt(7, recipe.getCookMinute());
			pstmt.setString(8, recipe.getIngredient());
			pstmt.setString(9, recipe.getThumbnail());
			System.out.println(pstmt.toString());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("recipeWrite() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}

	/**
	 * 레시피 리스트 조회
	 * @param RecipeDTO
	 * @return
	 */
	public List<RecipeDTO> recipeList(RecipeDTO dto) {
	    List<RecipeDTO> recipeList = new ArrayList<>();
	    String whereSQL;
	    conn = null;
	    pstmt = null;
	    rs = null;
	    try {
	        conn = getConnection();
	        if (dto.getCategory() == null || dto.getCategory().equals("")) {
	            whereSQL = "WHERE title LIKE CONCAT('%',?,'%') OR writer LIKE CONCAT('%',?,'%') OR ingredient LIKE CONCAT('%',?,'%') ";
	        } else {
	            whereSQL = "WHERE category=? ";
	        }
	        String first = "SELECT boardIdx, userId, writer, category, title, content, createDate, updateDate, hit, like, cookHour, cookMinute, ingredient, thumbnail  FROM recipe_board ";
	        String end = "ORDER BY boardIdx DESC";
	        String query = first + whereSQL + end;
	        pstmt = conn.prepareStatement(query);
	        if (dto.getCategory() == null || dto.getCategory().equals("")) {
	            pstmt.setString(1, dto.getSearchText());
	            pstmt.setString(2, dto.getSearchText());
	            pstmt.setString(3, dto.getSearchText());
	        } else {
	            pstmt.setString(1, dto.getCategory());
	        }
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            RecipeDTO recipe = new RecipeDTO();
	            recipe.setBoardIdx(rs.getInt(1));
	            recipe.setUserId(rs.getString(2));
	            recipe.setCategory(rs.getString(3));
	            recipe.setTitle(rs.getString(4));
	            recipe.setContent(rs.getString(5));
	            recipe.setCreateDate(rs.getString(6));
	            recipe.setUpdateDate(rs.getString(7));
	            recipe.setHit(rs.getInt(8));
	            recipe.setLike(rs.getInt(9));
	            recipe.setWriter(rs.getString(10));
	            recipe.setCookHour(rs.getInt(11));
	            recipe.setCookMinute(rs.getInt(12));
	            recipe.setIngredient(rs.getString(13));
	            recipe.setThumbnail(rs.getString(14));

	            recipeList.add(recipe);
	        }

	    } catch (SQLException e) {
	        System.err.println("recipeList() ERR : " + e.getMessage());
	    } finally {
	        close(rs, pstmt, conn);
	    }
	    return recipeList;
	}

	
	/**
	 * 레시피 목록 카운트 조회
	 * @param RecipeDTO
	 * @return
	 */
	public int recipeTotalCount(RecipeDTO dto) {
		int totalCount = 0;
		String whereSQL = "";
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			if (dto.getCategory() == null || dto.getCategory().equals("")) {
	            whereSQL = "WHERE title LIKE CONCAT('%',?,'%') OR writer LIKE CONCAT('%',?,'%') OR ingredient LIKE CONCAT('%',?,'%')";
	        } else {
	            whereSQL = "WHERE category=?";
	        }
	        String first = "SELECT COUNT(boardIdx) FROM recipe_board ";
	        String query = first + whereSQL;
	        pstmt = conn.prepareStatement(query);
	        if (dto.getCategory() == null || dto.getCategory().equals("")) {
	            pstmt.setString(1, dto.getSearchText());
	            pstmt.setString(2, dto.getSearchText());
	            pstmt.setString(3, dto.getSearchText());
	        } else {
	            pstmt.setString(1, dto.getCategory());
	        }
	        
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
			
			if(totalCount < 1) {
				return 1;
			}

		} catch(Exception e) {
			System.err.println("recipeTotalCount() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		
		return totalCount;
	}
	
	/**
	 * 레시피 상세 조회
	 * @param RecipeDTO
	 * @return
	 */
	public RecipeDTO recipeDetail(RecipeDTO dto) {
		RecipeDTO recipe = null;
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			String query = "SELECT boardIdx, userId, category, title, content, createDate, updateDate, hit, like, writer, cookHour, cookMinute, ingredient, thumbnail  FROM recipe_board WHERE boardIdx=? ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dto.getBoardIdx());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				recipe = new RecipeDTO();
				recipe.setBoardIdx(rs.getInt(1));
				recipe.setUserId(rs.getString(2));
				recipe.setCategory(rs.getString(3));
				recipe.setTitle(rs.getString(4));
				recipe.setContent(rs.getString(5));
				recipe.setCreateDate(rs.getString(6));
				recipe.setUpdateDate(rs.getString(7));
				recipe.setHit(rs.getInt(8));
				recipe.setLike(rs.getInt(9));
				recipe.setWriter(rs.getString(10));
				recipe.setCookHour(rs.getInt(11));
				recipe.setCookMinute(rs.getInt(12));
				recipe.setIngredient(rs.getString(13));
				recipe.setThumbnail(rs.getString(14));
			}
			
		} catch (SQLException e) {
			System.err.println("recipeDetail() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		return recipe;
	}
	
	
	/**
	 * 레시피 수정
	 * @param RecipeDTO
	 */
	public void recipeModify(RecipeDTO recipe) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query = "UPDATE  recipe_board SET category=?, title=?, content=?, cookHour=?, cookMinute=?, ingredient=? WHERE boardIdx=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, recipe.getCategory());
			pstmt.setString(2, recipe.getTitle());
			pstmt.setString(3, recipe.getContent());
			pstmt.setInt(4, recipe.getCookHour());
			pstmt.setInt(5, recipe.getCookMinute());
			pstmt.setString(6, recipe.getIngredient());
			pstmt.setInt(7, recipe.getBoardIdx());
			System.out.println(pstmt.toString());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("recipeModify() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
	
	/**
	 * 레시피 조회수 증가 수정 처리
	 * @param RecipeDTO
	 */
	public void updateHit(RecipeDTO recipe) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query="UPDATE recipe_board SET hit=hit+1 WHERE boardIdx=?";
			this.pstmt = this.conn.prepareStatement(query);
			this.pstmt.setInt(1, recipe.getBoardIdx());
			this.pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("updateHit() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}

	/**
	 * 레시피 조회수 증가 수정 처리
	 * @param RecipeDTO
	 */
	public void updateLike(RecipeDTO recipe) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query="UPDATE recipe_board SET like=like+? WHERE boardIdx=?";
			this.pstmt = this.conn.prepareStatement(query);
			this.pstmt.setInt(1, recipe.getLike());
			this.pstmt.setInt(2, recipe.getBoardIdx());
			this.pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("updateLike() ERR : " + e.getMessage());
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
package com.yum.recipe.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yum.member.dto.BoxDTO;
import com.yum.recipe.dto.LikeDTO;
import com.yum.recipe.dto.RecipeDTO;
import com.yum.util.MySQLConnector;

public class RecipeDAO extends MySQLConnector {

	public RecipeDAO() {
	}

	/**
	 * 자신이 쓴 레시피 인데스 조회
	 * @return
	 */
	public int searchWriteBoardIdx(RecipeDTO recipe) {
		conn = null;
		pstmt = null;
		rs = null;
		int result = -1;
		try {
			conn = getConnection();
			String query = "SELECT IFNULL(MAX(boardIdx), 0) FROM recipe_board WHERE userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, recipe.getUserId());
//			System.out.println("searchWriteBoardIdx :" + pstmt.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.err.println("searchWriteBoardIdx() ERR : " + e.getMessage());
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
//			System.out.println("getNickname :" + pstmt.toString());
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
	public int recipeWrite(RecipeDTO recipe) {
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			String query = "INSERT INTO recipe_board (userId, writer, category, title, content, ingredient, thumbnail) values(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, recipe.getUserId());
			pstmt.setString(2, recipe.getWriter());
			pstmt.setString(3, recipe.getCategory());
			pstmt.setString(4, recipe.getTitle());
			pstmt.setString(5, recipe.getContent());
			pstmt.setString(6, recipe.getIngredient());
			pstmt.setString(7, recipe.getThumbnail());
//			System.out.println("recipeWrite(1) :" + pstmt.toString());
			int result = pstmt.executeUpdate();
			
			if(result == 1) {
				query = "SELECT IFNULL(MAX(boardIdx), 0) FROM recipe_board WHERE userId=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, recipe.getUserId());
//				System.out.println("recipeWrite(2) :" + pstmt.toString());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					return rs.getInt(1);
				}
			}
		} catch (SQLException e) {
			System.err.println("recipeWrite() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
		return -1;
	}

	/**
	 * 레시피 리스트 조회
	 * @param RecipeDTO
	 * @return
	 */
	public List<RecipeDTO> recipeList(RecipeDTO dto) {
	    List<RecipeDTO> recipeList = new ArrayList<>();
	    conn = null;
	    pstmt = null;
	    rs = null;
	    try {
	        conn = getConnection();
	        String first = "SELECT boardIdx, userId, writer, category, title, content, createDate, updateDate, hit, `like`, ingredient, thumbnail  FROM recipe_board ";
	        String whereSQL = "WHERE category=? or title LIKE CONCAT('%',?,'%') OR writer LIKE CONCAT('%',?,'%') OR ingredient LIKE CONCAT('%',?,'%') ";
	        String end = "ORDER BY boardIdx DESC LIMIT ?,?";
	        String query = first + whereSQL + end;
	        pstmt = conn.prepareStatement(query);
            pstmt.setString(1, dto.getCategory());
        	pstmt.setString(2, dto.getSearchText());
        	pstmt.setString(3, dto.getSearchText());
        	pstmt.setString(4, dto.getSearchText());
        	pstmt.setInt(5, dto.getStartIndex());
        	pstmt.setInt(6, dto.getListCount());
//			System.out.println("recipeList :" + pstmt.toString());
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            RecipeDTO recipe = new RecipeDTO();
	            recipe.setBoardIdx(rs.getInt(1));
				recipe.setUserId(rs.getString(2));
				recipe.setWriter(rs.getString(3));
				recipe.setCategory(rs.getString(4));
				recipe.setTitle(rs.getString(5));
				recipe.setContent(rs.getString(6));
				recipe.setCreateDate(rs.getString(7));
				recipe.setUpdateDate(rs.getString(8));
				recipe.setHit(rs.getInt(9));
				recipe.setLike(rs.getInt(10));
				recipe.setIngredient(rs.getString(11));
				recipe.setThumbnail(rs.getString(12));

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
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			String first = "SELECT COUNT(boardIdx) FROM recipe_board ";
			String whereSQL = "WHERE category=? or title LIKE CONCAT('%',?,'%') OR writer LIKE CONCAT('%',?,'%') OR ingredient LIKE CONCAT('%',?,'%')";
	        String query = first + whereSQL;
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, dto.getCategory());
            pstmt.setString(2, dto.getSearchText());
            pstmt.setString(3, dto.getSearchText());
            pstmt.setString(4, dto.getSearchText());
//			System.out.println("recipeTotalCount :" + pstmt.toString());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
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
			String query = "SELECT boardIdx, userId, writer, category, title, content, createDate, updateDate, hit, `like`, ingredient, thumbnail FROM recipe_board WHERE boardIdx=? ";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dto.getBoardIdx());
//			System.out.println("recipeDetail :" + pstmt.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				recipe = new RecipeDTO();
				recipe.setBoardIdx(rs.getInt(1));
				recipe.setUserId(rs.getString(2));
				recipe.setWriter(rs.getString(3));
				recipe.setCategory(rs.getString(4));
				recipe.setTitle(rs.getString(5));
				recipe.setContent(rs.getString(6));
				recipe.setCreateDate(rs.getString(7));
				recipe.setUpdateDate(rs.getString(8));
				recipe.setHit(rs.getInt(9));
				recipe.setLike(rs.getInt(10));
				recipe.setIngredient(rs.getString(11));
				recipe.setThumbnail(rs.getString(12));
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
			String query = "UPDATE  recipe_board SET category=?, title=?, content=?, ingredient=?, thumbnail=? WHERE boardIdx=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, recipe.getCategory());
			pstmt.setString(2, recipe.getTitle());
			pstmt.setString(3, recipe.getContent());
			pstmt.setString(4, recipe.getIngredient());
			pstmt.setString(5, recipe.getThumbnail());
			pstmt.setInt(6, recipe.getBoardIdx());
//			System.out.println("recipeModify :" + pstmt.toString());
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
//			System.out.println("updateHit :" + pstmt.toString());
			this.pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("updateHit() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}

	/**
	 * 레시피 테이블의 좋아요 수 수정 처리
	 * @param RecipeDTO
	 */
	public void updateLike(RecipeDTO recipe, LikeDTO likeDto) {
		String query = "";
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			if(likeDto.isLike()) {	//이미 좋아요 눌렀었으면 true -1
				query = "UPDATE recipe_board SET `like`=`like`-1 WHERE boardIdx=?";
			} else {
				query = "UPDATE recipe_board SET `like`=`like`+1 WHERE boardIdx=?";
			}
			this.pstmt = this.conn.prepareStatement(query);
			this.pstmt.setInt(1, recipe.getBoardIdx());
//			System.out.println("updateLike :" + pstmt.toString());
			this.pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("updateLike() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}

	/**
	 * 유저 레시피 좋아요 여부 조회
	 * @param LikeDTO
	 * @return
	 */
	public boolean isLiked(LikeDTO likeDto) {
		boolean result = false;
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			String query = "SELECT * FROM likes WHERE boardIdx=? and userId = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, likeDto.getBoardIdx());
			pstmt.setString(2, likeDto.getUserId());
//			System.out.println("isLiked :" + pstmt.toString());
			rs = pstmt.executeQuery();
			result = rs.next();
		} catch (SQLException e) {
			System.err.println("isLiked() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		return result;
	}

	/**
	 * 라이크 테이블의 좋아요 수정
	 * @param LikeDTO
	 */
	public void updateLike(LikeDTO likeDto) {
		String query = "";
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			if(likeDto.isLike()) { //이미 좋아요를 눌렀었으면 true => 삭제
				query = "DELETE FROM likes WHERE boardIdx=? and userId = ?";
			}else {
				query = "INSERT INTO likes (boardIdx, userId) values(?,?)";
			}
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, likeDto.getBoardIdx());
			pstmt.setString(2, likeDto.getUserId());
//			System.out.println("updateLike :" + pstmt.toString());
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("updateLike() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
	
	/**
	 * like 조회
	 * @param RecipeDTO
	 * @return
	 */
	public int selectLike(RecipeDTO recipe) {
		conn = null;
		pstmt = null;
		rs = null;
		int result = -1;
		try {
			conn = getConnection();
			String query = "SELECT `like` FROM recipe_board WHERE boardIdx=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recipe.getBoardIdx());
//			System.out.println("selectLike :" + pstmt.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.err.println("selectLike() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		return result;
	}
	
	/**
	 * 레시피 삭제
	 * @param RecipeDTO
	 */
	public void deleteRecipe(RecipeDTO recipe) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query = "DELETE FROM recipe_board WHERE boardIdx=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, recipe.getBoardIdx());
			System.out.println("deleteRecipe :" + pstmt.toString());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("deleteRecipe() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}

	/**
	 * 보관함 보관 여부 조회
	 * @param BoxDTO
	 */
	public boolean isStored(BoxDTO box) {
		boolean result = false;
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			String query = "SELECT * FROM storage_box WHERE boardIdx=? and userId = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, box.getBoardIdx());
			pstmt.setString(2, box.getUserId());
//			System.out.println("isStored :" + pstmt.toString());
			rs = pstmt.executeQuery();
			result = rs.next();
		} catch (SQLException e) {
			System.err.println("isStored() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		return result;
		}

	/**
	 * 보관함에 추가
	 * @param BoxDTO
	 */
	public void addStorageBox(BoxDTO box) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query = "INSERT INTO storage_box (boardIdx, userId) values(?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, box.getBoardIdx());
			pstmt.setString(2, box.getUserId());
//			System.out.println("addStorageBox :" + pstmt.toString());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("addStorageBox() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
}
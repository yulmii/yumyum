package com.yum.main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.yum.recipe.dto.RecipeDTO;
import com.yum.util.MySQLConnector;

public class MainDAO extends MySQLConnector {
	
	public MainDAO() {
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
	
	/**
	 * 메인페이지 카테고리별 전체 조회
	 * @return
	 */
	public Map<String, List<RecipeDTO>> selectCtgAll(){
		Map<String, List<RecipeDTO>> ctg = new HashMap<String, List<RecipeDTO>>();
		
		String query1 = "select * from ( select A.*, @rownum := @rownum + 1 as rnum from ( select boardIdx, title, writer, hit, thumbnail from recipe_board where category =  '한식' order by hit desc) A, (SELECT @rownum := 0) r ) ranking where rnum < 11";
		String query2 = "select * from (select A.*, @rownum := @rownum + 1 as rnum from ( select boardIdx, title, writer, hit, thumbnail from recipe_board where category =  '중식' order by hit desc) A, (SELECT @rownum := 0) r ) ranking where rnum < 11";
		String query3 = "select * from (select A.*, @rownum := @rownum + 1 as rnum from ( select boardIdx, title, writer, hit, thumbnail from recipe_board where category =  '일식' order by hit desc) A, (SELECT @rownum := 0) r ) ranking where rnum < 11";
		String query4 = "select * from (select A.*, @rownum := @rownum + 1 as rnum from ( select boardIdx, title, writer, hit, thumbnail from recipe_board where category =  '양식' order by hit desc) A, (SELECT @rownum := 0) r ) ranking where rnum < 11";
		
		ctg.put("hansik", selectCtg(query1));
		ctg.put("jungsik", selectCtg(query2));
		ctg.put("ilsik", selectCtg(query3));
		ctg.put("yangsik", selectCtg(query4));
		
		close(rs, pstmt, conn);
		return ctg;
	}
	
	
	//각 카테고리별 목록 조회(한식,중식,일식,양식)
	public List<RecipeDTO> selectCtg(String query) {
		List<RecipeDTO> ctgList = new ArrayList<RecipeDTO>();
		RecipeDTO recipe;
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				recipe = new RecipeDTO();
				recipe.setBoardIdx(rs.getInt("boardIdx"));
				recipe.setTitle(rs.getString("title"));
				recipe.setWriter(rs.getString("writer"));
				recipe.setHit(rs.getInt("hit"));
				recipe.setThumbnail(rs.getString("thumbnail"));
				
				ctgList.add(recipe);
			}
		} catch(Exception e) {
			System.err.println("selectCtgAll() ====> " + e.getMessage());
			close(rs, pstmt, conn);
		} 
		
		return ctgList;
	}
}
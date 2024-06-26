package com.yum.member.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yum.member.dto.BoxDTO;
import com.yum.member.dto.MemberDTO;
import com.yum.recipe.dto.RecipeDTO;
import com.yum.util.MySQLConnector;

public class MemberDAO extends MySQLConnector {
	
	public MemberDAO() {
		
	}


	
	/**
	 * 1. 회원가입 시 아이디 중복 확인 (회원테이블에서 select)
	 * @param String
	 * @return boolean
	 */
	public boolean checkId(String id) {
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			String query = "SELECT userId FROM member WHERE userId = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true; // 중복 아이디 존재
			}
		} catch (SQLException e) {
			System.err.println("checkId() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		
		return false; // 중복 아이디 없음
	}
	
	/**
	 * 1. 회원가입 시 닉네임 중복 확인 (회원테이블에서 select)
	 * @param String
	 * @return boolean
	 */
	public boolean checkNick(String nick) {
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			String query = "SELECT nickname FROM member WHERE nickname = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nick);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return true; // 중복 닉네임 존재
			}
		} catch (SQLException e) {
			System.err.println("checkNick() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		
		return false; // 중복 닉네임 없음
	}
	
	/**
	 * 2. 회원가입 시 회원 등록 (회원테이블에 insert)
	 * @param MemberDTO
	 * @return
	 */
	public void joinUser(MemberDTO member) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query = "INSERT INTO member (userId, userName, nickname, pwd, email) VALUES (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserName());
			pstmt.setString(3, member.getNickname());
			pstmt.setString(4, member.getPwd());
			pstmt.setString(5, member.getEmail());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("joinUser() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
	// 로그인된 회원의 정보 얻기
	public MemberDTO viewUser(MemberDTO member) {
		conn = null;
		pstmt = null;
		rs = null;
		try {
			conn = getConnection();
			String query = "SELECT userId, userName, nickname, pwd, email, joinDate FROM member WHERE userId = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member.setUserId(rs.getString("userId"));
				member.setUserName(rs.getString("userName"));
				member.setNickname(rs.getString("nickname"));
				member.setPwd(rs.getString("pwd"));
				member.setEmail(rs.getString("email"));
				member.setJoinDate(rs.getString("joinDate"));
			}
		} catch (SQLException e) {
			System.err.println("viewUser() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		return member;
	}
	
	/**
	 * 3-1. 회원탈퇴 시 회원 삭제 (회원테이블에서 delete)
	 * @param String
	 * @return
	 */
	public void deleteUser(MemberDTO member) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query = "DELETE FROM member WHERE userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("deleteUser() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
	
	/**
	 * 3-2. 회원탈퇴 시 탈퇴회원 등록 (탈퇴회원테이블에 insert)
	 * @param MemberDTO
	 * @return
	 */
	public void addOutUser(MemberDTO member) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query = "INSERT INTO out_member (userId, userName, nickname, pwd, email, joinDate) VALUES (?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserName());
			pstmt.setString(3, member.getNickname());
			pstmt.setString(4, member.getPwd());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getJoinDate());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("addOutUser() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
	
	/**
	 * 4. 로그인 (회원테이블에서 select, admin = false 시)
	 * @param MemberDTO
	 * @return boolean
	 */
	public boolean loginUser(MemberDTO member) {
		conn = null;
		pstmt = null;
		rs = null;
		boolean result = false;
		try {
			conn = getConnection();
			String query = "SELECT * FROM member WHERE userId = ? and pwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getPwd());
			
			rs = pstmt.executeQuery();
			
			result = rs.next();
		} catch (SQLException e) {
			System.err.println("loginUser() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		return result;
		
	}

//	5. 관리자 로그인 (회원테이블에서 select, admin = true 시)
//	6. 마이페이지 - 회원정보 수정 (회원테이블 update)
	/**
	 * 회원정보 수정 (회원테이블에 insert)
	 * @param MemberDTO
	 * @return
	 */
	public void modifyUser(MemberDTO member) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query = "UPDATE member SET userName=?, nickname=?, pwd=?, email=? WHERE userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserName());
			pstmt.setString(2, member.getNickname());
			System.out.println(member.getNickname());
			pstmt.setString(3, member.getPwd());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getUserId());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println("modifyUser() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
	
//	7. 마이페이지 - 내 글 확인 (레시피테이블 select id=특정값)
	public List<RecipeDTO> recipeSearch(String id, RecipeDTO dto) {
		conn = null;
		pstmt = null;
		rs = null;
		List<RecipeDTO> recipeList = null; 	// 리턴용 레시피 리스트
		RecipeDTO recipe = new RecipeDTO();
		try {
			conn = getConnection();
			String query = "select boardIdx, title, hit, thumbnail from recipe_board where userId=?";
			String end = "ORDER BY boardIdx DESC LIMIT ?,?";
			pstmt = conn.prepareStatement(query + end);
			pstmt.setString(1, id);
			pstmt.setInt(2, dto.getStartIndex());
        	pstmt.setInt(3, dto.getListCount());
			// 조회 실행
			rs = pstmt.executeQuery();
			
			// LIST 객체에 저장하기 위한 객체 생성
			recipeList = new ArrayList<RecipeDTO>();

			while(rs.next()) {
				recipe = new RecipeDTO();	// 각 레코드를 하나의 객체로
				recipe.setBoardIdx(rs.getInt("boardIdx"));
				recipe.setTitle(rs.getString("title"));
				recipe.setHit(rs.getInt("hit"));
				recipe.setThumbnail(rs.getString("thumbnail"));
				recipeList.add(recipe);	// ArrayList에 추가
			}	// while() END
		} catch (Exception e) {		// SQLException
			e.printStackTrace();		// System.out.println(e.getMessage())
		} finally {
			// 사용한 객체 종료
			close(rs, pstmt, conn);
		}
		return recipeList;
	}
	
//	8. 마이페이지 - 보관함 확인 (보관함테이블 select)
	public List<RecipeDTO> myBoxSearch(String id, RecipeDTO dto) {
		conn = null;
		pstmt = null;
		rs = null;
		List<RecipeDTO> recipeList = null; 	// 리턴용 레시피 리스트
		// 레시피 객체
		RecipeDTO recipe = new RecipeDTO();
		try {
			conn = getConnection();
			// 쿼리: storage_box 중 userId가 id 인 데이터의 boardIdx를 조회.
			// 이 때, recipe_board 에서 일치하는 boardIdx를 찾는다.
			String query = "SELECT r.* from recipe_board r, storage_box s where r.boardIdx=s.boardIdx and s.userId=?";
			String end = "ORDER BY s.boxIdx DESC LIMIT ?,?";
			pstmt = conn.prepareStatement(query + end);
			pstmt.setString(1, id);
			pstmt.setInt(2, dto.getStartIndex());
        	pstmt.setInt(3, dto.getListCount());
			// 조회 실행
			rs = pstmt.executeQuery();
			
			// LIST 객체에 저장하기 위한 객체 생성
			recipeList = new ArrayList<RecipeDTO>();

			while(rs.next()) {
				recipe = new RecipeDTO();	// 각 레코드를 하나의 객체로
				recipe.setBoardIdx(rs.getInt("r.boardIdx"));
				recipe.setWriter(rs.getString("r.writer"));
				recipe.setTitle(rs.getString("r.title"));
				recipe.setThumbnail(rs.getString("r.thumbnail"));
				recipeList.add(recipe);	// ArrayList에 추가
			}	// while() END
		} catch (Exception e) {		// SQLException
			e.printStackTrace();		// System.out.println(e.getMessage())
		} finally {
			// 사용한 객체 종료
			close(rs, pstmt, conn);
		}
		return recipeList;
	}

	/**
	 * 보관함에서 지우기(delete)
	 * @param MemberDTO
	 * @return
	 */
	public void deleteBox(BoxDTO box) {
		conn = null;
		pstmt = null;
		try {
			conn = getConnection();
			String query = "DELETE FROM storage_box WHERE userId=? AND boardIdx=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, box.getUserId());
			pstmt.setInt(2, box.getBoardIdx());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.err.println("deleteBox() ERR : " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
}

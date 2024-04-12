package com.yum.member.dao;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		try {
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
		try {
			String query = "SELECT nickname FROM member WHERE nickname = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nick);
			
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
	 * 2. 회원가입 시 회원 등록 (회원테이블에 insert)
	 * @param MemberDTO
	 * @return
	 */
	public void joinUser(MemberDTO member) {
		try {
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
	
	/**
	 * 3-1. 회원탈퇴 시 회원 삭제 (회원테이블에서 delete)
	 * @param String
	 * @return
	 */
	public void deleteUser(String id) {
		try {
			String query = "DELETE FROM member WHERE userId=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
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
			System.out.println("bb");
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
//	7. 마이페이지 - 내 글 확인 (레시피테이블 select id=특정값)
	public List<RecipeDTO> recipeSearch(String id) {
		conn = null;
		pstmt = null;
		rs = null;
		List<RecipeDTO> recipeList = null; 	// 리턴용 레시피 리스트
		RecipeDTO recipe = new RecipeDTO();
		try {
			conn = getConnection();
			String query = "select boardIdx, title, hit, `like`, createDate from recipe_board where userId=? order by boardIdx desc";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			// 조회 실행
			rs = pstmt.executeQuery();
			
			// LIST 객체에 저장하기 위한 객체 생성
			recipeList = new ArrayList<RecipeDTO>();

			while(rs.next()) {
				recipe = new RecipeDTO();	// 각 레코드를 하나의 객체로
				recipe.setBoardIdx(rs.getInt("boardIdx"));
				recipe.setTitle(rs.getString("title"));
				recipe.setHit(rs.getInt("hit"));
				recipe.setLike(rs.getInt("like"));
				recipe.setCreateDate(rs.getString("createDate"));
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
	public List<RecipeDTO> myBoxSearch() {
		conn = null;
		pstmt = null;
		rs = null;
		List<RecipeDTO> recipeList = null; 	// 리턴용 레시피 리스트
		RecipeDTO recipe = new RecipeDTO();
		try {
			conn = getConnection();
			String query = "select r.boardIdx, m.nickname, r.title, r.hit, r.createDate from recipe_board r, storage_box s, member m where r.boardIdx=s.boardIdx and s.userId=m.userId order by r.boardIdx desc";
//			(select m.nickname from storage_box s, member m where s.userId=m.userId);
			pstmt = conn.prepareStatement(query);
			// 조회 실행
			rs = pstmt.executeQuery();
			
			// LIST 객체에 저장하기 위한 객체 생성
			recipeList = new ArrayList<RecipeDTO>();

			while(rs.next()) {
				recipe = new RecipeDTO();	// 각 레코드를 하나의 객체로
				recipe.setBoardIdx(rs.getInt("r.boardIdx"));
				recipe.setNickname(rs.getString("m.nickname"));
				recipe.setTitle(rs.getString("r.title"));
				recipe.setHit(rs.getInt("r.hit"));
				recipe.setCreateDate(rs.getString("r.createDate"));
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
}
package com.yum.member.dao;

import java.sql.SQLException;

import com.yum.member.dto.MemberDTO;
import com.yum.util.MySQLConnector;

public class MemberDAO extends MySQLConnector {
	
	public MemberDAO() {
		getConnection();
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
		try {
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
	 * @param String
	 * @return MemberDTO
	 */
	public boolean loginUser(String id, String pw) {
		boolean result = false;
		try {
			String query = "SELECT * FROM member WHERE userId = ?, pwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
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
	public MemberDTO recipeSearch(String id, String pw) {
		MemberDTO member = new MemberDTO();
		return member;
	}
//	8. 마이페이지 - 보관함 확인 (보관함테이블 select id=특정값)
	
}
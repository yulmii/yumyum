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
	public MemberDTO loginUser(String id, String pw) {
		MemberDTO member = new MemberDTO();
		try {
			String query = "SELECT * FROM member WHERE userId = ?, pwd = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member.setUserId(rs.getString("userId"));
				member.setUserName(rs.getString("userName"));
				member.setNickname(rs.getString("nickName"));
				member.setPwd(rs.getString("pwd"));
				member.setEmail(rs.getString("email"));
				member.setJoinDate(rs.getString("joinDate"));
				member.setAdmin(rs.getBoolean("admin"));
			}
		} catch (SQLException e) {
			System.err.println("loginUser() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		return member;
	}

//	5. 관리자 로그인 (회원테이블에서 select, admin = true 시)
//	6. 마이페이지 - 회원정보 수정 (회원테이블 update)
//	7. 마이페이지 - 내 글 확인 (레시피테이블 select id=특정값)
//	8. 마이페이지 - 보관함 확인 (보관함테이블 select id=특정값)
	
}
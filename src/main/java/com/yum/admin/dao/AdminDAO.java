package com.yum.admin.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yum.member.dto.MemberDTO;
import com.yum.note.dto.NoteDTO;
import com.yum.recipe.dto.RecipeDTO;
import com.yum.util.MySQLConnector;

public class AdminDAO extends MySQLConnector {
	
	public AdminDAO() {
		getConnection();
	}

	
	/**
	 * 관리자 메인 페이지 회원 관리 게시판 (5개 까지 출력)
	 * @param String
	 * @return
	 */
	public List<MemberDTO> listMembers() {
		List<MemberDTO> membersList = new ArrayList<MemberDTO>();
		try {
			
			String query = "select * from  member order by joinDate desc";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			
			MemberDTO member = null;
			while (rs.next()) {
				member = new MemberDTO();
				member.setUserId(rs.getString("userId")); 
				member.setUserName(rs.getString("userName"));
				member.setNickname(rs.getString("nickname"));
				member.setPwd(rs.getString("pwd"));
				member.setEmail(rs.getString("email"));
				member.setJoinDate(rs.getString("joinDate"));
				member.setAdmin(rs.getString("admin"));
				
				membersList.add(member);
				System.out.println(member);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return membersList;
	}
	
	
	/**
	 * 관리자 메인 페이지 레시피 관리 게시판 (5개 까지 출력)
	 * @param String
	 * @return
	 */
	public List<RecipeDTO> listRecipe_board() {
		List<RecipeDTO> recipeList = new ArrayList<RecipeDTO>();
		try {
			
			String query = "select * from recipe_board order by boardIdx desc";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			RecipeDTO recipe = null;
			while (rs.next()) {
				recipe = new RecipeDTO();
				recipe.setBoardIdx(rs.getInt("boardIdx"));
				recipe.setUserId(rs.getString("userId"));
				recipe.setCategory(rs.getString("category"));
				recipe.setTitle(rs.getString("title"));
				recipe.setContent(rs.getString("content"));
				recipe.setCreateDate(rs.getString("createDate"));
				recipe.setUpdateDate(rs.getString("updateDate"));
				recipe.setHit(rs.getInt("hit"));
				recipe.setLike(rs.getInt("like"));
//				recipe.setNickname(rs.getString("nickname"));
				recipe.setCookHour(rs.getInt("cookHour"));
				recipe.setCookMinute(rs.getInt("cookMinute"));
				recipe.setIngredient(rs.getString("ingredient"));
				recipe.setThumbnail(rs.getString("thumbnail"));
				
				recipeList.add(recipe);
				System.out.println(recipe);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return recipeList;
	}
	
	/**
	 * 관리자 메인 페이지 공지사항 관리 게시판 (5개 까지 출력)
	 * @param String
	 * @return
	 */
	public List<NoteDTO> listNote() {
		List<NoteDTO> noteList = new ArrayList<NoteDTO>();
		try {
			
			String query = "select * from  note_board order by noteIdx desc";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			NoteDTO note = null;
			while (rs.next()) {
				note = new NoteDTO();
				
				note.setNoteIdx(rs.getInt("noteIdx"));
				note.setTitle(rs.getString("title"));
				note.setContent(rs.getString("content"));
				note.setCreateDate(rs.getString("createDate"));
				note.setWriter(rs.getString("writer"));
				
				noteList.add(note);
				System.out.println(note);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return noteList;
	}
	
	
	
	/**
	 * 관리자 회원정보 수정 조회
	 * @param String
	 * @return
	 */
	public MemberDTO memberInfo(String id) {
		MemberDTO member = new MemberDTO();

		try {
			String query = "select * from member where userId=?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberDTO();
				member.setUserId(rs.getString("userId")); 
				member.setUserName(rs.getString("userName"));
				member.setNickname(rs.getString("nickname"));
				member.setPwd(rs.getString("pwd"));
				member.setEmail(rs.getString("email"));
				member.setJoinDate(rs.getString("joinDate"));
				member.setAdmin(rs.getString("admin"));
				System.out.println("회원수정 페이지 조회 성공");
			}

		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			close(rs, pstmt, null);
		}
		
		return member;
	}
	
	/**
	 * 관리자 회원정보 수정
	 * @param String
	 * @return
	 */
	public void memberModify(MemberDTO member) {
	    try {
	        String query = "UPDATE member SET userName=?, nickname=?, pwd=?, email=?, admin=? WHERE userId=?";
	        
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, member.getUserName());
	        pstmt.setString(2, member.getNickname());
	        pstmt.setString(3, member.getPwd());
	        pstmt.setString(4, member.getEmail());
	        pstmt.setString(5, member.getAdmin());
	        pstmt.setString(6, member.getUserId());

	        int result = pstmt.executeUpdate();
	        
	        if(result > 0) {
	            System.out.println("회원 수정 성공");
	        }

	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	    } finally {
	        close(null, pstmt, conn);
	    }
	}
	
	
	/**
	 * 관리자 페이지 회원탈퇴 시 탈퇴회원 등록
	 * @param member 탈퇴할 회원의 정보를 담은 MemberDTO 객체
	 */
	public void addOutAdUser(MemberDTO member) {
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
	        System.err.println(e.getMessage());
	    } finally {
	        close(null, pstmt, null);
	    }
	}

	/**
	 * 관리자 회원 탈퇴 레시피 삭제
	 * @param String
	 * @return
	 */
	public void deleteRecipeRecords(String userId) {
	    try {
	        String query = "DELETE FROM recipe_board WHERE userId=?";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, userId);
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	    } finally {
	        close(null, pstmt, null);
	    }
	}

	/**
	 * 관리자 페이지 회원탈퇴 시 회원 삭제
	 * @param id 삭제할 회원의 아이디
	 * @param deletedMember 삭제할 회원의 정보를 담은 MemberDTO 객체
	 */
	public void deleteAdUser(String id, MemberDTO deletedMember) {
	    try {
	        // member 테이블에서 회원 삭제
	        String queryDeleteMember = "DELETE FROM member WHERE userId=?";
	        pstmt = conn.prepareStatement(queryDeleteMember);
	        pstmt.setString(1, id);
	        pstmt.executeUpdate();

	        // recipe_board 테이블에서 해당 회원의 레시피 삭제
	        String queryDeleteRecipe = "DELETE FROM recipe_board WHERE userId=?";
	        pstmt = conn.prepareStatement(queryDeleteRecipe);
	        pstmt.setString(1, id);
	        pstmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        System.err.println(e.getMessage());
	    } finally {
	        close(null, pstmt, null);
	    }
	}


	
	/**
	 * 관리자 레시피 삭제
	 * @param String
	 * @return
	 */
	public void delRecipe(String id) {
		
		try {
			String query = "delete from recipe_board where boardIdx=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
		
	}
	
	
	/**
	 * 관리자 공지사항 수정 조회
	 * @param String
	 * @return
	 */
	public NoteDTO noteInfo(String id) {
		NoteDTO note = new NoteDTO();
		
		try {
			String query = "select * from note_board where noteIdx=?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				note = new NoteDTO();
				note.setNoteIdx(rs.getInt("noteIdx"));
				note.setTitle(rs.getString("title"));
				note.setContent(rs.getString("content"));
				note.setCreateDate(rs.getString("createDate"));
				note.setWriter(rs.getString("writer"));
				
				System.out.println("공지사항 페이지 조회 성공");
			}
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		
		return note;
	}
	
	/**
	 * 관리자 공지사항 수정
	 * @param String
	 * @return
	 */
	public void noteModify(NoteDTO note) {
		try {
			String query = "update note_board set title=?, content=?, writer=? where noteIdx=?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, note.getTitle());
			pstmt.setString(2, note.getContent());
			pstmt.setString(3, note.getWriter());
			pstmt.setInt(4, note.getNoteIdx());

			int result = pstmt.executeUpdate();
			
			if(result > 0) {
				System.out.println("공지사항 수정 성공");
			}
			
		} catch (SQLException e) {
			System.err.println(e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
	
}

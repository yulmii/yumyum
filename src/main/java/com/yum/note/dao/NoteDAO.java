package com.yum.note.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.yum.note.dto.NoteDTO;
import com.yum.util.MySQLConnector;

public class NoteDAO extends MySQLConnector {
	
	public NoteDAO() {
		getConnection();
	}

	/**
	 * 공지사항 전체 조회
	 * @param int startIndex, int listCount
	 * @return
	 */
	public List<NoteDTO> selectNoteList(int startIndex, int listCount) {
		List<NoteDTO> noteList = new ArrayList<NoteDTO>();
		try {
			String query = "select * from (select A.*, @rownum := @rownum + 1 as rnum from ( select noteIdx, title, date_format(createDate, '%Y-%m-%d') as createDate, writer from note_board order by noteIdx) A, (select @rownum := 0) r) ranking order by rnum desc limit ?, ?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startIndex);
			pstmt.setInt(2, listCount);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				NoteDTO note = new NoteDTO();
				note.setNo(rs.getInt("rnum"));
				note.setNoteIdx(rs.getInt("noteIdx"));
				note.setTitle(rs.getString("title"));
				note.setCreateDate(rs.getString("createDate"));
				note.setWriter(rs.getString("writer"));
				
				noteList.add(note);
			}
		} catch (SQLException e) {
			System.err.println("checkId() ERR : " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		
		return noteList;
	}
	
	
	/**
	 * 공지사항 전체 카운트 조회
	 * @return
	 */
	public int noteTotalCount() {
		int totalCount = 0;
		try {
			String query = "select count(noteIdx) as count from note_board";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt("count");
			}
			
			if(totalCount < 1) {
				return 1;
			}

		} catch(Exception e) {
			System.err.println("noteTotalCount ======> " + e.getMessage());
			close(rs, pstmt, conn);
		} 
		
		return totalCount;
	}
	
	
	/**
	 * 공지사항 상세 조회
	 * @return
	 */
	public NoteDTO noteSelectOne(int no) {
		NoteDTO note = new NoteDTO();
		try {
			String query = "select noteIdx, title, writer, date_format(createDate, '%Y-%m-%d') as createDate, content from note_board where noteIdx=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				note.setNoteIdx(rs.getInt("noteIdx"));
				note.setTitle(rs.getString("title"));
				note.setWriter(rs.getString("writer"));
				note.setCreateDate(rs.getString("createDate"));
				note.setContent(rs.getString("content"));
			}

		} catch(Exception e) {
			System.err.println("noteTotalCount ======> " + e.getMessage());
		} finally {
			close(rs, pstmt, conn);
		}
		
		return note;
	}
}
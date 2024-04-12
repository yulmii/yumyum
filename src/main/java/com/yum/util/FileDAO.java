package com.yum.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FileDAO extends MySQLConnector{

	public FileDAO() {
		getConnection();
	}

	/**
	 * DB 파일 저장
	 * @param String fileName, int id
	 * @return
	 */
	public void uploadFile(String fileName, int id, String name) {
		try {
			String query = "insert into image(fileName, boardId, boardName) values(?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fileName);
			pstmt.setInt(2, id);
			pstmt.setString(3, name);
			int result = pstmt.executeUpdate();
			
			if(result < 1) {
				System.err.println("파일 DB 저장 오류!!!!");
			}
		} catch (SQLException e) {
			System.err.println("uploadFile ======> " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}
	}
	
	
	/**
	 * DB 파일명 전체 조회
	 * @param String fileName
	 * 
	 */
	public List<String> selectFilesList(int id, String name) {
		List<String> imgList = new ArrayList<String>();
		try {
			String query = "select fileName from image where boardId = ? and boardName = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				imgList.add(rs.getString("fileName"));
			}
			
		} catch (SQLException e) {
			System.err.println("uploadFile ======> " + e.getMessage());
			close(rs, pstmt, conn);
		} 
		
		return imgList;
	}
	
	/**
	 * 게시글 삭제 시 모든 이미지 삭제
	 * @param String fileName
	 * 
	 */
	public void deleteFileList(int id, String name) {
		try {
			String query = "delete from image where boardId = ? and boardName = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("uploadFile ======> " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}

	}
	
	
	/**
	 * 이미지 단일 삭제
	 * @param String fileName
	 * 
	 */
	public void deleteFile(String title, String name) {
		try {
			String query = "delete from image where fileName = ? and boardName = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, name);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.err.println("uploadFile ======> " + e.getMessage());
		} finally {
			close(null, pstmt, conn);
		}

	}
}

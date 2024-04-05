package com.yum.member.dto;

public class BoxDTO {

	private int boxIdx;
	private String userId;
	private int boardIdx;
	
	public BoxDTO() {
		// TODO Auto-generated constructor stub
	}

	public int getBoxIdx() {
		return boxIdx;
	}

	public void setBoxIdx(int boxIdx) {
		this.boxIdx = boxIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	@Override
	public String toString() {
		return "BoxDTO [boxIdx=" + boxIdx + ", userId=" + userId + ", boardIdx=" + boardIdx + "]";
	}
	
}

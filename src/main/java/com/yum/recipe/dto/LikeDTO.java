package com.yum.recipe.dto;

public class LikeDTO {
	
	private int likeIdx;
	private int boardIdx;
	private String userId;
	private boolean like = false;
	
	public LikeDTO() {

	}

	public int getLikeIdx() {
		return likeIdx;
	}

	public void setLikeIdx(int likeIdx) {
		this.likeIdx = likeIdx;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public boolean isLike() {
		return like;
	}

	public void setLike(boolean like) {
		this.like = like;
	}

	@Override
	public String toString() {
		return "LikeDTO [likeIdx=" + likeIdx + ", boardIdx=" + boardIdx + ", userId=" + userId + ", like=" + like + "]";
	}

}

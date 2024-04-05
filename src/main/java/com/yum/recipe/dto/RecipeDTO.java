package com.yum.recipe.dto;

public class RecipeDTO {

	private int boardIdx;
	private String userId;
	private String category;
	private String title;
	private String content;
	private String createDate;
	private String updateDate;
	private int hit;
	private int like;
	private String nickname;
	private int cookHour;
	private int cookMinute;
	private String ingredient;
	private String thumbnail;

	public RecipeDTO() {
		// TODO Auto-generated constructor stub
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getLike() {
		return like;
	}

	public void setLike(int like) {
		this.like = like;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getCookHour() {
		return cookHour;
	}

	public void setCookHour(int cookHour) {
		this.cookHour = cookHour;
	}

	public int getCookMinute() {
		return cookMinute;
	}

	public void setCookMinute(int cookMinute) {
		this.cookMinute = cookMinute;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	@Override
	public String toString() {
		return "RecipeDTO [boardIdx=" + boardIdx + ", userId=" + userId + ", category=" + category + ", title=" + title
				+ ", content=" + content + ", createDate=" + createDate + ", updateDate=" + updateDate + ", hit=" + hit
				+ ", like=" + like + ", nickname=" + nickname + ", cookHour=" + cookHour + ", cookMinute=" + cookMinute
				+ ", ingredient=" + ingredient + ", thumbnail=" + thumbnail + "]";
	}

	
}

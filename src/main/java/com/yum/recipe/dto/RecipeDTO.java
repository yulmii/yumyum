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
	private String writer;
	private String ingredient;
	private String thumbnail;
	private String searchText;		//검색어
	private int totalCount;		//게시글 전체 수
	private int listCount = 15;		//한 페이지당 보여줄 게시글 수	
	private int startIndex = 1;		//페이지 시작 게시글 번호
	private int endIndex = 1;		//페이지 종료 게시글 번호
	private int pagePerBlock = 10;	//하단 페이지 링크 개수
	private int pageNum = 1;		//현재 페이지 번호

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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	@Override
	public String toString() {
		return "RecipeDTO [boardIdx=" + boardIdx + ", userId=" + userId + ", category=" + category + ", title=" + title
				+ ", content=" + content + ", createDate=" + createDate + ", updateDate=" + updateDate + ", hit=" + hit
				+ ", like=" + like + ", writer=" + writer + ", ingredient=" + ingredient + ", thumbnail=" + thumbnail
				+ ", searchText=" + searchText + ", totalCount=" + totalCount + ", listCount=" + listCount
				+ ", startIndex=" + startIndex + ", endIndex=" + endIndex + ", pagePerBlock=" + pagePerBlock
				+ ", pageNum=" + pageNum + "]";
	}

}

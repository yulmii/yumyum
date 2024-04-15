package com.yum.member.dto;

public class MemberDTO {
	
	private String userId;
	private String userName;
	private String nickname;
	private String pwd;
	private String email;
	private String joinDate;
	private String admin;
	private int totalCount = 0;		//게시글 전체 수
	private int listCount = 10;		//한 페이지당 보여줄 게시글 수	
	private int startIndex = 1;		//페이지 시작 게시글 번호
	private int endIndex = 1;		//페이지 종료 게시글 번호
	private int pagePerBlock = 10;	//하단 페이지 링크 개수
	private int pageNum = 1;		//현재 페이지 번호
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "MemberDTO [userId=" + userId + ", userName=" + userName + ", nickname=" + nickname + ", pwd=" + pwd
				+ ", email=" + email + ", joinDate=" + joinDate + ", admin=" + admin + ", totalCount=" + totalCount
				+ ", listCount=" + listCount + ", startIndex=" + startIndex + ", endIndex=" + endIndex
				+ ", pagePerBlock=" + pagePerBlock + ", pageNum=" + pageNum + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
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


}

package com.yum.note.dto;

public class NoteDTO {
	private int no;
	private int noteIdx;
	private String title;
	private String content;
	private String createDate;
	private String writer;
	private int totalCount = 0;		//게시글 전체 수
	private int listCount = 10;		//한 페이지당 보여줄 게시글 수	
	private int startIndex = 1;		//페이지 시작 게시글 번호
	private int endIndex = 1;		//페이지 종료 게시글 번호
	private int pagePerBlock = 10;	//하단 페이지 링크 개수
	private int pageNum = 1;		//현재 페이지 번호
	
	public NoteDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getNoteIdx() {
		return noteIdx;
	}

	public void setNoteIdx(int noteIdx) {
		this.noteIdx = noteIdx;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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
	
	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int startIndex) {
		this.endIndex = startIndex + this.listCount - 1;
	}

	@Override
	public String toString() {
		return "NoteDTO [noteIdx=" + noteIdx + ", title=" + title + ", content=" + content + ", createDate="
				+ createDate + ", writer=" + writer + "]";
	}
	
	
}

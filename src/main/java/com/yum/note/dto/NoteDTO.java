package com.yum.note.dto;

public class NoteDTO {

	private int noteIdx;
	private String title;
	private String content;
	private String createDate;
	private String writer;
	
	public NoteDTO() {
		// TODO Auto-generated constructor stub
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

	@Override
	public String toString() {
		return "NoteDTO [noteIdx=" + noteIdx + ", title=" + title + ", content=" + content + ", createDate="
				+ createDate + ", writer=" + writer + "]";
	}
	
	
}

package com.yum.note.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.note.dao.NoteDAO;
import com.yum.note.dto.NoteDTO;
import com.yum.util.FileDAO;
import com.yum.util.FileMethod;

@WebServlet("/admin/note/delete.do")
public class AdNoteDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoteDTO note = new NoteDTO();
		int no = Integer.parseInt(request.getParameter("no"));
		String realPath = "C://yum_img";
		String path = "/upload/note/";
		note.setNoteIdx(no);
		
		//공지사항 삭제
		NoteDAO noteDAO = new NoteDAO();
		noteDAO.noteDelete(no);
		
		//공지사항에 포함된 이미지 조회
		FileDAO fileDAO = new FileDAO();
		List<String> fileList = fileDAO.selectFilesList(no, "note");
		
		//이미지 삭제
		FileMethod fileMethod = new FileMethod();
		for(int i=0; i<fileList.size(); i++) {
			fileMethod.deleteFile(path + fileList.get(i), realPath, "note");
		}
		
		//DB 이미지 삭제
		fileDAO.deleteFileList(no, "note");
		
		response.sendRedirect("list.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

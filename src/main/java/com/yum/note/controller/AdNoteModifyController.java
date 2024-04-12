package com.yum.note.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.note.dao.NoteDAO;
import com.yum.note.dto.NoteDTO;
import com.yum.util.FileMethod;

@WebServlet("/admin/note/modify.do")
public class AdNoteModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		NoteDAO noteDAO = new NoteDAO();
		NoteDTO note = noteDAO.noteSelectOne(no);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/note/adNoteModify.jsp");
		request.setAttribute("note", note);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileMethod fileMethod = new FileMethod();
		String realPath = "C://yum_img";
		int no = Integer.parseInt(request.getParameter("no"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String dummyImg = request.getParameter("dummyImg");
		String deleteImg = request.getParameter("deleteImg");
	    String path_folder2 = realPath + "/note/";

		String name = "note";		//공지사항 게시판 약어 - no
	    
		if(!dummyImg.equals("")) {
			content = content.replaceAll("/temp/", "/note/");
			String[] imgList = dummyImg.split(",");
			
			for(int i=0; i<imgList.length; i++) {;
			    String path_folder1 = imgList[i].replace("/upload", realPath);
			    fileMethod.uploadFile(path_folder1, path_folder2, no, name);
				fileMethod.deleteFile(imgList[i],realPath, "note");
			}
		}
		
		if(!deleteImg.equals("")) {
			String[] delList = deleteImg.split(",");
			
			for(int i=0; i<delList.length; i++) {
				fileMethod.deleteFile(delList[i],realPath, "note");
			}
		}
		
		//수정할 값 DTO에 저장
		NoteDTO note = new NoteDTO();
		note.setNoteIdx(no);
		note.setTitle(title);
		note.setWriter(writer);
		note.setContent(content);
		
		//수정
		NoteDAO noteDAO = new NoteDAO();
		noteDAO.noteModify(note);
		
		response.sendRedirect("list.do");
	}

}

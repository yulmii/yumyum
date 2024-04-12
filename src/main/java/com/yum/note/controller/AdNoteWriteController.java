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

@WebServlet("/admin/note/write.do")
public class AdNoteWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/note/adNoteWrite.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileMethod fileMethod = new FileMethod();
		String realPath = "C://yum_img";
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String dummyImg = request.getParameter("dummyImg");
		String deleteImg = request.getParameter("deleteImg");
	    String path_folder2 = realPath + "/note/";
	    
	    if(!dummyImg.equals("")){
	    	content = content.replaceAll("/temp/", "/note/");
	    }
	    
		//등록할 값 DTO에 저장
		NoteDTO note = new NoteDTO();
		note.setTitle(title);
		note.setWriter(writer);
		note.setContent(content);
		
		//등록
		NoteDAO noteDAO = new NoteDAO();
		int noteIdx = noteDAO.noteWrite(note);	//작성한 게시글 pk
		String name = "note";		//공지사항 게시판 - no
	    
		if(!dummyImg.equals("")) {
			String[] imgList = dummyImg.split(",");
			for(int i=0; i<imgList.length; i++) {;
			    String path_folder1 = imgList[i].replace("/upload", realPath);
			    fileMethod.uploadFile(path_folder1, path_folder2, noteIdx, name);
				fileMethod.deleteFile(imgList[i],realPath, "note");
			}
		}
		
		if(!deleteImg.equals("")) {
			String[] delList = deleteImg.split(",");
			
			for(int i=0; i<delList.length; i++) {
				fileMethod.deleteFile(delList[i],realPath, "note");
			}
		}
		
		response.sendRedirect("list.do");
	}

}


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

@WebServlet("/note/detail.do")
public class NoteDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		
		NoteDAO noteDAO = new NoteDAO();
		NoteDTO note = noteDAO.noteSelectOne(no);
		noteDAO.updateNoteHit(no);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/note/noteDetail.jsp");
		request.setAttribute("note", note);
		request.setAttribute("no", no);
		request.setAttribute("title", "공지사항");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

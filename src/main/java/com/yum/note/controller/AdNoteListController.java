package com.yum.note.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.note.dao.NoteDAO;
import com.yum.note.dto.NoteDTO;
import com.yum.util.PageNation;

@WebServlet("/admin/note/list.do")
public class AdNoteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		NoteDTO note = new NoteDTO();
		
		if(request.getParameter("pageNum") != null) {
			note.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		}
		
		if(request.getParameter("listCount") != null) {
			note.setListCount(Integer.parseInt(request.getParameter("listCount")));
		}
		
		note.setStartIndex(note.getPageNum()*note.getListCount() - note.getListCount());
		note.setEndIndex(note.getStartIndex());
		
		NoteDAO noteDAO = new NoteDAO();
		int totalCount = noteDAO.noteTotalCount();
		List<NoteDTO> noteList = noteDAO.selectNoteList(note.getStartIndex(), note.getListCount());
		
		PageNation paging = new PageNation();
		String pagination = paging.getPageNavigator(totalCount, note.getListCount(), note.getPagePerBlock(), note.getPageNum());
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/note/adNoteList.jsp");
		request.setAttribute("noteList", noteList);
		request.setAttribute("pagination", pagination);
		request.setAttribute("listCount", note.getListCount());
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

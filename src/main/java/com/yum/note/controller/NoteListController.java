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

@WebServlet("/note/list.do")
public class NoteListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int totalCount = 1;
		
		NoteDTO note = new NoteDTO();
		
		if(request.getParameter("pageNum") != null) {
			note.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		}

		note.setStartIndex(note.getPageNum()*note.getListCount() - note.getListCount());
		note.setEndIndex(note.getStartIndex());
		
		NoteDAO noteDAO = new NoteDAO();
		totalCount = noteDAO.noteTotalCount();
		List<NoteDTO> noteList = noteDAO.selectNoteList(note.getStartIndex(), note.getListCount());
		
		PageNation paging = new PageNation();
		String pagination = paging.getPageNavigator(totalCount, note.getListCount(), note.getPagePerBlock(), note.getPageNum());
		RequestDispatcher rd = request.getRequestDispatcher("/views/note/noteList.jsp");
		
		request.setAttribute("title", "공지사항");
		request.setAttribute("pagination", pagination);
		request.setAttribute("noteList", noteList);
		request.setAttribute("pageNum", note.getPageNum());
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

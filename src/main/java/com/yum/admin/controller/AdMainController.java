package com.yum.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.admin.dao.AdminDAO;
import com.yum.member.dto.MemberDTO;
import com.yum.note.dto.NoteDTO;
import com.yum.recipe.dto.RecipeDTO;

@WebServlet("/admin/main.do")
public class AdMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminDAO adminDAO;

	public void init() throws ServletException {
		adminDAO = new AdminDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<MemberDTO> membersList = adminDAO.listMembers(0, 3);
		List<RecipeDTO> recipeList = adminDAO.listRecipe_board(0, 3);
		List<NoteDTO> noteList = adminDAO.listNote();

		request.setAttribute("membersList", membersList);
		request.setAttribute("recipeList", recipeList);
		request.setAttribute("noteList", noteList);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/views/admin/adMain.jsp");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		
	}

}

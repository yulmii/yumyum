package com.yum.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.admin.dao.AdminDAO;

@WebServlet("/admin/recipe/delete.do")
public class AdRecipeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String boardIdx = request.getParameter("boardIdx");


		if (boardIdx == null || boardIdx.isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/admin/main.do");
			return;
		}

		AdminDAO adminDAO = new AdminDAO();
		adminDAO.delRecipe(boardIdx);

		response.sendRedirect(request.getContextPath() + "/admin/main.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

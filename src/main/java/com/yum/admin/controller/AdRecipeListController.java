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
import com.yum.recipe.dto.RecipeDTO;

@WebServlet("/admin/recipe/list.do")
public class AdRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminDAO adminDAO;
	
	public void init() throws ServletException {
		adminDAO = new AdminDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<RecipeDTO> recipeList = adminDAO.listRecipe_board();
		request.setAttribute("recipeList", recipeList);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/views/admin/adRecipeList.jsp");
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

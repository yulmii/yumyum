package com.yum.recipe.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.recipe.dao.RecipeDAO;
import com.yum.recipe.dto.RecipeDTO;

@WebServlet("/recipe/detail.do")
public class RecipeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeDAO dao = new RecipeDAO();
		RecipeDTO dto =new RecipeDTO();
		int n=Integer.parseInt(request.getParameter("boardIdx"));
		dto.setBoardIdx(n);
		
		RecipeDTO recipe = dao.recipeDetail(dto);
		RequestDispatcher rd = request.getRequestDispatcher("/views/recipe/recipeDetail2.jsp");
		request.setAttribute("recipe", recipe);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

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
import com.yum.util.PageNation;

@WebServlet("/admin/recipe/list.do")
public class AdRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminDAO adminDAO;
	
	public void init() throws ServletException {
		adminDAO = new AdminDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeDTO recipe = new RecipeDTO();
		
		if(request.getParameter("pageNum") != null) {
			recipe.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		}
		recipe.setListCount(10);
		if(request.getParameter("listCount") != null) {
			recipe.setListCount(Integer.parseInt(request.getParameter("listCount")));
		}
		
		recipe.setStartIndex(recipe.getPageNum()*recipe.getListCount() - recipe.getListCount());
		recipe.setEndIndex(recipe.getStartIndex());
		
		AdminDAO adminDAO = new AdminDAO();
		int totalCount = adminDAO.recipeTotalCount();
		
		List<RecipeDTO> recipeList = adminDAO.listRecipe_board(recipe.getStartIndex(), recipe.getListCount());
		
		PageNation paging = new PageNation();
		String pagination = paging.getPageNavigator(totalCount, recipe.getListCount(), recipe.getPagePerBlock(),recipe.getPageNum());
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/views/admin/adRecipeList.jsp");
		request.setAttribute("recipeList", recipeList);
		request.setAttribute("pagination", pagination);
		request.setAttribute("listCount", recipe.getListCount());
		dispatch.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

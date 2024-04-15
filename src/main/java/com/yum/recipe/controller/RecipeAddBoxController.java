package com.yum.recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yum.member.dto.BoxDTO;
import com.yum.recipe.dao.RecipeDAO;

@WebServlet("/recipe/addbox.do")
public class RecipeAddBoxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		BoxDTO box = new BoxDTO();
		RecipeDAO dao = new RecipeDAO();
		PrintWriter out = response.getWriter();
		
		
		box.setUserId((String)session.getAttribute("_userId"));
		box.setBoardIdx(Integer.parseInt(request.getParameter("boardIdx")));
		
		if(dao.isStored(box)) {
			out.print("isStoraged");
		} else {
			dao.addStorageBox(box);
			out.print("addBox");
		}
		
		out.close();
	}

}

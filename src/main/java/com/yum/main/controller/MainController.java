package com.yum.main.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yum.admin.dao.AdminDAO;
import com.yum.main.dao.MainDAO;
import com.yum.member.dto.MemberDTO;
import com.yum.recipe.dto.RecipeDTO;

@WebServlet("/main.do")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MainDAO mainDAO = new MainDAO();
		Map<String, List<RecipeDTO>> ctgList =  mainDAO.selectCtgAll();
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/main/main.jsp");
		request.setAttribute("title", "얌얌");
		request.setAttribute("hansikList", ctgList.get("hansik"));
		request.setAttribute("jungsikList", ctgList.get("jungsik"));
		request.setAttribute("ilsikList", ctgList.get("ilsik"));
		request.setAttribute("yangsikList", ctgList.get("yangsik"));
       
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

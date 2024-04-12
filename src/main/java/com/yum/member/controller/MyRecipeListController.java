package com.yum.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yum.member.dao.MemberDAO;
import com.yum.member.dto.MemberDTO;
import com.yum.recipe.dto.RecipeDTO;

@WebServlet("/mypage/myrecipe.do")
public class MyRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberDAO memberDAO = new MemberDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("_userId");
//		String id = "aaa";
//		7. 마이페이지 - 내 글 확인 (레시피테이블 select id=특정값)
		List<RecipeDTO> recipeList = new ArrayList<RecipeDTO>();
		
		recipeList = this.memberDAO.recipeSearch(id);
		
        request.setAttribute("recipeList", recipeList);
        
        // View 보내기
        RequestDispatcher requestDispatcher =
           request.getRequestDispatcher("/views/mypage/myPost.jsp");
        requestDispatcher.forward(request, response); // 내글리스트로
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

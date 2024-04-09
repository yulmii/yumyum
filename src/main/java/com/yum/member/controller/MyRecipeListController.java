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

import com.yum.member.dao.MemberDAO;
import com.yum.recipe.dto.RecipeDTO;

@WebServlet("/mypage/myrecipe.do")
public class MyRecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberDAO memberDAO = new MemberDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		7. 마이페이지 - 내 글 확인 (레시피테이블 select id=특정값)
		List<RecipeDTO> recipeList = new ArrayList<RecipeDTO>();
        // 아이디/닉네임 중복을 확인하는 쿼리 실행 (결과값을 boolean으로 반환 받음)
        boolean dupId = this.memberDAO.checkId(request.getParameter("id"));
        boolean dupNick = this.memberDAO.checkId(request.getParameter("nickname"));
        
        request.setAttribute("recipeList", recipeList);
        // 페이지 번호들을 문자열로 반환하는 메서드 호출
        /* 반환 결과의 예
         *        1  2  3  4  5  6  7  8  9  10  >  >>
         * << 1  2  3  4  5  6  7  8  9  10  >  >>
        */
        
        // View 보내기
        RequestDispatcher requestDispatcher =
           request.getRequestDispatcher("/views/mypage/myPost.jsp");
        requestDispatcher.forward(request, response); // 내글리스트로
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

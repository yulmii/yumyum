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
import com.yum.recipe.dao.RecipeDAO;
import com.yum.recipe.dto.RecipeDTO;
import com.yum.util.PageNation;

@WebServlet("/mypage/mybox/list.do")
public class MyBoxListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberDAO memberDAO = new MemberDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("_userId");
//		7. 마이페이지 - 내 보관함 확인 (레시피테이블 select id=특정값)
		
		// pagination 관련
		RecipeDAO dao = new RecipeDAO();
		PageNation paging = new PageNation();
		RecipeDTO dto = new RecipeDTO();
		if(request.getParameter("pageNum") != null) {
			dto.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		}
		dto.setStartIndex(dto.getPageNum()*dto.getListCount() - dto.getListCount());
		dto.setEndIndex(dto.getStartIndex());
		
		List<RecipeDTO> recipeList = new ArrayList<RecipeDTO>();
		MemberDTO member = new MemberDTO();
		member.setUserId(id);
		
		recipeList = this.memberDAO.myBoxSearch(id, dto);
		member = this.memberDAO.viewUser(member);
		
		int totalCount = recipeList.size();
		String pagination = paging.getPageNavigator(totalCount, dto.getListCount(), dto.getPagePerBlock(), dto.getPageNum());
		
		request.setAttribute("totalCount",totalCount);
		request.setAttribute("pagination", pagination);
        request.setAttribute("recipeList", recipeList);
        request.setAttribute("member", member);
        // View 보내기
        RequestDispatcher requestDispatcher =
           request.getRequestDispatcher("/views/mypage/recipeStorage.jsp");
        requestDispatcher.forward(request, response); // 내글리스트로
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

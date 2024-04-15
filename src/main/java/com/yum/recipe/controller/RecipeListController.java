package com.yum.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.recipe.dao.RecipeDAO;
import com.yum.recipe.dto.RecipeDTO;
import com.yum.util.PageNation;

@WebServlet("/recipe/list.do")
public class RecipeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전달된 파라미터를 이용하여 값 추출(처음에는 전달되는 값이 없슴)
				RecipeDTO dto = new RecipeDTO();
				
				if(request.getParameter("pageNum") != null) {
					dto.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
				}
				
				if(request.getParameter("category") != null) {
					dto.setCategory(request.getParameter("category"));
				}
				
				if(request.getParameter("searchText") != null) {
					dto.setSearchText(request.getParameter("searchText"));
				}
				
				dto.setStartIndex(dto.getPageNum()*dto.getListCount() - dto.getListCount());
				dto.setEndIndex(dto.getStartIndex());
				
				// DAO (DB의 테이블에 접속하여 쿼리를 실행할 수 있는 메서드 보유 객체 생성) 
				RecipeDAO dao = new RecipeDAO();
			
				// 게시물 총 수 (목록 아래에 페이지 번호를 계산하기 위한 메서드 호출)
				int totalCount = dao.recipeTotalCount(dto);
				
				// 게시물 목록을 얻는 쿼리 실행 (결과값을 ArrayList<BoardModel>로 반환 받음)
				List<RecipeDTO> recipeList = dao.recipeList(dto);
				
				// View 사용될 객체 설정
				request.setAttribute("totalCount",totalCount);
				
				// 목록 하단 페이지 번호출력을 위한 객체 생성 
				PageNation paging = new PageNation();
				String pagination = paging.getPageNavigator(totalCount, dto.getListCount(), dto.getPagePerBlock(), dto.getPageNum());
				
				request.setAttribute("pagination", pagination);		// 페이지 
				request.setAttribute("recipeList", recipeList); 	// 조회 결과 리스트
				request.setAttribute("recipe", dto); // 모델
				
				// View 보내기
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/views/recipe/recipeList.jsp"); 
				requestDispatcher. forward (request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

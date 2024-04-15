package com.yum.recipe.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.yum.recipe.dao.RecipeDAO;
import com.yum.recipe.dto.LikeDTO;
import com.yum.recipe.dto.RecipeDTO;

@WebServlet("/recipe/detail.do")
public class RecipeDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		RecipeDAO dao = new RecipeDAO();
		RecipeDTO dto = new RecipeDTO();
		LikeDTO likeDto = new LikeDTO();
		//파라미터
		int n=Integer.parseInt(request.getParameter("boardIdx"));
		
		dto.setBoardIdx(n);
		likeDto.setBoardIdx(n);
		likeDto.setUserId((String)session.getAttribute("_userId"));

		//유저가 좋아요를 눌렀었는지 조회
		boolean like = dao.isLiked(likeDto);
		
		//조회수 증가
		dao.updateHit(dto);
		
		//레시피 상세 조회
		RecipeDTO recipe = dao.recipeDetail(dto);
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/recipe/recipeDetail.jsp");
		request.setAttribute("recipe", recipe);
		request.setAttribute("like", like);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		RecipeDAO dao = new RecipeDAO();
		RecipeDTO dto = new RecipeDTO();
		LikeDTO likeDto = new LikeDTO();
		
		//파라미터
		int n=Integer.parseInt(request.getParameter("boardIdx"));
		
		likeDto.setBoardIdx(n);
		likeDto.setUserId((String)session.getAttribute("_userId"));

		//유저가 좋아요를 눌렀었는지 조회
		boolean like = dao.isLiked(likeDto);
		
		//likes 테이블 수정
		likeDto.setLike(like);
		dao.updateLike(likeDto);

		//recipe_board 테이블 수정
		dto.setBoardIdx(n);
		dto = dao.recipeDetail(dto);
		dao.updateLike(dto, likeDto);
		JSONObject likeObj = new JSONObject();
		
		PrintWriter out = response.getWriter();
		
		if(!like) {
			likeObj.put("like", "like");
		}
		likeObj.put("likeNum", dao.selectLike(dto));
		out.print(likeObj.toJSONString());

		out.close();
		
	}

}

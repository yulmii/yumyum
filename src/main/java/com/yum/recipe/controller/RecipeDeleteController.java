package com.yum.recipe.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.recipe.dao.RecipeDAO;
import com.yum.recipe.dto.RecipeDTO;
import com.yum.util.FileDAO;
import com.yum.util.FileMethod;

@WebServlet("/recipe/delete.do")
public class RecipeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeDTO recipe = new RecipeDTO();
		int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
		String realPath = "C://yum_img";
		String path = "/upload/recipe/content";
		recipe.setBoardIdx(boardIdx);
		
		//공지사항 삭제
		RecipeDAO recipeDAO = new RecipeDAO();
		recipeDAO.deleteRecipe(recipe);
		
		//공지사항에 포함된 이미지 조회
		FileDAO fileDAO = new FileDAO();
		List<String> fileList = fileDAO.selectFilesList(boardIdx, "recipe");
		
		//이미지 삭제
		FileMethod fileMethod = new FileMethod();
		for(int i=0; i<fileList.size(); i++) {
			fileMethod.deleteFile(path + fileList.get(i), realPath, "recipe");
		}
		
		//DB 이미지 삭제
		fileDAO.deleteFileList(boardIdx, "recipe");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecipeDTO recipe = new RecipeDTO();
		int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
		String realPath = "C://yum_img";
		String path = "/upload/recipe/content/";
		recipe.setBoardIdx(boardIdx);
		
		//공지사항 삭제
		RecipeDAO recipeDAO = new RecipeDAO();
		recipeDAO.deleteRecipe(recipe);
		
		//공지사항에 포함된 이미지 조회
		FileDAO fileDAO = new FileDAO();
		List<String> fileList = fileDAO.selectFilesList(boardIdx, "recipe");
		
		//이미지 삭제
		FileMethod fileMethod = new FileMethod();
		for(int i=0; i<fileList.size(); i++) {
			fileMethod.deleteFile(path + fileList.get(i), realPath, "recipe");
		}
		
		//DB 이미지 삭제
		fileDAO.deleteFileList(boardIdx, "recipe");
	}

}

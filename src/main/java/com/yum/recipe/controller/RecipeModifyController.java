package com.yum.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import com.yum.recipe.dao.RecipeDAO;
import com.yum.recipe.dto.RecipeDTO;

@WebServlet("/recipe/modify.do")
public class RecipeModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 모델
		RecipeDTO dto = new RecipeDTO();
		int n=Integer.parseInt(request.getParameter("boardIdx"));
		dto.setBoardIdx(n);

		// 게시물 상세 조회
		RecipeDAO dao = new RecipeDAO();
		RecipeDTO recipe = dao.recipeDetail(dto);
		

		// View 사용될 객체 설정
		request.setAttribute("recipe", recipe);

		// View 보내기
		RequestDispatcher rd = request.getRequestDispatcher("/views/recipe/recipeModify.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); // false를 사용하여 새로운 세션이 생성되지 않도록 설정
		// DAO 객체 생성
	    RecipeDAO dao = new RecipeDAO();
	    // 파일 업로드 처리
	    
	    //파일 업로드시 필요한 정보
	    String thumbnail = "";
	    String title = "";
	    FileItem thumbnailItem = null;
	    
	    // RecipeDTO 객체 생성 및 정보 설정
	    RecipeDTO recipe = new RecipeDTO();
	    DiskFileItemFactory factory = new DiskFileItemFactory();
	    ServletFileUpload upload = new ServletFileUpload(factory);
		recipe.setUserId((String)session.getAttribute("_userId"));
	 // 파일 업로드 및 파라미터 처리
	    try {
	        List<FileItem> items = upload.parseRequest(request);
	        for (FileItem item : items) {
	        	String fieldName = item.getFieldName();
	            if (item.isFormField()) { // 파일이 아닌 경우
	                // 파일이 아닌 파라미터 처리
	                String value = item.getString("UTF-8"); // 파라미터 값 가져오기
	                System.out.println("1 : " +value);
	                if (fieldName.equals("boardIdx")) {
	                	recipe.setBoardIdx(Integer.parseInt(value));
	                } else if (fieldName.equals("category")) {
	                	recipe.setCategory(value);
	                } else if (fieldName.equals("title")) {
	                	recipe.setTitle(value);
	                	title = value;
	                } else if (fieldName.equals("content")) {
	                	recipe.setContent(value);
	                } else if (fieldName.equals("ingredient")) {
	                	recipe.setIngredient(value);
	                } else if (fieldName.equals("thumbnail")) {
	                	thumbnail = value; //원래 썸네일 파일명
	                } 
	            }else {
	            	if (fieldName.equals("thumbnailModify")) {
	            		thumbnailItem = item;
	            	}
	            }
	        }
	        thumbnail = fileUpload(thumbnail, title, thumbnailItem);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    recipe.setThumbnail(thumbnail);
	    System.out.println(recipe.toString());
	    dao.recipeModify(recipe);
	    
	    System.out.println("modify 보드인덱스" + recipe.getBoardIdx());
	    response.sendRedirect(request.getContextPath() + "/recipe/detail.do?boardIdx=" + recipe.getBoardIdx());
	}
	
	private String fileUpload(String thumbnail, String title, FileItem thumbnailItem) throws IOException, ServletException {
		
		String fileName = "";
	    String fileDir = "C:/yum_img/recipe/";
	    UUID uuid = UUID.randomUUID(); //파일이름 난수발생
	    // 파일 업로드 및 정보 저장
	    try {
	        //파일 수정 처리
	        if (thumbnailItem != null && thumbnailItem.getSize() != 0) {
	        	String exp = FilenameUtils.getExtension(thumbnailItem.getName());
	            fileName = "recipethumb-" + uuid + "-" + title + "." + exp;
	            File uploadFile = new File(fileDir + fileName);
	            thumbnailItem.write(uploadFile);
	            
	            File deleteFile = new File(fileDir + thumbnail);
	            if(deleteFile.delete()) {
	            	System.out.println("지우는데 성공함");
	            }
	        } else {
	        	fileName = thumbnail;
	        }
	    } catch (Exception e) {
	        System.out.println("FILE UPLOAD FAIL!!!" + e.getMessage());
	        e.printStackTrace();
	    }
	    
	    return fileName;
	}

}

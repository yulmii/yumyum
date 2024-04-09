package com.yum.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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

@WebServlet("/recipe/write.do")
public class RecipeWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestDispatcher rd = request.getRequestDispatcher("/views/recipe/recipeWrite.jsp");
//		request.setAttribute("order", order);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); // false를 사용하여 새로운 세션이 생성되지 않도록 설정
		// DAO 객체 생성
	    RecipeDAO dao = new RecipeDAO();
	    // 파일 업로드 처리
	    String thumbnail = fileUpload(request);
	    
	    //파라미터
	    String cookHour = request.getParameter("cookHour");
	    System.out.println(cookHour);
	    String cookMinute = request.getParameter("cookMinute");
	    cookHour = (cookHour == null || cookHour.isEmpty()) ? "0" : cookHour;
	    cookMinute = (cookMinute == null || cookMinute.isEmpty()) ? "0" : cookMinute;
	    
	    // RecipeDTO 객체 생성 및 정보 설정
	    DiskFileItemFactory factory = new DiskFileItemFactory();
	    ServletFileUpload upload = new ServletFileUpload(factory);
	 // 파일 업로드 및 파라미터 처리
	    try {
	        List<FileItem> items = upload.parseRequest(request);
	        for (FileItem item : items) {
	            if (item.isFormField()) { // 파일이 아닌 경우
	                // 파일이 아닌 파라미터 처리
	                String fieldName = item.getFieldName();
	                String fieldValue = item.getString("UTF-8"); // 파라미터 값 가져오기
	                // 여기서 필요한 파라미터 처리를 수행하면 됩니다.
	                // 예를 들어, 필요한 파라미터를 DTO 객체에 설정할 수 있습니다.
	                if (fieldName.equals("cookHour")) {
	                    // cookHour 파라미터 처리
	                } else if (fieldName.equals("cookMinute")) {
	                    // cookMinute 파라미터 처리
	                } else if (fieldName.equals("category")) {
	                    // category 파라미터 처리
	                }
	                // 필요한 파라미터들을 RecipeDTO 객체에 설정하십시오.
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
	    RecipeDTO recipe = new RecipeDTO();
//		recipe.setUserId((String)session.getAttribute("_userId"));
	    recipe.setUserId("aaa"); // 사용자 아이디 하드코딩
	    recipe.setCategory(request.getParameter("category"));
	    recipe.setTitle(request.getParameter("title"));
	    recipe.setContent(request.getParameter("content"));
	    recipe.setCookHour(Integer.parseInt(cookHour));
	    recipe.setCookMinute(Integer.parseInt(cookMinute));
	    recipe.setIngredient(request.getParameter("ingredent"));
	    recipe.setThumbnail(thumbnail);
	    System.out.println(recipe.toString());
	    dao = new RecipeDAO();
	    dao.recipeWrite(recipe);

	}
	
	private String fileUpload(HttpServletRequest request) throws IOException, ServletException {
		// DAO 객체 생성
	    RecipeDAO dao = new RecipeDAO();

	    // 파일 업로드를 위한 설정
	    DiskFileItemFactory factory = new DiskFileItemFactory();
	    ServletFileUpload upload = new ServletFileUpload(factory);

	    // 파일 업로드 및 정보 저장
	    String thumbnail = "";
	    int maxBoardIdx = dao.maxBoardIdx();
	    try {
	        // "thumbnail" 파라미터 가져오기
	        FileItem thumbnailItem = null;
	        List<FileItem> items = upload.parseRequest(request);
	        for (FileItem item : items) {
	            if (!item.isFormField() && item.getFieldName().equals("thumbnail")) { // 파일이면서 파라미터 이름이 "thumbnail"인 경우
	                thumbnailItem = item;
	                break; // thumbnail을 찾았으므로 루프 종료
	            }
	        }

	        // "thumbnail" 파일 업로드 처리
	        if (thumbnailItem != null) {
	            String exp = FilenameUtils.getExtension(thumbnailItem.getName());
	            String fileName = "recipethumb" + String.valueOf(maxBoardIdx + 1) + "." + exp;
	            File uploadFile = new File("C:/yum_img/recipe/" + fileName);
	            thumbnailItem.write(uploadFile);
	            thumbnail = uploadFile.getAbsolutePath();
	            System.out.println(thumbnail);
	        }
	    } catch (Exception e) {
	        System.out.println("FILE UPLOAD FAIL!!!" + e.getMessage());
	        e.printStackTrace();
	    }
	    
	    return thumbnail;
	}

}

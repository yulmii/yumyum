package com.yum.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * 
 */
@WebServlet("/file/tempUpload.do")
public class FileUploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//저장 경로
		String path = "temp/"; 
		
		FileMethod fileMethod = new FileMethod();
		
		Part part = request.getPart("file");
		String fileName = fileMethod.getFilename(part);
		
		//파일 업로드
		String tempName = fileMethod.uploadTempFile(path, part, fileName);
		PrintWriter out = response.getWriter();
		out.print(tempName);
	}

}

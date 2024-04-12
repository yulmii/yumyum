package com.yum.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;

public class FileMethod {

	public FileMethod() {
	}

	public String getFilename(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] split = contentDisp.split(";");
        for (int i = 0; i < split.length; i++) {
            String temp = split[i];
            if (temp.trim().startsWith("filename")) {
                return temp.substring(temp.indexOf("=") + 2, temp.length() - 1);
            }
        }
        return "";
    }
	
	//임시 파일 저장
	public String uploadTempFile(String path, Part part, String fileName) {	
		String filePath = "C://yum_img/";
		String contextRoot = filePath + path;
		String fileRoot = contextRoot;
		
		File tempFolder;
		tempFolder = new File(fileRoot);
		
		//저장할 폴더가 없으면 생성
		if(!tempFolder.exists()) {
			tempFolder.mkdir();
		}

		//확장자 추출
		String extension = fileName.substring(fileName.lastIndexOf("."));
		
		//새로운 파일명 추출
		String savedFileName = UUID.randomUUID() + extension;
		
		//저장될 파일의 경로와 파일명을 나타내는 File객체 생성
		File targetFile = new File(fileRoot + savedFileName);
		InputStream fileStream = null;
		try {	
			fileStream = part.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			
			return "/upload/" + path + savedFileName;
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	//등록 및 수정시 임시파일을 저장 폴더로 이동
	synchronized public String uploadFile(String path_folder1, String path_folder2, int id, String name) {	
		File folder1;
		File folder2;
		folder1 = new File(path_folder1);
		folder2 = new File(path_folder2);
		
		//저장할 폴더가 없으면 생성
		if(!folder2.exists()) {
			folder2.mkdir();
		}
		
		//폴더1에서 폴더2로 저장		
		FileInputStream fis = null;
        FileOutputStream fos = null;
        File file = new File(folder2.getAbsolutePath() + File.separator + folder1.getName());
        
        try {
        	fis = new FileInputStream(folder1);
        	fos = new FileOutputStream(file);
        	
        	byte[] b = new byte[4096];
        	int cnt = 0;
        	while((cnt = fis.read(b)) != -1) {
        		fos.write(b, 0, cnt);
        	}
        	
        	FileDAO fileDAO = new FileDAO();
        	fileDAO.uploadFile(folder1.getName(), id, name);
        	
        } catch(Exception e) {
        	System.err.println("uploadFile(String path_folder1, String path_folder2) ===============> " + e.getMessage());
        } finally {
        	try {
            	fis.close();
				fos.close();
			} catch (IOException e) {
				System.err.println("uploadFile(String path_folder1, String path_folder2) ===============> " + e.getMessage());
			}
        }
		
		
		return null;
	}
	
	//이미지 삭제 로직
	synchronized public void deleteFile(String path, String real, String name) {
		path = path.replace("/upload", real);
		Path _path = Paths.get("",path);
		
		if(!path.contains("/temp/")) {
			File file = new File(path);
			FileDAO fileDAO = new FileDAO();
			fileDAO.deleteFile(file.getName(), name);
		}
		
		try {
			Files.delete(_path);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}

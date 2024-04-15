package com.yum.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yum.member.dao.MemberDAO;
import com.yum.member.dto.BoxDTO;

@WebServlet("/mypage/mybox/delete.do")
public class MyBoxDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberDAO memberDAO = new MemberDAO();
	// 보관함 상에서 삭제 버튼 누를 시 삭제되도록 하기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String id = (String) session.getAttribute("_userId");
		int no = Integer.parseInt(request.getParameter("no").trim());
		
		BoxDTO box = new BoxDTO();
		box.setUserId(id);
		box.setBoardIdx(no);
		
		this.memberDAO.deleteBox(box);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

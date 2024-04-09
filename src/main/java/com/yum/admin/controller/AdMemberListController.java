package com.yum.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.admin.dao.AdminDAO;
import com.yum.member.dto.MemberDTO;

@WebServlet("/admin/member/list.do")
public class AdMemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminDAO adminDAO;
	
	public void init() throws ServletException {
		adminDAO = new AdminDAO();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MemberDTO> membersList = adminDAO.listMembers();
		request.setAttribute("membersList", membersList);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/views/admin/adMemberList.jsp");
		dispatch.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

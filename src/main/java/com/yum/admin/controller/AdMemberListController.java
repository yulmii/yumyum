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
import com.yum.note.dao.NoteDAO;
import com.yum.util.PageNation;

@WebServlet("/admin/member/list.do")
public class AdMemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AdminDAO adminDAO;
	
	public void init() throws ServletException {
		adminDAO = new AdminDAO();
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDTO member = new MemberDTO();
		
		if(request.getParameter("pageNum") != null) {
			member.setPageNum(Integer.parseInt(request.getParameter("pageNum")));
		}
		
		if(request.getParameter("listCount") != null) {
			member.setListCount(Integer.parseInt(request.getParameter("listCount")));
		}
		
		member.setStartIndex(member.getPageNum()*member.getListCount() - member.getListCount());
		member.setEndIndex(member.getStartIndex());
		
		AdminDAO adminDAO = new AdminDAO();
		int totalCount = adminDAO.memberTotalCount();
		
		
		List<MemberDTO> membersList = adminDAO.listMembers(member.getStartIndex(), member.getListCount());
		
		PageNation paging = new PageNation();
		String pagination = paging.getPageNavigator(totalCount, member.getListCount(), member.getPagePerBlock(), member.getPageNum());
		
		request.setAttribute("membersList", membersList);
		request.setAttribute("pagination", pagination);
		request.setAttribute("listCount", member.getListCount());
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/views/admin/adMemberList.jsp");
		dispatch.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

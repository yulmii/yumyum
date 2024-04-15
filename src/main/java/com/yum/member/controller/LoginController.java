package com.yum.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yum.member.dao.MemberDAO;
import com.yum.member.dto.MemberDTO;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    private MemberDAO memberDAO = new MemberDAO();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/member/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDTO member = new MemberDTO();
		member.setUserId(request.getParameter("id"));
		member.setPwd(request.getParameter("pwd"));
		
		boolean result = this.memberDAO.loginUser(member); // 로그인 됨 혹은 안 됨
		System.out.println(result);
		PrintWriter out = response.getWriter();
		if (result) { // 아이디 비밀번호 일치
			//세션에 아이디 정보 넣기
		    // 세션 생성
		    HttpSession session = request.getSession();
		    
		    // 세션에 아이디 정보 설정
		    session.setAttribute("_userId", member.getUserId());
		    
		    out.print("성공");
		    
		}
		
		// response.sendRedirect(nextPage);
	    // requestDispatcher.forward(request, response); // 내글리스트로
		
	}

}

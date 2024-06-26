package com.yum.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.member.dao.MemberDAO;
import com.yum.member.dto.MemberDTO;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/join.do")
public class MemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberDAO memberDAO = new MemberDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // 모델 (MemberDAO의 메서드에게 전달할 데이터를 하나의 객체로 )
    	RequestDispatcher rd = request.getRequestDispatcher("/views/member/join.jsp");
		rd.forward(request, response);
        
     }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberDTO member = new MemberDTO();
        
        // 아이디/닉네임 중복을 확인하는 쿼리 실행 (결과값을 boolean으로 반환 받음)
        member.setUserId(request.getParameter("user_id"));
        member.setNickname(request.getParameter("nickname"));
        member.setEmail(request.getParameter("email"));
        member.setPwd(request.getParameter("pwd"));
        member.setUserName(request.getParameter("name"));
        // if 중복검사 fail then 돌아가기?
        this.memberDAO.joinUser(member);
        request.setAttribute("member", member);
        
        // View 보내기
        response.sendRedirect("login.do");
        
//        RequestDispatcher requestDispatcher =
//           request.getRequestDispatcher("/login.do");
//        requestDispatcher.forward(request, response);
	}

}

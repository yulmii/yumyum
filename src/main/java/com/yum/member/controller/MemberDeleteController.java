package com.yum.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yum.member.dao.MemberDAO;
import com.yum.member.dto.MemberDTO;

@WebServlet("/mypage/delete.do")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberDAO memberDAO = new MemberDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 회원탈퇴
    	HttpSession session = request.getSession(false); // 세션이 없으면 새로 생성하지 않음
    	String id = (String) session.getAttribute("_userId");
		
		MemberDTO member = new MemberDTO();
		member.setUserId(id);
		
		member = this.memberDAO.viewUser(member);
		
		this.memberDAO.deleteUser(member);
		
		this.memberDAO.addOutUser(member);

		// View 사용될 객체 설정
		request.setAttribute("member", member);

		
		// 세션에 저장된 정보가 있으면 삭제
		if (session != null) {
		    session.invalidate(); // 세션 무효화
		}
		// View 보내기
    	RequestDispatcher rd = request.getRequestDispatcher("/login.do");
		rd.forward(request, response);
        
     }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

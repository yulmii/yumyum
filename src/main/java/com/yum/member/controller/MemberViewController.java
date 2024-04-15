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

@WebServlet("/mypage/view.do")
public class MemberViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberDAO memberDAO = new MemberDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 마이페이지(에서 회원정보 조회 탭)을 눌렀을 때
    	HttpSession session = request.getSession();
		String id = (String) session.getAttribute("_userId");
		
		MemberDTO member = new MemberDTO();
		member.setUserId(id);
		
		member = this.memberDAO.viewUser(member);

		// View 사용될 객체 설정
		request.setAttribute("member", member);

		// View 보내기
    	RequestDispatcher rd = request.getRequestDispatcher("/views/mypage/memberView.jsp");
		rd.forward(request, response);
        
     }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

package com.yum.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/modify.do")
public class MemberModifyController extends HttpServlet {
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
    	
        MemberDTO member = new MemberDTO();
        
        // 아이디/닉네임 중복을 확인하는 쿼리 실행 (결과값을 boolean으로 반환 받음)
        member.setUserId(request.getParameter("user_id"));
        member.setNickname(request.getParameter("nickname"));
        member.setEmail(request.getParameter("email"));
        member.setPwd(request.getParameter("pwd"));
        member.setUserName(request.getParameter("name"));
        this.memberDAO.joinUser(member);
        request.setAttribute("member", member);
        
        // View 보내기
        RequestDispatcher requestDispatcher =
           request.getRequestDispatcher("/views/member/login.jsp");
        requestDispatcher.forward(request, response);
     }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

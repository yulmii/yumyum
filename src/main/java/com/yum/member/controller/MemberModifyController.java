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

@WebServlet("/mypage/modify.do")
public class MemberModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberDAO memberDAO = new MemberDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberModifyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 마이페이지에서 회원정보 수정 탭을 눌렀을 때
    	HttpSession session = request.getSession();
		String id = (String) session.getAttribute("_userId");
		
		MemberDTO member = new MemberDTO();
		member.setUserId(id);
		
		member = this.memberDAO.viewUser(member);

		// View 사용될 객체 설정
		request.setAttribute("member", member);

		// View 보내기
    	RequestDispatcher rd = request.getRequestDispatcher("/views/mypage/memberModify.jsp");
		rd.forward(request, response);
        
     }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		MemberDTO member = new MemberDTO();
        
        member.setUserId(request.getParameter("user_id"));
        member.setNickname(request.getParameter("nickname"));
        member.setEmail(request.getParameter("email"));
        member.setPwd(request.getParameter("pwd"));
        member.setUserName(request.getParameter("name"));
        this.memberDAO.modifyUser(member);
        request.setAttribute("member", member);
        
        // View 보내기
        RequestDispatcher requestDispatcher =
        	request.getRequestDispatcher("/views/mypage/memberModify.jsp");
        requestDispatcher.forward(request, response);
	}

}

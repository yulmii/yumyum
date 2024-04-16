package com.yum.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/idcheck.do")
public class IDCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private MemberDAO memberDAO = new MemberDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IDCheckController() {
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
		
		String id = request.getParameter("id");
		
		boolean result = memberDAO.checkId(id);

		PrintWriter out = response.getWriter();
		out.print(result);
	}

}

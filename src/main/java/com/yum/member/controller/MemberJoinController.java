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
       
//	private MemberDAO memberDAO = new MemberDAO();
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
        // 모델 (BoardDAO의 메서드에게 전달할 데이터를 하나의 객체로 )
        MemberDTO member = new MemberDTO();
        
        // DAO (DB의 테이블에 접속하여 쿼리를 실행할 수 있는 메서드 보유 객체 생성) 
//        this.memberDAO = new MemberDAO();
        // 게시물 목록을 얻는 쿼리 실행 (결과값을 ArrayList<BoardModel> 로 반환 받음)
        
        
        request.setAttribute("productList", member);
        // 페이지 번호들을 문자열로 반환하는 메서드 호출
        /* 반환 결과의 예
         *        1  2  3  4  5  6  7  8  9  10  >  >>
         * << 1  2  3  4  5  6  7  8  9  10  >  >>
        */
        
        // View 보내기
        RequestDispatcher requestDispatcher =
           request.getRequestDispatcher("/views/main/main.jsp");
        requestDispatcher.forward(request, response);
     }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

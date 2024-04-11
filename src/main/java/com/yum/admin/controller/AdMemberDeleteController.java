package com.yum.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yum.admin.dao.AdminDAO;
import com.yum.member.dto.MemberDTO;

@WebServlet("/admin/member/delete.do")
public class AdMemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("id");

        // 회원 삭제 로직 실행
        AdminDAO adminDAO = new AdminDAO();
        
        // 탈퇴 회원 등록 로직 실행
        MemberDTO deletedMember = adminDAO.memberInfo(userId);
        adminDAO.addOutAdUser(deletedMember);

        // 먼저 해당 회원을 참조하는 recipe_board 테이블의 레코드를 삭제합니다.
        adminDAO.deleteRecipeRecords(userId);

        // 이후 회원을 삭제합니다.
        adminDAO.deleteAdUser(userId, deletedMember);

        response.sendRedirect(request.getContextPath() + "/admin/main.do");
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}

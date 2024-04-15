package com.yum.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yum.admin.dao.AdminDAO;
import com.yum.member.dto.MemberDTO;

@WebServlet("/admin/member/modify.do")
public class AdMemberModifyController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userId");
        HttpSession session = request.getSession(false);
        System.out.println(session.getAttribute("_admin"));
        
        AdminDAO adminDAO = new AdminDAO();
        MemberDTO member = adminDAO.memberInfo(userId);

        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/adMemberModify.jsp");
        request.setAttribute("member", member);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String contextPath = request.getContextPath();
        MemberDTO member = new MemberDTO();
        member.setUserId(request.getParameter("userId"));
        member.setUserName(request.getParameter("userName"));
        member.setNickname(request.getParameter("nickname"));
        member.setPwd(request.getParameter("pwd"));
        member.setEmail(request.getParameter("email"));

        // 관리자 권한 설정
        String adminValue = request.getParameter("admin");
        member.setAdmin(adminValue);

        // 수정된 사용자 정보를 데이터베이스에 저장
        AdminDAO adminDAO = new AdminDAO();
        adminDAO.memberModify(member);

        response.sendRedirect(contextPath + "/admin/main.do");
    }
}



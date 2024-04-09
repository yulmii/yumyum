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
        
        AdminDAO adminDAO = new AdminDAO();
        MemberDTO member = adminDAO.memberInfo(userId);

        RequestDispatcher rd = request.getRequestDispatcher("/views/admin/adMemberModify.jsp");
        request.setAttribute("member", member);
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String contextPath = request.getContextPath();
        MemberDTO member = new MemberDTO();
        member.setUserId(request.getParameter("userId"));
        member.setUserName(request.getParameter("userName"));
        member.setNickname(request.getParameter("nickname"));
        member.setPwd(request.getParameter("pwd"));
        member.setEmail(request.getParameter("email"));
        member.setJoinDate(request.getParameter("joinDate"));
        member.setAdmin(false);

        AdminDAO adminDAO = new AdminDAO();
        adminDAO.memberModify(member);

        response.sendRedirect(contextPath + "/admin/main.do");
    }
}


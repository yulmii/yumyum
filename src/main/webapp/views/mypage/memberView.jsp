<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript">
</script>
<main>
	<%@ include file="/inc/mypage_side_bar.jsp"%>
	<p>회원정보 조회</p><br>
	아이디: <c:out value="${ member.userId }" /><br>
	비밀번호: <c:out value="${ member.pwd }" /><br>
	닉네임: <c:out value="${ member.nickname }" /><br>
	이름: <c:out value="${ member.userName }" /><br>
	이메일: <c:out value="${ member.email }" /><br>
	회원가입 일시: <c:out value="${ member.joinDate }" /><br>
	<input type="button" value="회원정보 수정" onclick="location.href='<c:url value="/mypage/modify.do" />'">
	<input type="button" value="회원탈퇴" onclick="location.href='<c:url value="/mypage/delete.do" />'">
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>

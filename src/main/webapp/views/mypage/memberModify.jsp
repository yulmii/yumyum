<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
<main>
	<form name="frmModify" method="post" action="<c:url value='/mypage/modify.do' />">
		아이디: <input type="text" name="user_id" value="<c:out value="${ member.userId }" />" readonly><br>
		비밀번호: <input type="text" name="pwd" value="<c:out value="${ member.pwd }" />"><br>
		닉네임: <input type="text" name="nickname" value="<c:out value="${ member.nickname }" />"><br>
		이름: <input type="text" name="name" value="<c:out value="${ member.userName }" />"><br>
		이메일: <input type="text" name="email" value="<c:out value="${ member.email }" />"><br>
		<input type="submit" value="회원정보 수정">
		<input type="reset" value="다시 입력">
	</form>
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>

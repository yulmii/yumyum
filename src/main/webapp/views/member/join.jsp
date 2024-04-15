<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
<main>
	<form name="frmJoin" method="post" action="<c:url value='/join.do' />">
		아이디: <input type="text" name="user_id" required><br>
		비밀번호: <input type="text" name="pwd" required><br>
		닉네임: <input type="text" name="nickname" required><br>
		이름: <input type="text" name="name" required><br>
		이메일: <input type="text" name="email" required><br>
		<input type="submit" value="회원가입">
		<input type="reset" value="다시 입력">
		<input type="button" value="돌아가기" onclick="location.href='<c:url value="/login.do" />'">
	</form>
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>

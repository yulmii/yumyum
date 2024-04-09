<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
<main>
	<form name="frmLogin" method="post" action="<c:url value='/login.do' />">
		아이디: <input type="text" name="user_id"><br>
		비밀번호: <input type="text" name="user_pw"><br>
		<input type="submit" value="로그인">
		<input type="reset" value="다시 입력">
		<input type="button" value="회원가입" onclick="location.href='<c:url value="/views/member/join.jsp" />'">
	</form>
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">
.member_info {
	width: 800px;
	margin: 0 auto;
}
.info {
	text-align: left;
	margin-bottom: 7px;
}
.my-side-menu {
	position: fixed; /* 측면 메뉴를 고정합니다 */
	top: 0; /* 페이지 상단에 정렬합니다 */
	left: 0; /* 페이지 왼쪽에 정렬합니다 */
	bottom: 0; /* 페이지 하단까지 확장합니다 */
	width: 300px;
	/*   background: #0a0a0a; */
	overflow: auto; /* 내용이 높이를 초과할 경우 스크롤을 활성화합니다 */
}
.my-menu-h2 {
	color: #f9f9f9;
	padding: 10px;
	margin: 10px;
}

.my-side-menu-bar {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
	width: 300px;
	background: #0a0a0a;
	height: 100%;
	overflow: auto;
	position: fixed;
}

.my-side-menu-bar li a {
	text-decoration: none;
	padding: 30px;
	display: block;
	color: #fff;
	font-weight: bold;
}
.my-home-menu {
	text-decoration: none;
	padding: 5px;
	display: block;
	color: #fff;
	font-weight: bold;
}
.my-side-menu-bar li a:hover {
	background: #333;
	color: #fff;
}

.my-side-menu-bar li a.home {
	background: #333;
	color: #fff;
}
</style>
<script type="text/javascript">
</script>
<main>
	<%@ include file="/inc/mypage_side_bar.jsp"%>
	<div class="member_info">
	<h2>회원정보 조회</h2><br>
	<div class="info">아이디: <c:out value="${ member.userId }" /><br></div>
	<div class="info">비밀번호: <c:out value="${ member.pwd }" /><br></div>
	<div class="info">닉네임: <c:out value="${ member.nickname }" /><br></div>
	<div class="info">이름: <c:out value="${ member.userName }" /><br></div>
	<div class="info">이메일: <c:out value="${ member.email }" /><br></div>
	<div class="info">회원가입 일시: <c:out value="${ member.joinDate }" /><br></div>
	
	<input type="button" value="회원정보 수정" onclick="location.href='<c:url value="/mypage/modify.do" />'">
	<input type="button" value="회원탈퇴" onclick="location.href='<c:url value="/mypage/delete.do" />'">
	</div>
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>

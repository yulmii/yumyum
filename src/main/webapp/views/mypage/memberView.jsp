<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">
.my-page-main {
	width: 800px;
	margin: 0 auto; 
}
.member_info {
    overflow: hidden;
    margin-left: 150px; 
    background: #afeeee30;
    border-radius: 20px;
    padding-left: 20px;
}

.info {
	text-align: left;
	margin-bottom: 7px;
	padding: 6.5px;
	border-bottom: 1px solid #c0c0c050;
}
.my-side-menu {
    float: left; 
    width: 300px; 
    padding-right: 20px; 
}

.my-menu-h2 {
	color: #f9f9f9;
	padding: 10px;
	margin: 10px;
}

.my-side-menu-bar {
    list-style-type: none;
    width: 300px;
    background: #fff;
    overflow: auto;
    position: fixed;
    border-radius: 0px 20px;
    background: #afeeee30;
    padding: 0px;
	margin: 0px;
	margin-left: -200px; 
    
}

.my-side-menu-bar li a {
	text-decoration: none;
	padding: 30px;
	display: block;
	color: #000;
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
	background: #afeeee50;
	color: #000;
}

.my-side-menu-bar li a.home {
	background: #333;
	color: #fff;
}
.ma-info-btn {
    height: 40px;
    font-weight: normal;
    font-size: 13px;
    line-height: 19px;
    text-align: center;
    letter-spacing: -0.7px;
    color: #2F83F5;
    background: #FFFFFF;
    border: 1px solid #2F83F5;
    box-sizing: border-box;
    border-radius: 3px;
    padding: 8px 18px 9px;
}
.member_info .ma-info-btn {
    float: right; 
    margin-right: 30px; 
}
</style>
<script type="text/javascript">
</script>
<main>
<div class="my-page-main">
	<div class="my-side-menu">
		<ul class="my-side-menu-bar">
			<li><a href="<c:url value="/mypage/view.do"/> " class="menu-link">회원정보 조회</a></li>
			<li><a href="<c:url value="/mypage/myrecipe.do"/>" class="menu-link">내 레시피</a></li>
			<li><a href="<c:url value="/mypage/mybox/list.do"/>" class="menu-link">레시피 보관함</a></li>
		</ul>
	</div>
	<div class="member_info">
		<h2>회원정보 조회</h2>
		<div class="info">아이디: <c:out value="${ member.userId }" /><br></div>
		<div class="info">비밀번호: <c:out value="${ member.pwd }" /><br></div>
		<div class="info">닉네임: <c:out value="${ member.nickname }" /><br></div>
		<div class="info">이름: <c:out value="${ member.userName }" /><br></div>
		<div class="info">이메일: <c:out value="${ member.email }" /><br></div>
		<div class="info">회원가입 일시: <c:out value="${ member.joinDate }" /><br></div>
		
		<input class="ma-info-btn" type="button" value="회원정보 수정" onclick="location.href='<c:url value="/mypage/modify.do" />'">
		<input class="ma-info-btn" type="button" value="회원탈퇴" onclick="location.href='<c:url value="/mypage/delete.do" />'">
	</div>
</div>
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${ title }</title>
<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet">
<script src='<c:url value="/resources/js/common.js" />'></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
body {
    background-image: url("https://img3.yna.co.kr/photo/cms/2019/12/21/12/PCM20191221000012005_P2.jpg");
    background-size: cover; /* 이미지를 화면에 꽉 채우도록 설정합니다. */
    background-position: center; /* 이미지를 가운데 정렬합니다. */
    background-repeat: no-repeat; /* 이미지 반복을 중지합니다. */
}
.ma-jo-con {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 92vh; /* 화면 전체 높이에 맞게 조정 */
    width: 1000px;
}
.ma-jo-date{
	width: 100%; height: 40px;
}
.ma-jo-table-btn{
		height: 50px;
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
		
		padding: 10px 18px 9px;
	}
.ma-jo-table td{
	padding: 3px;
}
.ma-jo-ha a{
	text-decoration: none;
	padding: 5px; 
	color: black;
	font-weight: bold;
}
.ma-jo-box {
	align-items:center;
	margin:  auto; 
	text-align: center;
	width: 100%; 
	padding: 100px;
        
    }
.ma-jo-table{
	margin: 0 auto;
	width: 300px;
}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<main>
	<form name="frmJoin" method="post" action="<c:url value='/join.do' />">
		<div class="ma-jo-con">
			<div class="ma-jo-box" >
				<div class="ma-jo-ha">
					<h3>Yumyum 회원가입 </h3> <br><br>
				</div>
				<table class="ma-jo-table">
					<tr>
						<td><input class="ma-jo-date" type="text" placeholder="아이디를 입력해주세요." name="user_id" required><br></td>
					</tr>
					<tr>
						<td><input class="ma-jo-date" type="password" placeholder="비밀번호를 입력해주세요." name="pwd" required><br></td>
					</tr>
					<tr>
						<td><input class="ma-jo-date" type="text" placeholder="별명을 입력해주세요." name="nickname" required><br></td>
					</tr>
					<tr>
						<td><input class="ma-jo-date" type="text" placeholder="이름을 입력해주세요." name="name" required><br></td>
					</tr>
					<tr>
						<td><input class="ma-jo-date" placeholder="이메일을 입력해주세요." type="email" name="email" required><br></td>
					</tr>
					<tr>
						<td><br><br>
							<input class="ma-jo-table-btn" type="submit" value="회원가입">
							<input class="ma-jo-table-btn" type="reset" value="다시 입력">
							<input class="ma-jo-table-btn" type="button" value="돌아가기" onclick="location.href='<c:url value="/login.do" />'">						
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</main>

</body>
</html>

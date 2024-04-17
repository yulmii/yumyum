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

<style>
	.ma-con {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh; /* 화면 전체 높이에 맞게 조정 */
    width: 1000px;
}
    .ma-login-box {
    	align-items:center;
        margin:  auto; 
        text-align: center;
        width: 100%; 
        padding: 100px;
        
    }
	.ma-login-table{
		margin: 0 auto;
		width: 300px;
		
	}
	.ma-login-table-date{
		width: 100%; height: 40px;
	}
	.ma-lohin-table-btn{
		width: 100%;
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
body {
    background-image: url("https://img3.yna.co.kr/photo/cms/2019/12/21/12/PCM20191221000012005_P2.jpg");
    background-size: cover; /* 이미지를 화면에 꽉 채우도록 설정합니다. */
    background-position: center; /* 이미지를 가운데 정렬합니다. */
    background-repeat: no-repeat; /* 이미지 반복을 중지합니다. */
}
.ma-login-ha a{
	text-decoration: none;
	padding: 5px; 

	color: black;
	font-weight: bold;
}

</style>
</head>
<body>
<div class="ma-con">
	<div class="ma-login-box" >
		<div class="ma-login-ha">
			<h3>Yumyum 로그인 </h3> <a href="<c:url value="/login.do" /> "> 로그인 </a> &nbsp;&nbsp;<a href="<c:url value="/join.do" /> "> 회원가입 </a>
		</div>
		<br>
		<table class="ma-login-table">
			<tr><h3>자격이 검증된 쉐프들의 </h3><h3>레시피를 만나보세요.</h3><br><br>
				<td><input class="ma-login-table-date" type="text" placeholder="아이디를 입력해주세요." id="_id" required="required"><br></td>
			</tr>
			<tr>
				<td><input class="ma-login-table-date" type="password" placeholder="비밀번호를 입력하주세요." id="_pwd" required="required"><br><br></td>
			</tr>
			<tr>
				<td><input class="ma-lohin-table-btn" type="button" value="로그인" onclick="login()"></td>
			</tr>	
		
		</table>
	</div>
</div>
<script type="text/javascript">
function login(){
	var _id = $("#_id").val();
	var _pwd = $("#_pwd").val();
	
	$.ajax({
		type : "post",
		async : false,
		url : "<c:url value='/login.do'/>",
		data : {id : _id, pwd : _pwd},
		dataType : "text",
		success: function(data, textStatus){
			console.log(data);
			 if(data == "user"){
				alert("로그인 되었습니다.");
				location.href='<c:url value="/main.do"/>'
			} else if(data == "admin"){
				alert("로그인 되었습니다.");
				location.href='<c:url value="/admin/main.do"/>'
			} else {
				alert("아이디 혹은 비밀번호를 다시 확인하세요.");
			}
		},
		error: function(data, textStatus){ 
			//오류 발생 시 처리
			console.log("에러");
		},
		complete:function(data,textStatus){
			//작업 완료 후 처리
			console.log("완료"); 
		}
	});
	
}
</script>
</body>
</html>
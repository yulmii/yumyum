<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${ title }</title>
<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet">
<script src='<c:url value="/resources/js/common.js" />'></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>

<main>
	아이디: <input type="text" id="_id"><br>
	비밀번호: <input type="text" id="_pwd"><br>
	<input type="button" value="로그인" onclick="login()">
	<input type="reset" value="다시 입력">
	<input type="button" value="회원가입" onclick="location.href='<c:url value="/views/member/join.jsp" />'">
</main>
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
			console.log(data + "가 들어옴");
			 if(data){
				location.href='<c:url value="/views/main/main.jsp"/>'
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
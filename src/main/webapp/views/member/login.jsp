<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">

</style>

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
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
	.ma-jo-date-id-idnick-btn{
		height: 40px;
		font-weight: normal;
		font-size: 10px;
		line-height: 19px;
		text-align: center;
		
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
	width: 500px;
}
.ma-jo-date-id{
	width: 81%;
	height: 40px;
}
.ma-jo-date-idnick{
	width: 77%;
	height: 40px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("#pwd_confirm").keyup(function(){
			if ($('#pwd').val() != $('#pwd_confirm').val()) {
	            $('#pwd_message').text(''); // 클리어
	            $('#pwd_message').html("<b style='color:red;'>비밀번호가 틀립니다.</b>");
	        } else {
	            $('#pwd_message').text(''); // 클리어
	            $('#pwd_message').html("<b>비밀번호가 일치합니다.</b>");
	        }
		})
	});
	
	function idCheck(){
		var _id = $("#user_id").val();
		
		if(_id.trim().length != 0){
			$.ajax({
				type: "post",
				async: false,
				url: "<c:url value='/ajax/idcheck.do'/>",
				data:{
					id: _id
				},
				
				success:function(data, status){
					console.log(data);
					if(data == "false"){
						alert("사용 가능한 아이디입니다.");
					} else {
						alert("중복된 아이디입니다.");
					}
				},
				error:function(data, status){
					alert("아이디 중복 검사 오류입니다. 다시 시도해주세요.")
				},
				complete:function(data, status){
					
				}
			});
		} else {
			alert("아이디를 입력해주세요!");
		}
	}
	function nickCheck(){
		var _nick = $("#nickname").val();
		
		if(_nick.trim().length != 0){
			$.ajax({
				type: "post",
				async: false,
				url: "<c:url value='/ajax/nickcheck.do'/>",
				data:{
					nick: _nick
				},
				
				success:function(data, status){
					console.log(data);
					if(data == "false"){
						alert("사용 가능한 닉네임입니다.");
					} else {
						alert("중복된 닉네임입니다.");
					}
				},
				error:function(data, status){
					alert("닉네임 중복 검사 오류입니다. 다시 시도해주세요.")
				},
				complete:function(data, status){
					
				}
			});
		} else {
			alert("닉네임을 입력해주세요!");
		}
	}
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
						<td><input class="ma-jo-date-id" type="text" placeholder="아이디를 입력해주세요." id="user_id" name="user_id" required>
						<input class="ma-jo-date-id-idnick-btn" type="button" value="ID중복확인" onclick="idCheck()" />
						<br></td>
					</tr>
					<tr>
						<td><input class="ma-jo-date" type="password" placeholder="비밀번호를 입력해주세요." id="pwd" name="pwd" required><br></td>
					</tr>
					<tr>
						<td><input class="ma-jo-date" type="password" placeholder="비밀번호를 다시 입력해주세요." id="pwd_confirm" name="pwd_confirm" required>
						<span id="pwd_message"></span>
						<br></td>
					</tr>
					<tr>
						<td><input class="ma-jo-date-idnick" type="text" placeholder="별명을 입력해주세요." id="nickname" name="nickname" required>
						<input class="ma-jo-date-id-idnick-btn" type="button" value="닉네임중복확인" onclick="nickCheck()" />
						<br></td>
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

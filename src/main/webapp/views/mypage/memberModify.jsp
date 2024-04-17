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

.ma-info-nick-btn {
/* 	float: left; */
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
</style>
<script type="text/javascript">
	$(document).ready(function() {
		joinButAbled(); // 처음: disabled true
		$("#nickname").keyup(function() {
			console.log("접속");
			if ($('#nick').val() != $('#nickname').val()) { // 변경함
				$("#nickCheckTF").val(true);
			} else { // 안함
				$("#nickCheckTF").val(false);
			}
			joinButAbled(); // 상태 점검 후 닉네임 중복 확인 버튼 활성화
		});
	
	});
	
	function joinButAbled() {
		if ($("#nickCheckTF").val() == "true") {
			//$("#join").attr("disabled", false); // 닉네임 바꿨을 경우
			$("#join").show();
		} else {
			//$("#join").attr("disabled", true); // 닉네임 동일할 경우
			$("#join").hide();
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
	<form id="frmModify" name="frmModify" method="post" action="<c:url value='/mypage/modify.do' />">
		<input type="hidden" id="nickCheckTF" value="false" />
		<input type="hidden" name="user_id" value="${ member.userId }" />
		<input type="hidden" id="nick" value="${ member.nickname }" />
		<h2>회원정보 수정</h2><br>
		<div class="info">아이디: <span><c:out value="${ member.userId }" /></span><br></div>
		<div class="info">비밀번호: <input type="text" id="pwd" name="pwd" value="<c:out value="${ member.pwd }" />" required><br></div>
		<div class="info">닉네임: <input type="text" id="nickname" name="nickname" value="<c:out value="${ member.nickname }" />" required>
		<input class="ma-info-nick-btn" id="join" type="button" value="닉네임중복확인" onclick="nickCheck()" /><br></div>
		<div class="info">이름: <input type="text" id="name" name="name" value="<c:out value="${ member.userName }" />" required><br></div>
		<div class="info">이메일: <input type="email" id="email" name="email" value="<c:out value="${ member.email }" />" required><br></div>
		
		<input class="ma-info-btn" type="submit" value="수정">
		<input class="ma-info-btn" type="reset" value="다시 입력">
		
	</form>
	</div>
	</div>
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>

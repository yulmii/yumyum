<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">
.
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
#frmModify {
	width: 800px;
	margin: 0 auto;
	text-align: left;
	margin-bottom: 7px;
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
	<%@ include file="/inc/mypage_side_bar.jsp"%>
	<form id="frmModify" name="frmModify" method="post" action="<c:url value='/mypage/modify.do' />">
		<input type="hidden" id="nickCheckTF" value="false" />
		<input type="hidden" name="user_id" value="${ member.userId }" />
		<input type="hidden" id="nick" value="${ member.nickname }" />
		<h2>회원정보 수정</h2><br>
		아이디: <span><c:out value="${ member.userId }" /></span><br>
		비밀번호: <input type="text" id="pwd" name="pwd" value="<c:out value="${ member.pwd }" />" required><br>
		닉네임: <input type="text" id="nickname" name="nickname" value="<c:out value="${ member.nickname }" />" required><input id="join" type="button" value="닉네임중복확인" onclick="nickCheck()" /><br>
		이름: <input type="text" id="name" name="name" value="<c:out value="${ member.userName }" />" required><br>
		이메일: <input type="email" id="email" name="email" value="<c:out value="${ member.email }" />" required><br>
		
		<input type="submit" value="수정">
		<input type="reset" value="다시 입력">
	</form>
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>

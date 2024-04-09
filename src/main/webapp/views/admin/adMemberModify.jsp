<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp"%>
<style>
.ad-main {
	width: 1200px;
	height: 100%;
}

.ad-menu {
	margin-left : 30%;
	float: left;
	width: 20%;
	background-color: #f4f4f4;
	padding: 30px;
	height: 100%;
}

.ad-content {
	margin-left : 60%;
	margin-bottom: 50px;
/* 	float: right; */
	width: 60%;
	padding: 20px;
	height: 100%;
}

.ad-menu-link {
	display: block;
	margin-bottom: 10px;
	color: #333;
	text-decoration: none;
}

.ad-menu-link:hover {
	background-color: #ccc;
}

.ad-menu-h2 {
	margin-top: 0;
}
</style>
<script type="text/javascript">
	
</script>
<main>
	<form action="${contextPath }/admin/member/modify.do" method="post" onsubmit="modifyMember();">
		<input type="hidden" id="pwCheckTF" value="false" />
		<input type="hidden" name="userId" value="${ member.userId }">
		<div class="ad-main"> 
			<div class="ad-menu">
				<h2 class="ad-menu-h2">메뉴</h2>
				<a href="${contextPath }/admin/member/list.do"  class="ad-menu-link">회원 관리</a> 
				<a href="${contextPath }/admin/recipe/list.do" class="ad-menu-link">게시글 관리</a> 
				<a href="${contextPath }/note/list.do" class="ad-menu-link">공지사항 관리</a>
			</div>

			<div class="ad-content">
				<h2>' ${ member.userName } ' 회원 정보 수정</h2>
				<table >
			<caption>${ member.userName } 회원님의 정보를 수정합니다.</caption>
			<colgroup>
				<col width="120"/>
				<col width="480"/>
				<col width="190"/>
			</colgroup>
			<tbody>
				<tr>
					<td>아이디</td>
					<td colspan="2">
						<span><c:out value="${ member.userId }"/></span>
					</td>
				</tr>
				
				<tr>
					<td>패스워드</td>
					<td colspan="2">
						<input type="password" name="pwd" id="pwd" required="required"  value="${ member.pwd }"/>
					</td>
				</tr>
				
				<tr>
					<td>패스워드 확인</td>
					<td colspan="2">
						<input type="password" name="pwd_confirm" id="pwd_confirm" required="required" />
						<span id="pwd_message"></span>
					</td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td colspan="2">
						<input type="text" name="name" value="${ member.userName }" required />
					</td>
				</tr>
				<tr>
					<td>별명</td>
					<td colspan="2">
						<input type="text" name="nickname" value="${ member.nickname }" required />
					</td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td colspan="2">
						<input type="email" name="email" style="width:300px;" value="${ member.email }" required="required" />
					</td>
				</tr>
				
				<tr>
					<td>관리자</td>
					<td colspan="2">
						<input type="radio" name="admin" id="true" value="true" required="required" <c:if test="${ member.admin eq 'true' }"> checked </c:if> onclick="return(false);"/><label for="true">관리자 권한 O</label>
						<input type="radio" name="admin" id="false" value="false" required="required" <c:if test="${ member.admin eq 'false' }"> checked </c:if> onclick="return(false);" /><label for="false">관리자 권한 X</label>
					</td>
				</tr>
				
				<tr>
					<td id="buttonBox" colspan="3">
						<input type="submit" id="join"  value="정보수정" disabled/>
						<input type="reset"  id="reset" value="새로작성" />
					</td>
				<tr>
			</tbody>
		</table>


			</div>

		</div>
	</form>
</main>
<script>
	$(document).ready(function(){
		$("#pwd_confirm").keyup(function(){
			console.log("접속");
			if ($('#pwd').val() != $('#pwd_confirm').val()) {
	            $('#pwd_message').text(''); // 클리어
	            $('#pwd_message').html("<b style='color:red;'>비밀번호가 틀립니다.</b>");
	            $("#pwCheckTF").val(false);
	        } else {
	            $('#pwd_message').text(''); // 클리어
	            $('#pwd_message').html("<b>비밀번호가 일치합니다.</b>");
	            $("#pwCheckTF").val(true);
	        }
			joinButAbled();
		})
		
	});
	
	function joinButAbled(){
		if($("#pwCheckTF").val() =="true"){
			$("#join").attr("disabled", false);
		} else {
			$("#join").attr("disabled", true);
		}
	}

</script>
<%@ include file="/inc/footer.jsp"%>
</body>
</html>

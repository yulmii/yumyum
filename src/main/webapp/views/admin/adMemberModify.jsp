<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/adheader.jsp"%>
<style>
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
	
</style>
<main>
	<form action="${contextPath }/admin/member/modify.do" method="post" onsubmit="modifyMember();">
		<input type="hidden" id="pwCheckTF" value="true" /> 
		<input type="hidden" name="userId" value="${ member.userId }">
		<div class="ad-main">
			<%@ include file="/inc/adpage_side_bar.jsp"%>
			<div class="ad-modify-content">
				<h1 class="ad-board-title">' ${ member.userName } ' 회원 정보 수정</h1>
				<table>
					<caption>${ member.userName }회원님의정보를수정합니다.</caption>
					<caption>비밀번호를 입력하셔야 정보 수정이 가능합니다.</caption>
					<colgroup>
						<col width="120" />
						<col width="480" />
						<col width="190" />
					</colgroup>
					<tbody>
						<tr>
							<td>아이디</td>
							<td colspan="2"><span><c:out value="${ member.userId }" /></span></td>
						</tr>

						<tr>
							<td>패스워드</td>
							<td colspan="2"><input type="password" name="pwd" id="pwd"
								required="required" value="${ member.pwd }" /></td>
						</tr>

						<tr>
							<td>패스워드 확인</td>
							<td colspan="2"><input type="password" name="pwd_confirm"
								id="pwd_confirm" required="required" /> <span id="pwd_message"></span>
							</td>
						</tr>

						<tr>
							<td>이름</td>
							<td colspan="2"><input type="text" name="userName"
								id="userName" value="${ member.userName }" required /></td>
						</tr>
						<tr>
							<td>별명</td>
							<td colspan="2"><input type="text" name="nickname"
								id="nickname" value="${ member.nickname }" required /></td>
						</tr>

						<tr>
							<td>이메일</td>
							<td colspan="2"><input type="email" name="email" id="email"
								style="width: 300px;" value="${ member.email }"
								required="required" /></td>
						</tr>

							<tr>
							    <td>관리자</td>
							    
							    <td colspan="2">
							        <c:choose>
							            <c:when test="${ sessionScope._admin == 'T' }">
							                <!-- 관리자 권한이 'T'인 경우에만 보여줌 -->
							                <input type="radio" name="admin" id="M" value="M" <c:if test="${ member.admin == 'M' }"> checked </c:if> />
							                <label for="M">관리자 권한 O</label>
							                <input type="radio" name="admin" id="F" value="F" <c:if test="${ member.admin == 'F' }"> checked </c:if> />
							                <label for="F">관리자 권한 X</label>
							            </c:when>
							            <c:otherwise>
							                <!-- 나머지 경우는 숨김 -->
							                <input type="hidden" name="admin" value="${ member.admin }" />
							            </c:otherwise>
							        </c:choose>
							    </td>
							</tr>


						<tr>
							
							<td id="buttonBox" colspan="3">
								<input class="ad-member-mod-btn" type="submit" id="join" value="정보수정" disabled />
								<input class="ad-member-mod-btn" type="reset" id="reset" value="새로작성" /> 
								<input class="ad-member-mod-btn" type="button" id="delete" value="회원 정보 삭제" onclick="deleteMember();" />
							</td>
							
						</tr>
					</tbody>
				</table>

			</div>

		</div>
	</form>
</main>
<script>
	$(document).ready(function() {
	
		joinButAbled();
		$("#pwd_confirm").keyup(function() {
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
		});

	});
	
	function joinButAbled() {
		if ($("#pwCheckTF").val() == "true") {
			$("#join").attr("disabled", false);
		} else {
			$("#join").attr("disabled", true);
		}
	}
	function deleteMember() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			var userId = "${member.userId}";
			location.href = "${contextPath}/admin/member/delete.do?id="+ userId;
		}
	}
</script>

</body>
</html>

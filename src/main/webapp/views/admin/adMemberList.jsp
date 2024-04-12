<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/adheader.jsp"%>
<style>
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

</style>

<main class="ad-main-all">
	<div class="ad-main">
	
		<%@ include file="/inc/adpage_side_bar.jsp"%>
		
		<section class="ad-main-table">
			<!--for demo wrap-->
			<h1 class="ad-board-title">회원관리</h1>
			<div class="ad-tbl-header">
				<table cellpadding="0" cellspacing="0" border="0">
					<thead>
						<tr>
							<th>회원아이디</th>
							<th>회원이름</th>
							<th>닉네임</th>
							<th>이메일</th>
							<th>수정</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="ad-tbl-content-list">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<c:forEach var="member" items="${membersList}" varStatus="status">
							
								<tr align="center">
									<td>${member.userId}</td>
									<td>${member.userName}</td>
									<td>${member.nickname}</td>
									<td>${member.email}</td>
									<td><a
										href='<c:url value="/admin/member/modify.do?userId=${member.userId}" /> '>수정</a></td>
								</tr>
							
						</c:forEach>
					</tbody>
				</table>
			</div>

		</section>
			
	</div>
</main>


</body>
</html>
<script>


	$(window).on(
			"load resize ",
			function() {
				var scrollWidth = $('.ad-tbl-content').width()
						- $('.ad-tbl-content table').width();
				$('.ad-tbl-header').css({
					'padding-right' : scrollWidth
				});
			}).resize();
</script>


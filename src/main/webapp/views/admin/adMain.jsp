<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/adheader.jsp"%>
<style>
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

</style>


<main class="ad-main-all">
	<div class="ad-main">
		<div class="ad-side-meun">
			<ul class="ad-side-meun-bar">
				<h2 class="ad-menu-h2"><a class="ad-home-meun" href="<c:url value="/admin/main.do" />"> 관리자</a></h2>
				<li><a href="<c:url value="/admin/member/list.do"/> " class="ad-menu-link">회원 관리</a></li>
				<li><a href="<c:url value="/admin/recipe/list.do"/>" class="ad-menu-link">게시글 관리</a></li>
				<li><a href="<c:url value="/admin/note/list.do"/>" class="ad-menu-link">공지사항 관리</a></li>

				<br><br>
				<h2 class="ad-menu-h2"><a class="ad-home-meun" href="<c:url value="/main.do" />"> Yumyum</a></h2>
				<li><a href="<c:url value="/recipe/list.do?category=hansik"/> ">한식</a></li>
				<li><a href="<c:url value="/recipe/list.do?category=jungsik"/>">중식</a></li>
				<li><a href="<c:url value="/recipe/list.do?category=ilsik"/>">일식</a></li>
				<li><a href="<c:url value="/recipe/list.do?category=yangsik"/>">양식</a></li>
				<li><a href="<c:url value="/note/list.do" />">공지 사항</a></li>
			</ul>
		</div>
		<section class="ad-main-table">
			<!--for demo wrap-->
			<h1 class="ad-board-title">회원관리</h1>
			<div class="ad-tbl-header">
				<table cellpadding="0" cellspacing="0" border="0" >
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
			<div class="ad-tbl-content-main">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<c:forEach var="member" items="${membersList}" varStatus="status">
							<c:if test="${status.index < 3}">
								<tr align="center">
									<td>${member.userId}</td>
									<td>${member.userName}</td>
									<td>${member.nickname}</td>
									<td>${member.email}</td>
									<td><a href='<c:url value="/admin/member/modify.do?userId=${member.userId}" /> '>수정</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<h1 class="ad-board-title">레시피 관리</h1>
			<div class="ad-tbl-header">
				<table cellpadding="0" cellspacing="0" border="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>회원아이디</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>조회수</th>
							<th>좋아요</th>
							<th>삭제</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="ad-tbl-content-main">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<c:forEach var="recipe" items="${recipeList}" varStatus="status">
							<c:if test="${status.index < 3}">
								<tr align="center">
									<td>${recipe.boardIdx}</td>
									<td>${recipe.userId}</td>
									<td>${recipe.category}</td>
									<td>${recipe.title}</td>
									<td>${recipe.hit}</td>
									<td>${recipe.like}</td>
									<td><a href='<c:url value="/admin/recipe/delete.do?boardIdx=${recipe.boardIdx}" /> '>삭제</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<h1 class="ad-board-title">공지사항 관리</h1>
			<div class="ad-tbl-header">
				<table cellpadding="0" cellspacing="0" border="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>공지 시간</th>
							<th>작성자</th>
							<th>수정</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="ad-tbl-content-main">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<c:forEach var="note" items="${noteList}" varStatus="status">
							<c:if test="${status.index < 3}">
								<tr align="center">
									<td>${note.noteIdx}</td>
									<td>${note.title}</td>
									<td>${note.createDate}</td>
									<td>${note.writer}</td>
									<td><a href='<c:url value="/admin/note/modify.do?noteIdx=${note.noteIdx}" /> '>수정</a></td>
								</tr>
							</c:if>
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


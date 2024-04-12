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
				<li><a href="<c:url value="/recipe/list.do?category=한식"/> ">한식</a></li>
				<li><a href="<c:url value="/recipe/list.do?category=중식"/>">중식</a></li>
				<li><a href="<c:url value="/recipe/list.do?category=일식"/>">일식</a></li>
				<li><a href="<c:url value="/recipe/list.do?category=양식"/>">양식</a></li>
				<li><a href="<c:url value="/note/list.do" />">공지 사항</a></li>
			</ul>
		</div>
		<section class="ad-main-table">

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
			<div class="ad-tbl-content-list">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<c:forEach var="recipe" items="${recipeList}" varStatus="status">
							
								<tr align="center">
									<td>${recipe.boardIdx}</td>
									<td>${recipe.userId}</td>
									<td>${recipe.category}</td>
									<td>${recipe.title}</td>
									<td>${recipe.hit}</td>
									<td>${recipe.like}</td>
									<td><a href='<c:url value="/admin/recipe/delete.do?boardIdx=${recipe.boardIdx}" /> ' onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a></td>
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


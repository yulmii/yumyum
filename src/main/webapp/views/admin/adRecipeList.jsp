<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp"%>
<style>
.ad-main {
	width: 1200px;
	height: 100%;
}

.ad-menu {
	margin-left: 30%;
	float: left;
	width: 20%;
	background-color: #f4f4f4;
	padding: 30px;
	height: 100%;
}

.ad-content {
	margin-left: 60%;
	margin-bottom: 50px;
	/* 	float: right; */
	width: 60%;
	padding: 20px;
	height: 100%;
}

.ad-content table {
	align: center;
	border: 1px solid 000;
}

.ad-content th {
	text-align: center;
	border: 1px solid 000;
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

	<div class="ad-main">
		<div class="ad-menu">
			<h2 class="ad-menu-h2">메뉴</h2>
			<a href="${contextPath }/admin/main.do"  class="ad-menu-link">전체 보기</a> 
			<a href="${contextPath }/admin/member/list.do"  class="ad-menu-link">회원 관리</a> 
			<a href="${contextPath }/admin/recipe/list.do" class="ad-menu-link">게시글 관리</a> 
			<a href="${contextPath }/note/list.do" class="ad-menu-link">공지사항 관리</a>
		</div>

		<div class="ad-content">

			<h2>레시피 관리</h2>
			<table align="center" border="1">
				<colgroup>
					<col width="50" />
					<!--  레시피 번호 -->
					<col width="150" />
					<!--  회원 아이디 -->
					<col width="150" />
					<!-- 카테고리 -->
					<col width="250" />
					<!-- 제목 -->
					<col width="100" />
					<!-- 조회수 -->
					<col width="100" />
					<!-- 좋아요 -->
					<col width="100" />
					<!-- 삭제 -->
				</colgroup>
				<thead>
					<!-- 글제목  -->
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
				<c:forEach var="recipe" items="${recipeList}" varStatus="status">

					<tr align="center">
						<td>${recipe.boardIdx}</td>
						<td>${recipe.userId}</td>
						<td>${recipe.category}</td>
						<td>${recipe.title}</td>
						<td>${recipe.hit}</td>
						<td>${recipe.like}</td>
						<td><a href='<c:url value="/admin/recipe/delete.do?userId=${recipe.boardIdx}" /> '>삭제</a></td>
					</tr>

				</c:forEach>

			</table>


		</div>

	</div>

</main>
<%@ include file="/inc/footer.jsp"%>
</body>
</html>

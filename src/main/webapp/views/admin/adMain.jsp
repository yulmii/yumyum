<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp"%>
<style>
.ad-main {
	width: 1200px;
	height: 800px;
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

.ad-content table{
	align:center;
	border:1px solid 000;
}
.ad-content th{
	text-align: center;
	border:1px solid 000;
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
			<h2>회원관리</h2>
			<table align="center" border="1">
				<colgroup>
					<col width="150" />
					<!--  회원 이름 -->
					<col width="150" />
					<!--  회원 아이디 -->
					<col width="150" />
					<!-- 별명 -->
					<col width="200" />
					<!-- 이메일 -->
					<col width="100" />
					<!-- 수정 -->
					<col width="150" />
					<!-- 이메일보내기 -->
				</colgroup>
				<thead>
					<!-- 글제목  -->
					<tr>
						<th>회원아이디</th>
						<th>회원이름</th>
						<th>닉네임</th>
						<th>이메일</th>
						<th>수정</th>
						<th>메일보내기</th>
					</tr>
				</thead>
				<c:forEach var="member" items="${membersList}" varStatus="status">
					<c:if test="${status.index < 5}">
						<tr align="center">
							<td>${member.userId}</td>
							<td>${member.userName}</td>
							<td>${member.nickname}</td>
							<td>${member.email}</td>
							<td><a href='<c:url value="/admin/member/modify.do?userId=${member.userId}" /> '>수정</a></td>
							<td><a href="mailto:${member.email}">메일보내기</a></td>
						</tr>
					</c:if>
				</c:forEach>

			</table>
			<br>
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
					<c:if test="${status.index < 5}">
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

			</table>
			<br>
			<h2>공지사항 관리</h2>
			<table align="center" border="1">
				<colgroup>
					<col width="50" />
					<!--  레시피 번호 -->
					<col width="350" />
					<!--  제목 -->
					<col width="100" />
					<!-- 공지 시간 -->
					<col width="150" />
					<!-- 작성자 -->
					<col width="100" />
					<!-- 수정 -->

				</colgroup>
				<thead>
					<!-- 글제목  -->
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>공지 시간</th>
						<th>작성자</th>
						<th>수정</th>
					</tr>
				</thead>
				<c:forEach var="note" items="${noteList}" varStatus="status">
					<c:if test="${status.index < 5}">
						<tr align="center">
							<td>${note.noteIdx}</td>
							<td>${note.title}</td>
							<td>${note.createDate}</td>
							<td>${note.writer}</td>
							<td><a href='<c:url value="/admin/note/modify.do?noteIdx=${note.noteIdx}" /> '>수정</a></td>
						</tr>
					</c:if>
				</c:forEach>

			</table>

		</div>

	</div>

</main>
<%@ include file="/inc/footer.jsp"%>
</body>
</html>

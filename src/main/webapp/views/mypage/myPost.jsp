<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
<main>
<!-- 뭐가 보여야 하는가 -->
<!-- "나"의 아이디에 대한 작성 글 리스트 및 페이지 내비게이터 -->
	<table align="center" width="750px" summary="나의 레시피 목록">
		<colgroup>
			<col width="8%" />
			<col width="50%" />
			<col width="14%" />
			<col width="8%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<!-- 헤더  -->
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>좋아요</th>
				<th>작성일자</th>
			</tr>
		</thead>

		<!-- 글목록 데이터부분 시작-->
		<tbody>
			<c:forEach var="recipe" items="${recipeList}" varStatus="status">
				<tr>
					<!-- 번호 -->
					<td align="center"><c:out value="${ recipe.boardIdx }" />
					</td>
					<!-- 제목, 여기에 상세 보기 링크 -->
					<td align="center"><a href='<c:url value="/recipe/detail.do?boardIdx=${ recipe.boardIdx }"/>'><c:out value="${ recipe.title }" /></a>
					</td>
					<!-- 조회수 -->
					<td align="center"><c:out value="${ recipe.hit }" /></td>
					<!-- 좋아요 -->
					<td align="center"><c:out value="${ recipe.like }" /></td>
					<!-- 작성일자 -->
					<td align="center">
						<c:out value="${ recipe.createDate }" />
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<!-- 상품목록 데이터부분 종료 -->

	</table>
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>
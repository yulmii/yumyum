<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">

</style>
<script type="text/javascript">

</script>
<main>
	<table align="center" width="750px" summary="나의 보관함 목록">
		<colgroup>
			<col width="5%" />
			<col width="44%" />
			<col width="15%" />
			<col width="8%" />
			<col width="8%" />
			<col width="20%" />
		</colgroup>
		<thead>
			<!-- 헤더  -->
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
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
					<td align="center"><a href="/recipe/detail.do?no=${ recipe.boardIdx }&amp;title=${ recipe.title }"><c:out value="${ recipe.title }" /></a>
					</td>
					<!-- 작성자 -->
					<td align="center"><c:out value="${ recipe.nickname }" />
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
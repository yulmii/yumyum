<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp"%>
<style type="text/css">
.contain__inner {
	width: 1050px;
	margin: 0 auto;
	text-align: center;
}

.contain__inner.search__result_box {
	/* padding-top: 50px; */
	
}

.search__result_box .title__box {
	text-align: left;
}

.title__box {
	margin-bottom: 28px;
}

.title__box>div {
	display: inline-block;
}

.home_content_title p {
	font-size: 2.4rem;
	line-height: 35px;
	font-weight: bold;
	letter-spacing: -1.05px;
	margin: 0;
	color: #171F29;
}

.search__content__flex_box {
	display: flex;
	flex-wrap: wrap;
}

.search__content__flex_box .recipe__txt {
	width: 198px;
	text-align: left;
	height: 285px;
}

.recipe__image {
	width: 180px;
	height: 180px;
	/* border: 0.3px solid #ADB7C2; */
	box-sizing: border-box;
	border-radius: 4px;
	margin-bottom: 15px;
	cursor: pointer;
}

.recipe__image img {
	/*     object-fit: cover !important; */
	width: 180px;
	height: 180px;
}

.recipe__txt h5 {
	margin: 0;
	font-weight: 500;
	color: #313D4B;
}

.recipe__txt h5, .recipe__txt p {
	font-size: 13px;
	line-height: 19px;
	letter-spacing: -0.7px;
	width: 100%;
}

.recipe__txt p {
	color: #8B95A2;
	font-weight: normal;
}

p {
	margin: 0 0 10px;
}

.text-center {
	text-align: center;
}

.hide-item {
	margin-bottom: 7px;
}

.re-goRecipeWriteBtn{
	font-weight: normal;
	font-size: 13px;
	line-height: 19px;
	text-align: center;
	letter-spacing: -0.7px;
	
	color: #FFFFFF;
	background: #2F83F5;
	border-radius: 3px;
	border: none;
	
	padding: 11px 20px 10px;
}
.re-btnRight{
	text-align: right;
}
</style>
<script type="text/javascript">
	
</script>
<main>
	<div class="contain__inner search__result_box">
		<div class="title__box">
			<div class="home_content_title">
				<p>레시피</p>
			</div>
		</div>
		<section class="search__content_wrapper">
			<c:choose>
				<c:when test="${totalCount == 0}">
					<div id="recipeListEmptyBox" class="hide-item">레시피가 없습니다.</div>
				</c:when>
				<c:otherwise>
					<div id="recipeListBox" class="search__content__flex_box">
						<c:forEach var="recipe" items="${ recipeList }">
							<div class="recipe__view_conetnet_1 recipe__txt">
								<div class="recipe__image">
									<img name="recipeImage" alt=""
										src="/upload/recipe/${ recipe.thumbnail }"
										onclick="location.href='<c:url value="/recipe/detail.do?boardIdx=${ recipe.boardIdx }"/>'" />
								</div>
								<h5 class="notranslate">${ recipe.title }</h5>
								<p class="notranslate">${ recipe.writer }</p>
							</div>
						</c:forEach>
					</div>
					<div class="pagination_block text-center">
						<c:out value="${ pagination }" escapeXml="false" />
					</div>
					<!-- <nav id="pageNav" class="pagination_block text-center">
				<ul class="pagination">
					<li class="active" title="현재 페이지"><a href="#">1</a></li>
					<li><a href="#" onclick="getList('2')" '="" title="2 페이지로 이동">2</a></li>
				</ul>
			</nav> -->
				</c:otherwise>
			</c:choose>
		</section>
		<div class="re-btnRight">
			<input type="button" class="re-goRecipeWriteBtn" value="레시피 등록하기" onclick="location.href='<c:url value="/recipe/write.do"/>'" />
		</div>
	</div>
</main>
<%@ include file="/inc/footer.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		var _count = <c:out value="${listCount}"/>;	
		$("#ad-selectInput").val(_count).prop("selected",true);
	});
	
	function paging(num){
		var _count = <c:out value="${listCount}"/>
		location.href = `<c:url value="/admin/note/list.do?pageNum=${ '${num }' }&listCount=${ '${_count}' }"/> `;
	}

	function selectListCount(){
		var _value = $(".ad-selectInput").val();
		
		location.href = `<c:url value="/admin/note/list.do?listCount=${ '${ _value }'}"/>`;
	}
</script>
</body>
</html>
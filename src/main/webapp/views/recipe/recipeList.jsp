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
	display: none;
	margin-bottom: 7px;
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
			<div id="recipeListBox" class="search__content__flex_box">
				<div class="recipe__view_conetnet_1 recipe__txt">
					<div class="recipe__image">
						<img name="recipeImage" alt=""
							src="/upload/recipe/${ recipe.thumbnail }"
							onclick="recipeDetailBtn('${ recipe.boardIdx }')">
					</div>
					<h5 class="notranslate">${ recipe.title }</h5>
					<p class="notranslate">${ recipe.nickname }</p>
				</div>
			</div>
			<nav class="pagination_block text-center">
	        	<c:out value="${ pagination }" escapeXml="false"/>
	      	</nav>
	      	
			<!-- <nav id="pageNav" class="pagination_block text-center">
				<ul class="pagination">
					<li class="active" title="현재 페이지"><a href="#">1</a></li>
					<li><a href="#" onclick="getList('2')" '="" title="2 페이지로 이동">2</a></li>
				</ul>
			</nav> -->

			<div id="recipeListEmptyBox" class="hide-item" style="display: none;">
				검색된 결과가 없습니다.</div>
		</section>


	</div>
</main>
<%-- <%@ include file="/inc/footer.jsp"%> --%>
</body>
</html>
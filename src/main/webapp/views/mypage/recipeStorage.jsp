<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
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
	display: inline-block;
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

.no-pagingBox{
	margin-top: 20px;
	margin-bottom: 50px;
	padding-right: 40px;
	border-collapse: collapse;
}

.nextPrevBut{
	cursor: pointer;
	justify-content: center;
	background-color: #fff;
	border: none;
}
  
.butActive:hover{

}
  
.pagingBut{
	font-size: 20px;
	background-color: #fff;
	border: none;
	width: 37px;
	height: 37px;
}
  
.otherPage:hover{
	border: 2px solid #adadad;
}
  
.pageActive{
	border: 2px solid #222;
}
</style>

<main>
	<%@ include file="/inc/mypage_side_bar.jsp"%>
	<div class="contain__inner search__result_box">
		<div class="title__box">
			<div class="home_content_title">
				<p>${ member.nickname }</p>&nbsp;&nbsp;<span>님의 레시피 보관함</span>
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
								<input type="hidden" id="boardIdx" value="${ recipe.boardIdx }" />
								<div class="recipe__image">
									<img name="recipeImage" alt=""
										src="/upload/recipe/${ recipe.thumbnail }"
										onclick="location.href='<c:url value="/recipe/detail.do?boardIdx=${ recipe.boardIdx }"/>'" />
								</div>
								<h5 class="notranslate">${ recipe.title }</h5>
								<p class="notranslate">${ recipe.writer }</p>
								<input type="button" value="삭제" onclick="deleteBox();" >
							</div>
						</c:forEach>
					</div>
					<div class="re-pagingBox">
	        			<c:out value="${ pagination }" escapeXml="false"/>
	      			</div>
				</c:otherwise>
			</c:choose>
		</section>
	</div>
</main>
<%@ include file="/inc/footer.jsp" %>
<script type="text/javascript">
	function deleteBox() {
		var _no = $("#boardIdx").val();
		$.ajax({
			type : "get",
			async : false,
			url : "<c:url value='/mypage/mybox/delete.do'/>",
			data : {
				no : _no,
			},
	
			success : function(data, status) {
				alert("삭제되었습니다.")
				location.href = "<c:url value='/mypage/mybox/list.do'/>";
			},
			error : function(data, status) {
				alert("다시 시도해주세요.")
			},
			complete : function(data, status) {
	
			}
		});
	}
	function paging(num){
		 location.href = "?pageNum="+num;
	}
</script>
</body>
</html>
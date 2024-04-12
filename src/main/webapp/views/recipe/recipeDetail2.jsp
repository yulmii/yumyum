<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp"%>
<style type="text/css">
.re-container {
	width: 1150px;
	margin: 0 auto;
}

.re-center {
	text-align: center;
	vertical-align: middle;
}

.re-right {
	text-align: right;
	vertical-align: middle;
}

/* left box */
.recipe__detail_common_box__border {
    background: #FFFFFF;
    overflow: hidden;
}

.border__custom__div {
	width: 742px;
	margin: 0 auto;
    background: #FFFFFF;
    box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.0412205);
    border-radius: 10px;
    overflow: hidden;
}

.recipe__detail_mainImg {
    width: 100%;
    height: 388px;
    position: relative;
}

.recipe__detail_mainImg:after {
    content: "";
    background: linear-gradient(0deg, #FFFFFF 3.94%, rgba(255, 255, 255, 0.0001) 100%);
    position: absolute;
    height: 120px;
    width: 100%;
    bottom: 0;
    left: 0;
}

.recipe__detail_left__content_up {
    padding: 0 26px 35px;
    text-align: left;
}

.recipe__detail.title {
    text-align: left;
    margin-bottom: 20px;
}

.title__nav {
    text-align: left;
    margin-bottom: 4px;
}

.title__nav label {
    font-weight: 500;
    font-size: 13px;
    line-height: 19px;
    letter-spacing: -0.56875px;

    color: #8B95A2;
    margin: 0;
}

.title__main p {
    margin: 0;
    display: inline-block;

    font-weight: bold;
    font-size: 24px;
    line-height: 35px;
    letter-spacing: -1.05px;

    color: #171F29;
}

.title__main span {
    margin-left: 6px;

    font-weight: 500;
    font-size: 13px;
    line-height: 19px;
    letter-spacing: -0.56875px;

    color: #171F29;
}

.subBox__down_content label {
    font-weight: 500;
    font-size: 13px;
    line-height: 19px;
    letter-spacing: -0.56875px;

    color: #8B95A2;
    margin-bottom: 0;
}

.recipe__detail__subBox > .left__content {
    float: left;
    display: inline-block;
}

.recipe__detail__subBox > .right__content {
    float: right;
    display: inline-block;
}

.recipe__detail__subBox > .right__content button:last-child {
    margin-left: 7px;
}

.recipe__detail__subBox {
    margin-bottom: 47px;
}

.clear__both {
	clear: both;
}

.re-detail-introduction {
    border-bottom: 1px solid #EBEEF1;
    margin-bottom: 30px;
}

.title__introduction {
    margin-bottom: 16px;
}

.title__introduction p {
	display: inline-block;
    font-weight: bold;
    font-size: 16px;
    line-height: 23px;
    letter-spacing: -0.861539px;

    color: #313D4B;
    margin-bottom: 0px;
}

.title__introduction span {
	margin-left : 10px;
  	font-weight: normal;
    font-size: 13px;
    line-height: 19px;
    letter-spacing: -0.7px;

    color: #313D4B;
}

.txt__introduction {
    margin-bottom: 31px;
    /*padding-right: 43px;*/
}

.txt__introduction p {
    font-weight: normal;
    font-size: 13px;
    line-height: 19px;
    letter-spacing: -0.7px;

    color: #313D4B;
}

.txt__introduction p img {
    max-width: 100% !important;
    height: unset !important;
}

.re-detail-introduction.image__and__video_box {
    border-bottom: none;
    margin-bottom: 0;
}

.commonBtn__storageboxaddBtn {
	font-weight: normal;
	font-size: 13px;
	line-height: 19px;
	text-align: center;
	letter-spacing: -0.7px;
	
	color: #2F83F5;
	
	background: #FFFFFF;
	border: 1px solid #2F83F5;
	box-sizing: border-box;
	border-radius: 3px;
	
	padding: 10px 18px 9px;
}

.commonBtn__storageboxaddBtn img {
	vertical-align: top;
}

.commonBtn__purchaseBtn {
	font-weight: 500;
	font-size: 13px;
	line-height: 19px;
	text-align: center;
	letter-spacing: -0.7px;
	
	color: #FFFFFF;
	background: #2F83F5;
	border-radius: 3px;
	border: none;
	
	padding: 11px 45px 10px;
}




</style>
<main>
	<div class="border__custom__div">

		<div class="recipe__detail_mainImg">
			<img style="height: 100%; width: 100%;" alt=""
				src="/upload/recipe/recipethumb1.jpg">
		</div>
		<div
			class="recipe__detail_left__content_up recipe__detail_common_box__border">
			<div class="recipe__detail title">
				<div class="title__nav">
					<label> ${ recipe.category } </label>
					<label style="float: right;">조회수 ${ recipe.hit }</label>
				</div>

				<div class="title__main">
					<p class="notranslate" id="mainRecipeTitle">${ recipe.title }</p>

					<span class="notranslate" id="mainArtistName">${ recipe.nickname }</span>
				</div>
			</div>

			<div class="recipe__detail__subBox">
				<div class="left__content">

					<div class="subBox__down_content">


						<label>∙</label>


					</div>
				</div>
				<div class="right__content">
					<c:choose>
						<c:when test="${sessionScope._userId = recipe.userId}">
							<button id="recipeFavoriteBtn" class="commonBtn__storageboxaddBtn">
							 수정
							</button>
						</c:when>
						<c:otherwise>
							<button id="recipeFavoriteBtn" class="commonBtn__storageboxaddBtn">
								<img alt="" src='<c:url value="/resources/images/addStorgeBoxImg.png" />'> 보관함에 추가
							</button>
						</c:otherwise>
					</c:choose>
					<button id="payBtn" class="commonBtn__purchaseBtn"
						onclick="purchasePopupBtn('48')">❤ 좋아요</button>

				</div>
				<div class="clear__both"></div>
			</div>

			<div class="re-detail-introduction">
				<div class="re-detail-introduction-txt">
					<div class="title__introduction">
						<p>재료</p>
						<span>${ recipe.ingredient }</span>
					</div>
					<div class="title__introduction">
						<p>요리시간</p>
						<span>${ recipe.cookHour } 시간 ${ recipe.cookMinute } 분</span>
					</div>
				</div>
			</div>



			<div class="re-detail-introduction image__and__video_box">
				${ recipe.content }
			</div>




		</div>
	</div>
</main>
<%@ include file="/inc/footer.jsp"%>
</body>
</html>
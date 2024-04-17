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

.re-goModifyBtn {
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

.re-goDeleteBtn {
	font-weight: normal;
	font-size: 13px;
	line-height: 19px;
	text-align: center;
	letter-spacing: -0.7px;
	
	color: #2F83F5;
	
	background: #FFFFFF;
	border: 1px solid red;
	box-sizing: border-box;
	border-radius: 3px;
	
	padding: 10px 18px 9px;
}

.re-addBoxBtn {
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

.re-addBoxBtn img {
	vertical-align: top;
}

.re-likeBtn {
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

.liked {
	background: red;
}

#re-activeHeartIcon{
	width: 1em;
	height: 1em;
	vertical-align: -0.125em;
	fill: red;
	display: none;
}

#re-inactiveHeartIcon {
	width: 1em;
    height: 1em;
    vertical-align: -0.125em;
    fill: #ddd;
    display: none;
}

</style>
<main>
	<div class="border__custom__div">

		<div class="recipe__detail_mainImg">
			<img style="height: 100%; width: 100%;" alt=""
				src="/upload/recipe/thumbnail/${ recipe.thumbnail }">
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

					<span class="notranslate" id="mainArtistName">${ recipe.writer }</span>
				</div>
			</div>

			<div class="recipe__detail__subBox">
				<div class="left__content">

					<div class="subBox__down_content">
						<br/>
						<a href="javascript:fnLike()" style="text-decoration: none;">
							<svg xmlns="http://www.w3.org/2000/svg"  id="re-inactiveHeartIcon" aria-hidden="true" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M225.8 468.2l-2.5-2.3L48.1 303.2C17.4 274.7 0 234.7 0 192.8v-3.3c0-70.4 50-130.8 119.2-144C158.6 37.9 198.9 47 231 69.6c9 6.4 17.4 13.8 25 22.3c4.2-4.8 8.7-9.2 13.5-13.3c3.7-3.2 7.5-6.2 11.5-9c0 0 0 0 0 0C313.1 47 353.4 37.9 392.8 45.4C462 58.6 512 119.1 512 189.5v3.3c0 41.9-17.4 81.9-48.1 110.4L288.7 465.9l-2.5 2.3c-8.2 7.6-19 11.9-30.2 11.9s-22-4.2-30.2-11.9zM239.1 145c-.4-.3-.7-.7-1-1.1l-17.8-20c0 0-.1-.1-.1-.1c0 0 0 0 0 0c-23.1-25.9-58-37.7-92-31.2C81.6 101.5 48 142.1 48 189.5v3.3c0 28.5 11.9 55.8 32.8 75.2L256 430.7 431.2 268c20.9-19.4 32.8-46.7 32.8-75.2v-3.3c0-47.3-33.6-88-80.1-96.9c-34-6.5-69 5.4-92 31.2c0 0 0 0-.1 .1s0 0-.1 .1l-17.8 20c-.3 .4-.7 .7-1 1.1c-4.5 4.5-10.6 7-16.9 7s-12.4-2.5-16.9-7z"/></svg>
							<svg xmlns="http://www.w3.org/2000/svg" id="re-activeHeartIcon" aria-hidden="true" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/></svg>
							<label id="likeNum">${ recipe.like }</label>
						</a>
					</div>
				</div>
				<div class="right__content">
					<c:choose>
						<c:when test="${sessionScope._userId == recipe.userId}">
							<button class="re-goModifyBtn" onclick="location.href='<c:url value="/recipe/modify.do?boardIdx=${ recipe.boardIdx }" />'">수정</button>
							<button class="re-goDeleteBtn" onclick="fnDelete()">삭제</button>
						</c:when>
						<c:otherwise>
							<button id="recipeFavoriteBtn" class="re-addBoxBtn" onclick="addBox()">
								<img alt="" src='<c:url value="/resources/images/addStorgeBoxImg.png" />'> 보관함에 추가
							</button>
						</c:otherwise>
					</c:choose>
					<!-- <button id="likeBtn" class="re-likeBtn"
						onclick="fnLike()">❤ 좋아요</button> -->

				</div>
				<div class="clear__both"></div>
			</div>

			<div class="re-detail-introduction">
				<div class="re-detail-introduction-txt">
					<div class="title__introduction">
						<p>재료</p>
						<span>${ recipe.ingredient }</span>
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
<script type="text/javascript">

// 페이지 로드 시 좋아요 상태 확인
	var previousPageUrl = document.referrer;
	
	$(document).ready(function() {
		initLikeStatus();
	});

	function initLikeStatus() {
		console.log( ${ like });
		if (${ like }) {
			$("#re-activeHeartIcon").show(); 
			$("#re-inactiveHeartIcon").hide();
		} else {
			$("#re-activeHeartIcon").hide(); 
			$("#re-inactiveHeartIcon").show();
		}
	}
	
	
	// 좋아요 버튼 클릭 시 실행되는 함수
	function fnLike() {
	    $.ajax({
	        url: '<c:url value="/recipe/detail.do" />', // 좋아요 처리하는 서버 사이드 코드
	        type: "POST",
	        data: { boardIdx : ${ recipe.boardIdx } }, // 상품 ID를 전달
	        dataType: "text",
	        success: function(result) {
	        	var data = JSON.parse(result);
				if(data.like == "like"){
					$("#re-activeHeartIcon").show(); 
					$("#re-inactiveHeartIcon").hide();
					$("#likeNum").text();
					$("#likeNum").text(data.likeNum);
					
				}else{
					$("#re-activeHeartIcon").hide(); 
					$("#re-inactiveHeartIcon").show();
					$("#likeNum").text();
					$("#likeNum").text(data.likeNum);
				}
	        }
	    });
	}

	// 보관 버튼 클릭 시 실행되는 함수
	function addBox() {
	    $.ajax({
	        url: '<c:url value="/recipe/addbox.do" />', // 좋아요 처리하는 서버 사이드 코드
	        type: "POST",
	        data: { boardIdx : ${ recipe.boardIdx } }, // 상품 ID를 전달
	        dataType: "text",
	        success: function(data) {
				if(data == "addBox"){
					alert("보관되었습니다.");
				}else{
					alert("이미 보관된 레시피 입니다.");
				}
	        }
	    });
	}
	
	//삭제 버튼 클릭 시 
	function fnDelete() {
	    $.ajax({
	        url: '<c:url value="/recipe/delete.do" />', // 삭제 처리하는 서버 사이드 코드
	        type: "POST",
	        data: { boardIdx : ${ recipe.boardIdx } }, // 상품 ID를 전달
	        success: function(data) {
				alert("삭제하였습니다.");
				console.log(previousPageUrl);
				window.location.href = previousPageUrl;
	        }
	    });
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<style type="text/css">
a{
   text-decoration: none;
}

.ma-wrapper{
  width: 1150px;
  margin: 0 auto;
}
.ma-banner-arrow{
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 0px;	
	margin-bottom: 120px;
	padding-top: 5px;
	padding-bottom: 15px;
	border-bottom: 2px solid #adadad;
}

.ma-banner{
  width: 100%;
  height: 380px;
  margin-bottom: 100px;
  background-size: contain;
}

.ma-imgWrapper{
   display: flex;
   align-items: center;
   justify-self: center;
   margin-bottom: 100px;
}

.ma-titleBox{
   display: flex;
   align-items: end;
   justify-self: center;
   margin-left: 75px;
   margin-bottom: 10px;
}

.ma-titleBox p,h2{
   margin: 0;
}


.ma-moreBut{
   display: inline-block;
   padding-left: 20px;
   font-size: 20px;
   font-weight: 700;
   cursor: pointer;
}

.ma-moreBut:hover{
   color: red;
}

#ma-imgList1{
   width: 100%;
   display: block;
   justify-content: center;
   align-items: center;
}

#ma-imgList2{
   width: 100%;
   display: block;
   justify-content: center;
   align-items: center;
}

#ma-imgList3{
   width: 100%;
   display: block;
   justify-content: center;
   align-items: center;
}

#ma-imgList4{
   width: 100%;
   display: block;
   justify-content: center;
   align-items: center;
}

.categoryBox{
   display: inline-block;
}

.categoryImg{
  width: 180px;
  height: 180px;
}

.ma-imgTitle{
   text-align: center;
   display: block;
   margin-bottom: 0;
}

.ma-imgSub{
   text-align: center;
   display: block;
   margin-bottom: 0;
}

.ma-arrow-box{
   display: flex;
   align-items: center;
}

.ma-arrow-right0, .ma-arrow-right1, .ma-arrow-right2, .ma-arrow-right3, .ma-arrow-right4{
   display: inline-block;
   width: 40px; 
   cursor: pointer;
}

.ma-arrow-left0, .ma-arrow-left1, .ma-arrow-left2, .ma-arrow-left3, .ma-arrow-left4{
   margin-right: 40px;
   display: inline-block;
   width: 40px; 
   cursor: pointer;
}  
</style>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<%-- 예시 헤더 이미지  --%>
<main>
	<div>
	    <div class="ma-banner" id="banner" style="margin:0px;">
			<img style="width: 100%; min-width:1600px; cursor:pointer;" src='<c:url value="/resources/images/temporary/banner1.jpg"/>' alt="배너" onclick="pageMove(77777);"/>
			<img style="width: 100%; min-width:1600px; cursor:pointer;" src='<c:url value="/resources/images/temporary/banner2.jpg"/>' alt="배너" onclick="pageMove(88888);"/>
	    </div>
	    <div class="ma-banner-arrow">
	  		<div class="ma-arrow-box">
	            <img class="ma-arrow-left0" src="<c:url value="/resources/images/arrow-left.png" />" />
	        </div>
	 	    <div class="ma-arrow-box">
	           <img class="ma-arrow-right0" src="<c:url value="/resources/images/arrow-right.png" />" />
	        </div>
	    </div>
	    <div class="ma-wrapper" >
	      <div class="ma-ctgWrapper">
	      
	        <div class="ma-titleBox">
	          <h2>한식</h2>
	          <p class="ma-moreBut"><a href="<c:url value="/recipe/list.do?category=한식"/> ">모두보기</a></p>
	        </div>
	        <div class="ma-imgWrapper">
	          <div class="ma-arrow-box">
	            <img class="ma-arrow-left1" src="<c:url value="/resources/images/arrow-left.png" />" />
	          </div>
	          <div id="ma-imgList1">
	          	<c:choose>
	          		<c:when test="${ not empty hansikList }">
			          	<c:forEach var="item" items="${ hansikList }" varStatus="index">
				            <div> 
				              <a href="<c:url value="/recipe/detail.do?boardIdx=${ item.boardIdx }"/>" class="categoryBox">
				                <img class="categoryImg" src="/upload/recipe/${ item.thumbnail }"/>
				                <span class="ma-imgTitle">${ item.title }</span>
				                <span class="ma-imgSub">${item.writer} /  ${ item.hit }</span>
				              </a>
				            </div>
		            	</c:forEach>
	          		</c:when>
	          		<c:otherwise>
	          			<div style="text-align:center; font-size:20px; font-weight:700;">
	          				자료가 없습니다!
	          			</div>
	          		</c:otherwise>
	          	</c:choose>
              </div>
	          <div class="ma-arrow-box">
	            <img class="ma-arrow-right1" src="<c:url value="/resources/images/arrow-right.png" />" />
	          </div>
	        </div>
	      </div>
	
	      <div class="ma-ctgWrapper">
	        <div class="ma-titleBox">
	          <h2>중식</h2>
	          <p class="ma-moreBut"><a href="<c:url value="/recipe/list.do?category=중식"/> ">모두보기</a></p>
	        </div>
	        <div class="ma-imgWrapper">
	          <div class="ma-arrow-box">
	            <img class="ma-arrow-left2" src="<c:url value="/resources/images/arrow-left.png" />" />
	          </div>
	          <div id="ma-imgList2">
   	          	<c:choose>
	          		<c:when test="${ not empty jungsikList }">
			          	<c:forEach var="item" items="${ jungsikList }" varStatus="index">
				            <div> 
				              <a href="<c:url value="/recipe/detail.do?boardIdx=${ item.boardIdx }"/>" class="categoryBox">
				                <img class="categoryImg" src="/upload/recipe/${ item.thumbnail }"/>
				                <span class="ma-imgTitle">${ item.title }</span>
				                <span class="ma-imgSub">${item.writer} /  ${ item.hit }</span>
				              </a>
				            </div>
		            	</c:forEach>
	          		</c:when>
	          		<c:otherwise>
	          			<div style="text-align:center; font-size:20px; font-weight:700;">
	          				자료가 없습니다!
	          			</div>
	          		</c:otherwise>
	          	</c:choose>
	          </div>
	          <div class="ma-arrow-box">
	            <img class="ma-arrow-right2" src="<c:url value="/resources/images/arrow-right.png" />"/>
	          </div>
	        </div>
	      </div>
	
	      <div class="ma-ctgWrapper">
	        <div class="ma-titleBox">
	          <h2>일식</h2>
	          <p class="ma-moreBut"><a href="<c:url value="/recipe/list.do?category=일식"/> ">모두보기</a></p>
	        </div>
	        <div class="ma-imgWrapper">
	          <div class="ma-arrow-box">
	            <img class="ma-arrow-left3" src="<c:url value="/resources/images/arrow-left.png" />" />
	          </div>
	          <div id="ma-imgList3">
          		<c:choose>
	          		<c:when test="${ not empty ilsikList }">
			          	<c:forEach var="item" items="${ ilsikList }" varStatus="index">
				            <div> 
				              <a href="<c:url value="/recipe/detail.do?boardIdx=${ item.boardIdx }"/>" class="categoryBox">
				                <img class="categoryImg" src="/upload/recipe/${ item.thumbnail }"/>
				                <span class="ma-imgTitle">${ item.title }</span>
				                <span class="ma-imgSub">${item.writer} /  ${ item.hit }</span>
				              </a>
				            </div>
		            	</c:forEach>
	          		</c:when>
	          		<c:otherwise>
	          			<div style="text-align:center; font-size:20px; font-weight:700;">
	          				자료가 없습니다!
	          			</div>
	          		</c:otherwise>
         	  	</c:choose>
	          </div>
	          <div class="ma-arrow-box">
	            <img class="ma-arrow-right3" src="<c:url value="/resources/images/arrow-right.png" />" />
	          </div>
	        </div>
	      </div>
	
	      <div class="ma-ctgWrapper">
	        <div class="ma-titleBox">
	          <h2>양식</h2>
	          <p class="ma-moreBut"><a href="<c:url value="/recipe/list.do?category=양식"/> ">모두보기</a></p>
	        </div>
	        <div class="ma-imgWrapper">
	          <div class="ma-arrow-box">
	            <img class="ma-arrow-left4" src="<c:url value="/resources/images/arrow-left.png" />" />
	          </div>
	          <div id="ma-imgList4">
	          	<c:choose>
	          		<c:when test="${ not empty yangsikList }">
			          	<c:forEach var="item" items="${ yangsikList }" varStatus="index">
				            <div> 
				              <a href="<c:url value="/recipe/detail.do?boardIdx=${ item.boardIdx }"/>" class="categoryBox">
				                <img class="categoryImg" src="/upload/recipe/${ item.thumbnail }"/>
				                <span class="ma-imgTitle">${ item.title }</span>
				                <span class="ma-imgSub">${item.writer} /  ${ item.hit }</span>
				              </a>
				            </div>
		            	</c:forEach>
	          		</c:when>
	          		<c:otherwise>
	          			<div style="text-align:center; font-size:20px; font-weight:700;">
	          				자료가 없습니다!
	          			</div>
	          		</c:otherwise>
         	  	</c:choose>
	          </div>
	          <div class="ma-arrow-box">
	            <img class="ma-arrow-right4" src="<c:url value="/resources/images/arrow-right.png" />" />
	          </div>
	        </div>
	      </div>
	  </div>
  </div>
</main>
<%-- 예시 푸터 이미지  --%>
<%@ include file="/inc/footer.jsp" %> 
<%-- <%@ include file="/inc/footer.jsp" %>  --%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#banner").slick({
		      slidesToShow: 1,
		      slidesToScroll: 1,
		      autoplay: true,
		      autoplaySpeed: 3000,
		      prevArrow:$(".ma-arrow-left0"),
		      nextArrow:$(".ma-arrow-right0"),
		});
		
	    $('#ma-imgList1').slick({
	      slidesToShow: 5,
	      slidesToScroll: 1,
	      autoplay: false,
	      autoplaySpeed: 2000,
	      prevArrow:$(".ma-arrow-left1"),
	      nextArrow:$(".ma-arrow-right1"),
	    });
	
	    $('#ma-imgList2').slick({
	      slidesToShow: 5,
	      slidesToScroll: 1,
	      autoplay: false,
	      autoplaySpeed: 2000,
	      prevArrow:$(".ma-arrow-left2"),
	      nextArrow:$(".ma-arrow-right2"),
	    });
	
	    $('#ma-imgList3').slick({
	      slidesToShow: 5,
	      slidesToScroll: 1,
	      autoplay: false,
	      autoplaySpeed: 2000,
	      prevArrow:$(".ma-arrow-left3"),
	      nextArrow:$(".ma-arrow-right3"),
	    });
	
	    $('#ma-imgList4').slick({
	      slidesToShow: 5,
	      slidesToScroll: 1,
	      autoplay: false,
	      autoplaySpeed: 2000,
	      prevArrow:$(".ma-arrow-left4"),
	      nextArrow:$(".ma-arrow-right4"),
	    });
	})
	  
	function pageMove(no){
		location.href = `<c:url value="/note/detail.do?no=${ '${no}'}"/>`;
	}
</script>
</body>
</html>

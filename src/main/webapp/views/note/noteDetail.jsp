<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
<style type="text/css">
	.no-wrapper{
	  width: 1150px;
	  margin: 0 auto;
	}

    .no-titleBox{
      margin-bottom: 50px;
    }
    
    .no-mainWrapper{
    	border-top: 3px solid #333;
    	border-bottom: 1px solid #333;
    }
    
    .no-mainTitleBox{
    	display:flex;
    	align-items: center;
    	border-bottom: 1px solid #E7E6E6;
    }
    
    .no-mainTitle{
    	width: 150px;
    	text-align: center;
    	padding: 13px;
    	background-color: #F3F2F2;
    	margin:0;
    }
    
    .no-mainDesc{
    	padding: 13px 13px 13px 20px;
    	margin:0;
    }
    
    .no-mainContentBox{
    	padding: 30px 13px 100px 13px;
    }
    
    .no-butWrapper{
    	display: flex;
    	align-items: center;
    	justify-content: end;
    	margin-top: 15px;
    	margin-bottom: 45px;
    }
    
    .no-button{
    	padding: 11px 65px;
    	border: none;
    	border-radius: 5px;
    	background-color: #337ab7;
    	font-size: 16px;
    	color: #fff;
    }
    
    .no-button:hover{
    	background-color: #23527c;
    }
</style>
<script type="text/javascript">
	function moveList(){
		location.href="<c:url value="/note/list.do"/>";
	}
</script>
<main>
	<c:choose>
		<c:when test="${ no == 77777 }">
			<div class="no-wrapper">
			    <div class="no-titleBox">
			      <h1>공지사항</h1>
			    </div>
		    
			    <div class="no-mainWrapper">
			    	<div class="no-mainTitleBox">
			    		<p class="no-mainTitle">제목</p>
			    		<p class="no-mainDesc">얌얌 지적재산권 안내</p>
			    	</div>
			    	<div class="no-mainTitleBox">
			    		<p class="no-mainTitle">작성자</p>
			    		<p class="no-mainDesc">관리자</p>
			    	</div>
			    	<div class="no-mainTitleBox">
			    		<p class="no-mainTitle">작성일</p>
			    		<p class="no-mainDesc">2024-04-08<p>
			    	</div>
			    	<div class="no-mainContentBox">
			    		<div>
			    			<h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(51, 51, 51);"><b>얌얌은 레시피에 대한 지적재산권을 존중하며 보호에 최선을 다하는 사이트입니다.</b></h3><p><br style="margin: 0px; padding: 0px; font-family: sans-serif; color: rgb(49, 61, 75); font-size: 16px; letter-spacing: -0.7px;"><h4><font color="#313d4b">1. 현재 이용하고 계시는 얌얌은 ‘수요자 맞춤형 디지털레시피 등록 시스템’으로 특허결정을 받아 특허권이 발효 중입니다.&nbsp;</font></h4><h4><font color="#313d4b"><br></font></h4><h4><h4><font color="#313d4b">2. 얌얌에 등록된 레시피들은 특허, 저작권 등 여러 형태의 지적재산권을 형성되어 있습니다. 복사, 도용 등을 하실 경우 처벌받을 수 있음에 유의하여 주시기 바랍니다.<br></font></h4><br></h4></p><p><span style="color: rgb(49, 61, 75); font-family: " noto="" sans="" kr";="" font-size:="" 16px;="" letter-spacing:="" -0.7px;"=""><br></span></p><p></p><h3><br></h3><br><p></p>
			    		</div>
			    	</div>
			    </div>
			    <div class="no-butWrapper">
			    	<div>
			    		<button class="no-button" onclick="moveList();">목록</button>
			    	</div>
			    </div>
			</div>
		</c:when>
		<c:when test="${ no == 88888 }">
			<div class="no-wrapper">
			    <div class="no-titleBox">
			      <h1>공지사항</h1>
			    </div>
		    
			    <div class="no-mainWrapper">
			    	<div class="no-mainTitleBox">
			    		<p class="no-mainTitle">제목</p>
			    		<p class="no-mainDesc">(100만 부 돌파 기념) 네버쿡 &lt야, 너두 할 수 있어&gt 증정 이벤트</p>
			    	</div>
			    	<div class="no-mainTitleBox">
			    		<p class="no-mainTitle">작성자</p>
			    		<p class="no-mainDesc">관리자</p>
			    	</div>
			    	<div class="no-mainTitleBox">
			    		<p class="no-mainTitle">작성일</p>
			    		<p class="no-mainDesc">2024-04-08<p>
			    	</div>
			    	<div class="no-mainContentBox">
			    		<div>
			    			<h4><img style="width: 50%;" src="<c:url value="/resources/images/nado.png"/>" alt="nado.png"></h4><h4><b><br></b></h4><h4><b><font color="#000000" style="background-color: rgb(255, 255, 0);"><font style="">&lt;야, 너두 할 수 있어&gt;</font>는 이런분에게 도움이 되겠네요!</font></b><br></h4><ul><li>요리를 하고 싶지만 해본적이 없는 분<br><br></li><li>남들에게 나의 요리를 뽐내고 싶은 분<br><br></li><li>다양한 요리를 해보고 싶은 분</li></ul><p column-span="none" data-pm-slice="1 3 []"><br></p><h4><b><font color="#000000" style="background-color: rgb(255, 255, 0);">[이벤트 안내]</font></b></h4><ul><li>응모 기간: 2024년 04월 08일 ~ 2024년 04월 15일<br><br></li><li>응모 방법: &lt;야, 나두 할 수 있어&gt; 응모를 한다.<br><br></li><li>당첨 안내: 2024년 04월 22일 발표<br><br></li><li>당첨 인원: 총 10명<br><br></li><li>당첨 상품: &lt;야, 나두 할 수 있어&gt; 10권 (1인 1권 증정)</li></ul>
			    		</div>
			    	</div>
			    </div>
			    <div class="no-butWrapper">
			    	<div>
			    		<button class="no-button" onclick="moveList();">목록</button>
			    	</div>
			    </div>
			</div>
		</c:when>
		<c:otherwise>
		<div class="no-wrapper">
		    <div class="no-titleBox">
		      <h1>공지사항</h1>
		    </div>
	    
		    <div class="no-mainWrapper">
		    	<div class="no-mainTitleBox">
		    		<p class="no-mainTitle">제목</p>
		    		<p class="no-mainDesc">${ note.title }</p>
		    	</div>
		    	<div class="no-mainTitleBox">
		    		<p class="no-mainTitle">작성자</p>
		    		<p class="no-mainDesc">${ note.writer }</p>
		    	</div>
		    	<div class="no-mainTitleBox">
		    		<p class="no-mainTitle">작성일</p>
		    		<p class="no-mainDesc">${ note.createDate }<p>
		    	</div>
		    	<div class="no-mainContentBox">
		    		<div>
		    			<c:out value="${ note.content }" escapeXml="false" />
		    		</div>
		    	</div>
		    </div>
		    <div class="no-butWrapper">
		    	<div>
		    		<button class="no-button" onclick="moveList();">목록</button>
		    	</div>
		    </div>
		</div>
		</c:otherwise>
	</c:choose>
	
</main>
<%@ include file="/inc/footer.jsp" %>
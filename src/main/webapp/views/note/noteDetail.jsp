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
</main>
<%@ include file="/inc/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/adheader.jsp"%>
<style>
@import
	url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);

.ad-SelectBox{
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 10px 0;
	}
	
	.ad-selectInput{
		display: inline-block;
		height: 30px;
		width: 150px;
	}
	
	.ad-writeBut{
		display: inline-block;
		text-decoration: none;
		border: 1px solid #333;
		color: 
	}
	
    .ad-pagingBox{
	    display: flex;
	    justify-content: end;
	    margin-top: 10px;
	    margin-bottom: 50px;
	    border-collapse: collapse;
    }
    
    .nextPrevBut{
    	cursor: pointer;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    	text-align: center;
    	border:2px solid #f0f0f0;
		line-height: 1px;
    }
    
    .butActive:hover{
		border: 2px solid #adadad;
    }
    
    .pagingBut{
    	cursor: pointer;
    	display: flex;
    	align-items: center;
    	justify-content: center;
    	font-size: 18px;
    	border:none;
		width: 34px;
		height: 34px;
    }
    
    .otherPage:hover{
    	border: 2px solid #adadad;
    }
    
    .pageActive{
    	border: 2px solid #222;
    	color: #333;
    }
    
    .ad-note-btn{
    	cursor:pointer;
		font-weight: normal;
		font-size: 13px;
		line-height: 19px;
		text-align: center;
		letter-spacing: -0.7px;
		border-radius: 3px;
		border: 2px solid #f0f0f0;
		padding: 11px 20px 10px;
	}
	
	.ad-note-btn:hover{
		border: 2px solid #adadad;
	}
</style>

<main class="ad-main-all">
	<div class="ad-main">
		<%@ include file="/inc/adpage_side_bar.jsp"%>
		<section class="ad-main-table">

			<h1 class="ad-board-title">레시피 관리</h1>
			<div class="ad-SelectBox">
				<select class="ad-selectInput" id="ad-selectInput" onchange="selectListCount();">
					<option value="10" >10개씩 보기</option>
					<option value="20" >20개씩 보기</option>
					<option value="30" >30개씩 보기</option>
				</select>
			</div>
			<div class="ad-tbl-header">
				<table cellpadding="0" cellspacing="0" border="0">
					<thead>
						<tr>
							<th>번호</th>
							<th>회원아이디</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>조회수</th>
							<th>좋아요</th>
							<th>삭제</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="ad-tbl-content-list">
				<table cellpadding="0" cellspacing="0" border="0">
					<tbody>
						<c:forEach var="recipe" items="${recipeList}" varStatus="status">
							
								<tr align="center">
									<td>${recipe.boardIdx}</td>
									<td>${recipe.userId}</td>
									<td>${recipe.category}</td>
									<td>${recipe.title}</td>
									<td>${recipe.hit}</td>
									<td>${recipe.like}</td>
									<td><a href='<c:url value="/admin/recipe/delete.do?boardIdx=${recipe.boardIdx}" /> ' onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a></td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="ad-pagingBox">
	        	<c:out value="${ pagination }" escapeXml="false"/>
	      	</div>
		</section>
	</div>
</main>


</body>
</html>
<script>
	$(window).on(
			"load resize ",
			function() {
				var scrollWidth = $('.ad-tbl-content').width()
						- $('.ad-tbl-content table').width();
				$('.ad-tbl-header').css({
					'padding-right' : scrollWidth
				});
			}).resize();
	
	
	$(document).ready(function(){
		var _count = <c:out value="${listCount}"/>;	
		$("#ad-selectInput").val(_count).prop("selected",true);
	});
	
	function paging(num){
		var _count = <c:out value="${listCount}"/>
		location.href = `<c:url value="/admin/recipe/list.do?pageNum=${ '${num}' }&listCount=${ '${_count}' }"/> `;
	}

	function selectListCount(){
		var _value = $(".ad-selectInput").val();
		
		location.href = `<c:url value="/admin/recipe/list.do?listCount=${ '${ _value }'}"/>`;
	}
</script>


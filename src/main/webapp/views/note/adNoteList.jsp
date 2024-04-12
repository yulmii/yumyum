<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/adheader.jsp" %>
<style type="text/css">
	.ad-SelectBox{
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 10px 0;
	}
	
	.ad-selectInput{
		display: inline-block;
	}
	
	.ad-writeBut{
		display: inline-block;
	}
	
    .ad-pagingBox{
	    display: flex;
	    justify-content: end;
	    margin-top: 10px;
	    margin-bottom: 50px;
	    border-collapse: collapse;
    }
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var _count = <c:out value="${listCount}"/>;	
		$("#ad-selectInput").val(_count).prop("selected",true);
	});
	
	function paging(num){
		var _count = <c:out value="${listCount}"/>
		location.href = `<c:url value="/admin/note/list.do?pageNum=${ '${num}' }&listCount=${ '${_count}' }"/> `;
	}

	function selectListCount(){
		var _value = $(".ad-selectInput").val();
		
		location.href = `<c:url value="/admin/note/list.do?listCount=${ '${ _value }'}"/>`;
	}
</script>
<main>
	<div class="ad-main">
		<%@ include file="/inc/adpage_side_bar.jsp"%>
		
		<div class="ad-main-table">
			<h1 class="ad-board-title">공지사항 관리</h1>
			<div class="ad-SelectBox">
				<select class="ad-selectInput" id="ad-selectInput" onchange="selectListCount();">
					<option value="10" >10개씩 보기</option>
					<option value="20" >20개씩 보기</option>
					<option value="30" >30개씩 보기</option>
				</select>
				<a class="ad-writeBut" href="<c:url value="/admin/note/write.do" />">공지사항 작성</a>
			</div>
			<div class="ad-tbl-header">
				<table align="center">
					<colgroup>
						<col width="70" />
						<!--  번호 -->
						<col width="130" />
						<!--  작성자 -->
						<col width="400" />
						<!-- 제목 -->
						<col width="100" />
						<!-- 조회수 -->
						<col width="100" />
						<!-- 수정 -->
						<col width="100" />
						<!-- 삭제 -->
					</colgroup>
					<thead>
						<!-- 글제목  -->
						<tr>
							<th>번호</th>
							<th>작성자</th>
							<th>제목</th>
							<th>조회수</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
				</table>
			</div>
			<div class="ad-tbl-content-list">
				<table>
					<colgroup>
						<col width="70" />
						<!--  번호 -->
						<col width="130" />
						<!--  작성자 -->
						<col width="400" />
						<!-- 제목 -->
						<col width="100" />
						<!-- 조회수 -->
						<col width="100" />
						<!-- 수정 -->
						<col width="100" />
						<!-- 삭제 -->
					</colgroup>
					<c:forEach var="note" items="${noteList}" varStatus="status">
						<tr align="center">
							<td>${ note.no }</td>
							<td>${ note.writer }</td>
							<td>${ note.title }</td>
							<td>0</td>
							<td><a href='<c:url value="/admin/note/modify.do?no=${note.noteIdx}" /> '>수정</a></td>
							<td><a href='<c:url value="/admin/note/delete.do?no=${note.noteIdx}" /> '>삭제</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="ad-pagingBox">
	        	<c:out value="${ pagination }" escapeXml="false"/>
	      	</div>
		</div>
	</div>
</main>

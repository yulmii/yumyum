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
	
	.ad-list-btn:hover{
		text-decoration: underline 4px #adadad;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		var _count = <c:out value="${listCount}"/>;	
		$("#ad-selectInput").val(_count).prop("selected",true);
	});
	
	function writeNote(){
		location.href = "<c:url value="/admin/note/write.do" />"
	}
	
	function paging(num){
		var _count = <c:out value="${listCount}"/>
		location.href = `<c:url value="/admin/note/list.do?pageNum=${ '${num}' }&listCount=${ '${_count}' }"/> `;
	}

	function selectListCount(){
		var _value = $(".ad-selectInput").val();
		
		location.href = `<c:url value="/admin/note/list.do?listCount=${ '${ _value }'}"/>`;
	}
	
	function deleteNote(no){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = `<c:url value="/admin/note/delete.do?no=${ '${ no }'}" />`;
		}
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
				<button class="ad-note-btn" onclick="writeNote();">공지사항 등록</button>
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
				<table cellpadding="0" cellspacing="0" border="0">
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
							<td style="padding-left: 30px;">${ note.hit }</td>
							<td><a class="ad-list-btn" href='<c:url value="/admin/note/modify.do?no=${note.noteIdx}" /> '>수정</a></td>
							<td><a class="ad-list-btn" href='javascript:deleteNote(${ note.noteIdx })'>삭제</a></td>
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

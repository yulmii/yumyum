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

    .no-tableBox{
      width: 100%;
    }

    .no-thBox{
      border-bottom: 1px solid #000;
      border-top:3px solid #000;
      font-size: 20px;
    }

    .no-thBox th{
      text-align: center;
      padding: 20px;
    }

    .no-tdBox{
      border-bottom: 2px solid #e5e5e5;
    }

    .no-tdBox td{
      padding: 15px 20px 15px 20px;
      text-align: center;
    }
    
    .no-noteTitle{
    	display: flex;
    	width: 100%;
    	align-items: start; 
    	padding-left: 50px; 
    	cursor:pointer;
    }
    
    .no-tdBox:hover{
    	background-color: #e5e5e5;
    }

    .no-pagingBox{
      display: flex;
      justify-content: end;
      margin-top: 20px;
      margin-bottom: 50px;
      padding-right: 40px;
      border-collapse: collapse;
    }
    
    .nextPrevBut{
    	cursor: pointer;
    	display: flex;
    	align-items: center;
    	justify-content: center;
		background-color: #fff;
		border: none;
    }
    
    .butActive:hover{

    }
    
    .pagingBut{
    	display: flex;
    	align-items: center;
    	justify-content: center;
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
<script type="text/javascript">
	 function paging(num){
		 location.href = "?pageNum="+num;
	 }
	 
	 function pageMove(no){
		 location.href = `<c:url value="/note/detail.do?no=${ '${no}' }"/>`;
	 }
</script>
<main>
	<div class="no-wrapper">
	    <div class="no-titleBox">
	      <h1>공지사항</h1>
	    </div>
	    <div>
	      <table class="no-tableBox">
	        <colgroup>
	          <col width="100px" />
	          <col width="700px" />
	        </colgroup>
	        <tr class="no-thBox">
	          <th>번호</th>
	          <th>제목</th>
	          <th>작성자</th>
	          <th>작성일</th>
	        </tr>
	        <c:forEach var="note" items="${ noteList }" >
		        <tr class="no-tdBox">
		          <td>
		            <span>${ note.no }</span>
		          </td>
		          <td class="no-noteTitle" onclick="pageMove(${note.noteIdx})">
		            <span style="display:inline-block">${ note.title }</span>
		          </td>
		          <td>
		            <span>${ note.writer }</span>
		          </td>
		          <td>
		            <span>${ note.createDate }</span>
		          </td>
		        </tr>
	        </c:forEach>
	      </table>
	      <div class="no-pagingBox">
	        <c:out value="${ pagination }" escapeXml="false"/>
	      </div>
	    </div>
	</div>
</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>
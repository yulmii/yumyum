<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header">
	<div class="h-top-menu">
		<div class="h-top-menu-left">
			<a href="<c:url value="/main.do" />"> Yumyum</a>
		</div>
		<div class="h-top-menu-right">
			<a class="h-mypage" id="mypage" href="<c:url value="/mypage/view.do" />">마이 페이지</a> &nbsp;&nbsp;
			<a class="h-recipebox" id="logout" href="<c:url value="/logout.do" />">로그아웃</a>&nbsp;&nbsp;
			<c:choose>
			    <c:when test="${sessionScope._admin != 'F'}">
			        <a class="h-adminpage" id="adminpage" href="<c:url value="/admin/main.do" />">관리자 페이지</a>&nbsp;&nbsp;
			    </c:when>
			</c:choose>
		</div>
	</div>	
	<div class="h-search-box">
	    <form class="h-search-form" action='<c:url value="/recipe/list.do" />' method="get">
	        <input type="text" class="h-search-input" name="searchText" placeholder="요리제목, 재료, 작성자 검색">
	        <button type="submit" class="h-search-button">검색</button>
	    </form>
	</div>

	<div class="h-middle-menu">
		<table>
			<tr>
				<td><a href="<c:url value="/recipe/list.do?category=한식"/>">한식</a></td>
				<td><a href="<c:url value="/recipe/list.do?category=중식"/>">중식</a></td>
				<td><a href="<c:url value="/recipe/list.do?category=일식"/>">일식</a></td>
				<td><a href="<c:url value="/recipe/list.do?category=양식"/>">양식</a></td>
				<td><a href="<c:url value="/note/list.do" />">공지 사항</a></td>
		</table>
	</div>

<hr>
</header>
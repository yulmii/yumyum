<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header class="header">
	<div class="h-top-menu">
		<div class="h-top-menu-left">
			<a href="<c:url value="/main.do" />"> Yumyum</a>
		</div>
		<div class="h-top-menu-right">
			<a class="h-mypage" id="mypage" name="mypage" href="#">마이 페이지</a> &nbsp;&nbsp;
			<a class="h-recipebox" id="recipebox" name="recipebox" href="#">레시피 보관함</a>&nbsp;&nbsp;
			<a class="h-recipebox" id="recipebox" name="recipebox" href="#">로그아웃</a>&nbsp;&nbsp;
			<a class="h-adminpage" id="adminpage" neme="adminpage" href="<c:url value="/admin/main.do" />">관리자 페이지</a>&nbsp;&nbsp;
		</div>
	</div>	
	<div class="h-search-box">
	    <form class="h-search-form" action="#" method="get">
	        <input type="text" class="h-search-input" name="search" placeholder="검색어를 입력하세요">
	        <button type="submit" class="h-search-button">검색</button>
	    </form>
	</div>

	<div class="h-middle-menu">
		<table>
			<tr>
				<td><a href="<c:url value="/recipe/list.do?category=hansik"/>">한식</a></td>
				<td><a href="<c:url value="/recipe/list.do?category=jungsik"/>">중식</a></td>
				<td><a href="<c:url value="/recipe/list.do?category=ilsik"/>">일식</a></td>
				<td><a href="<c:url value="/recipe/list.do?category=yangsik"/>">양식</a></td>
				<td><a href="<c:url value="/note/list.do" />">공지 사항</a></td>
		</table>
	</div>

<hr>
</header>
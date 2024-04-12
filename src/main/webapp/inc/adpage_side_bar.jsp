<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="ad-side-meun">
	<ul class="ad-side-meun-bar">
		<h2 class="ad-menu-h2"><a class="ad-home-meun" href="<c:url value="/admin/main.do" />"> 관리자</a></h2>
		<li><a href="<c:url value="/admin/member/list.do"/> " class="ad-menu-link">회원 관리</a></li>
		<li><a href="<c:url value="/admin/recipe/list.do"/>" class="ad-menu-link">게시글 관리</a></li>
		<li><a href="<c:url value="/admin/note/list.do"/>" class="ad-menu-link">공지사항 관리</a></li>
		<br><br>
		<h2 class="ad-menu-h2"><a class="ad-home-meun" href="<c:url value="/main.do" />"> Yumyum</a></h2>
		<li><a href="<c:url value="/recipe/list.do?category=한식"/> ">한식</a></li>
		<li><a href="<c:url value="/recipe/list.do?category=중식"/>">중식</a></li>
		<li><a href="<c:url value="/recipe/list.do?category=일식"/>">일식</a></li>
		<li><a href="<c:url value="/recipe/list.do?category=양식"/>">양식</a></li>
		<li><a href="<c:url value="/note/list.do" />">공지 사항</a></li>
	</ul>
</div>
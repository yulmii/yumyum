<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ title }</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
.header {
    width: 1200px;
    margin: 0 auto; /* 가운데 정렬을 위한 margin 설정 */
    background-color: #f0f0f0;
}


.h-top-menu{
	margin:0 auto;
	font-size: 30px;
	width: 1200px;
	
	
}
.h-top-menu-left{
	float: left;
	font-size: 30px;
	
}
.h-top-menu-right{
	float: right;
	font-size: 15px;
	
}
.h-middle-menu {
    width: 1200px;
    margin: 0 auto;
    padding-top: 150px;
    display: flex; /* Flexbox 설정 */
    justify-content: center; /* 가로 중앙 정렬 */
}

.h-middle-menu a {
    margin: 0 40px;
    font-size: 30px;
}

</style>
</head>
<body>


<header class="header">
	<div class="h-top-menu">
		<div class="h-top-menu-left">
			<a href="<c:url value="/main.do" />"> Yumyum</a>
		</div>
		<div class="h-top-menu-right">
			<a class="h-mypage" id="mypage" name="mypage" href="#">마이 페이지</a> &nbsp;&nbsp;
			<a class="h-recipebox" id="recipebox" name="recipebox" href="#">레시피 보관함</a>&nbsp;&nbsp;
			<a class="h-recipebox" id="recipebox" name="recipebox" href="#">로그아웃</a>
		</div>
	</div>	
	<div class="h-middle-menu">
		<table>
			<tr>
				<td><a href="#">한식</a></td>
				<td><a href="#">중식</a></td>
				<td><a href="#">일식</a></td>
				<td><a href="#">양식</a></td>
				<td><a href="#">공지 사항</a></td>
		</table>
	</div>


</header>

</body>
</html>
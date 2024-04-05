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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="../resources/css/style.css" rel="stylesheet">
<script src="../resources/js/common.js"></script>
</head>
<body>
<%@ include file="/inc/header.jsp" %>

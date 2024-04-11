<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${ title }</title>
<link href='<c:url value="/resources/css/style.css" />' rel="stylesheet">
<script src='<c:url value="/resources/js/common.js" />'></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<style type="text/css">
.re-container {
	width: 1150px;
	margin: 0 auto;
}

.re-center {
	text-align: center;
	vertical-align: middle;
}
.re-right {
	text-align: right;
	vertical-align: middle;
}
</style>
<script src='<c:url value="/resources/js/summernote-lite.js" />'></script>
<script src='<c:url value="/resources/js/summernote-ko-KR.js" />'></script>

<link rel="stylesheet" href='<c:url value="/resources/css/summernote-lite.css" />'>
</head>
<body>
<%@ include file="/inc/header.jsp"%>
<main>
	<div class="re-container">
		<form action='<c:url value="/recipe/write.do" />' method="post"  enctype="multipart/form-data">
			<h1 class="mt-3">레시피 등록</h1>
			<table width="1000px" style="margin: 0 auto;">
				<colgroup>
					<col width="10%" />
					<col width="40%" />
					<col width="10%" />
					<col width="40%" />
				</colgroup>			
				<tr>
					<th>제목</th>
					<td><input type="text" id="title" name="title"
						class="re-input"></td>
					<th>카테고리</th>
					<td><select id="category" name="category">
							<option value="한식">한식</option>
							<option value="중식">중식</option>
							<option value="일식">일식</option>
							<option value="양식">양식</option>
					</select></td>
				</tr>
				<tr>
					<th>조리시간</th>
					<td><input type="number" min="0" name="cookHour" id="cookHour">&nbsp;
						시간 &nbsp; <input type="number" min="0" max="60" name="cookMinute"
						id="cookMinute">&nbsp;분</td>
					<th>재료</th>
					<td><input type="text" id="ingredient" name="ingredient"
						class="re-input"></td>
				</tr>
				<tr>
					<th>음식 이미지</th>
					<td colspan="3"><input type="file" id="thumbnail"
						name="thumbnail" class="re-input"></td>
				</tr>
				<tr>
					<td colspan="4" class="re-center" style="width: 500px; height: 300px;" id="preview"></td>
				</tr>
				<tr>
					<th colspan="4">내용</th>
				</tr>
				<tr>
					<td colspan="4"><textarea id="summernote" name="content">메렁</textarea></td>
				</tr>
				<tr>
					<td colspan="4" class="re-right"><input type="submit" value="등록하기"></td>
				</tr>
			</table>
		</form>
	</div>

</main>
<%@ include file="/inc/footer.jsp" %>
<script type="text/javascript">
    $(document).ready(function() {
        $('#summernote').summernote({
              height: 300,                 // 에디터 높이
              minHeight: null,             // 최소 높이
              maxHeight: null,             // 최대 높이
              focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",					// 한글 설정
            
        });
    
      
    });
   
 // 파일 입력 요소의 변경 이벤트를 처리하는 함수
    function imageChange(event) {
        // 파일 선택 여부 확인
        if (event.target.files.length > 0) {
            // 파일 리더 객체 생성
            const reader = new FileReader();

            // 파일 리더 객체가 로드될 때 실행할 콜백 함수 설정
            reader.onload = function(event) {
                // 이미지 태그 생성
                let img = $("<img>");
                // 미리보기 이미지 설정
                img.attr("src", event.target.result);
                img.css({"height": "300px"});

                // 미리보기 영역 초기화
                let preview = $("#preview");
                preview.empty();
                // 미리보기 영역에 이미지 추가
                preview.append(img);
            };

            // 파일 리더 객체로 선택된 파일 읽기
            reader.readAsDataURL(event.target.files[0]);
        }
    }

 // 파일 입력 요소의 변경 이벤트에 대한 리스너 설정
    $('#thumbnail').on('change', imageChange);
    </script>
</body>
</html>
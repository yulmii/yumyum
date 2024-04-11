<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp"%>
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
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<main>
	<div class="re-container">
		<form action='<c:url value="/recipe/modify.do" />' method="post"  enctype="multipart/form-data">
			<h1>레시피 수정</h1>
			<table style="margin: 0 auto; width:1000px;">
				<colgroup>
					<col width="10%" />
					<col width="40%" />
					<col width="10%" />
					<col width="40%" />
				</colgroup>			
				<tr>
					<th>제목</th>
					<td><input type="text" id="title" name="title" class="re-input" value="${ recipe.title }"></td>
					<th>음식 이미지</th>
					<td>
						<input type="file" id="thumbnailModify" name="thumbnailModify" class="re-input">
						<input type="hidden" name="thumbnail" value="${ recipe.thumbnail }">
					</td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td>
						<select id="category" name="category">
							<option value="한식" ${recipe.category eq '한식' ? 'selected' : ''}>한식</option>
							<option value="중식" ${recipe.category eq '중식' ? 'selected' : ''}>중식</option>
							<option value="일식" ${recipe.category eq '일식' ? 'selected' : ''}>일식</option>
							<option value="양식" ${recipe.category eq '양식' ? 'selected' : ''}>양식</option>
						</select>
					</td>
					<td colspan="2" rowspan="4" class="re-center" style="width: 500px; height: 300px;" id="preview">
						<img src="/upload/recipe/${ recipe.thumbnail }" style="height: 300px;">
					</td>
				</tr>
				<tr>
					<th>조리시간</th>
					<td><input type="number" min="0" name="cookHour" id="cookHour" value="${ recipe.cookHour }">&nbsp;
						시간 &nbsp; <input type="number" min="0" max="60" name="cookMinute"
						id="cookMinute" value="${ recipe.cookMinute }">&nbsp;분</td>
				</tr>
				<tr>
					<th>재료</th>
					<td><input type="text" id="ingredient" name="ingredient" value="${ recipe.ingredient }" class="re-input"></td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="4"><textarea id="summernote" name="content">${ recipe.content }</textarea></td>
				</tr>
				<tr>
					<td colspan="4" class="re-right"><input type="submit" value="수정하기"></td>
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
                img.css({"height": "100px"});

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
    $('#thumbnailModify').on('change', imageChange);
   </script>
</body>
</html>
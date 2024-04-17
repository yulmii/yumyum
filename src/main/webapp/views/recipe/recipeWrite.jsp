<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp"%>
<style type="text/css">
.re-main-content{    
    margin: 0 auto;
    width: 1100px;    
}

.re-board-title {
	padding-bottom: 20px;
}
.re-SelectBox{
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 10px 0;
}

.re-mainTitleBox {
    display: flex;
    align-items: center;
    height: 80px;
}
    
.re-mainTitle{
    width: 150px;
    height: 45px;
    text-align: center;
    padding: 13px;
    background-color: #F3F2F2;
    margin:0;
}
    
.re-mainDesc{
    padding: 13px 13px 13px 20px;
    margin:0;
}

.re-mainContentBox {

}
    
.re-mainContent{
    width: 150px;
    height: 45px;
    text-align: center;
    padding: 13px;
    background-color: #F3F2F2;
    margin-bottom: 10px;
}

.re-mainContent span {
	
}
    
.re-btnBox{
	text-align: right;
	padding-top : 20px;
}
    
.re-btn{
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
    
.re-btn:hover{
    border: 2px solid #adadad;
}

.re-subBox {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    height: 250px;
}

.re-leftBox {
    width: calc(40% - 15px); /* 10px는 간격 */
}

.re-rightBox {
    width: calc(60% - 15px); /* 10px는 간격 */
}

.d-none {
    display: none!important;
}

#preview {
/* 	border: 1px solid gray; */
	background-color: rgb(250, 250, 250)!important;
	text-align: center;
}
</style>


<script src='<c:url value="/resources/js/summernote/summernote-lite.js"/>'></script>
<script src='<c:url value="/resources/js/summernote/lang/summernote-ko-KR.js" />'></script>
<link rel="stylesheet" href='<c:url value="/resources/css/summernote/summernote-lite.css"/>'>

<main>
	<div class="re-main-content">
				<h1 class="re-board-title" >레시피 등록</h1>	
				<form action='<c:url value="/recipe/write.do" />' method="post"  enctype="multipart/form-data" onsubmit="sendForm();">
					<input type="hidden" name="dummyImg" id="dummyImg"/>
					<input type="hidden" name="deleteImg" id="deleteImg"/>
					<div class="re-subBox">
			    	<div class="re-leftBox">
                       	<input type="file" id="thumbnail" name="thumbnail" accept=".png,.jpg,.jpeg,.jfif,.gif,.pdf,.webp,.bmp,.heic,.heif">
			    		<div id="preview" style="height: 200px; margin-top: 5px;"></div>
			    	</div>
					<div class="re-rightBox">
						<div class="re-mainTitleBox">
				    		<p class="re-mainTitle">카테고리</p>
				    		<p class="re-mainDesc">
				    			<select id="category" name="category">
									<option value="한식" ${param.category eq '한식' ? 'selected' : ''}>한식</option>
									<option value="중식" ${param.category eq '중식' ? 'selected' : ''}>중식</option>
									<option value="일식" ${param.category eq '일식' ? 'selected' : ''}>일식</option>
									<option value="양식" ${param.category eq '양식' ? 'selected' : ''}>양식</option>
								</select>
							</p>
				    	</div>
						<div class="re-mainTitleBox">
				    		<p class="re-mainTitle">레시피 제목</p>
				    		<p class="re-mainDesc"><input type="text" name="title" required/></p>
				    	</div>
				    	<div class="re-mainTitleBox">
				    		<p class="re-mainTitle">재료</p>
				    		<p class="re-mainDesc"><input type="text" name="ingredient" required/></p>
				    	</div>
			    	</div>
			    	</div>
			    	<div class="re-mainContentBox">
			    		<p class="re-mainContent"><span>조리법</span></p>
						<textarea id="summernote" name="content"></textarea>
					</div>
					<div class="re-btnBox">
						<input type="submit" class="re-btn" value="등록">
						<!-- <input type="button" class="re-btn"  style="margin-left: 10px;" onclick="cancelBoard();" value="취소"> -->
					</div>
				</form>
			</div>

</main>
<%@ include file="/inc/footer.jsp"%>
<script type="text/javascript">
	var imgDatas = [];
	var delDatas = [];

	$(document).ready(function() {
		$('#summernote').summernote({
			height : 300, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : false, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					// 파일 업로드 (다중 업로드를 위해 반복문 사용)
					for (var i = files.length - 1; i >= 0; i--) {
						var fileName = files[i].name
						// 이미지 alt 속성 삽일을 위한 설정
						var caption = fileName

						resizeImage(files[i], 700).then((resizedImage) => {
							uploadSummernoteImageFile(resizedImage, this, caption);
						});
					}
				},
				onMediaDelete : function($target, editor, $editable) {
					var deletedImageUrl = $target.attr('src');
					filterImg(deletedImageUrl);
					delDatas.push(deletedImageUrl);
				},
			},
		});
	});

	// 이미지 업로드 함수 ajax 활용
	function uploadSummernoteImageFile(file, el, caption) {
		data = new FormData()
		data.append('file', file)
		$.ajax({
			data : data,
			type : 'POST',
			url : '<c:url value="/file/tempUpload.do"/>',
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data, function($image) {
					$image.attr('alt', caption) // 캡션 정보를 이미지의 alt 속성에 설정
				})
				imgDatas.push(data);
			},
		})
	}

	function filterImg(_img) {
		imgDatas = imgDatas.filter(function(img, index) {
			return img != _img;
		});
	}

	function sendForm() {
		$("#dummyImg").val(imgDatas);
		$("#deleteImg").val(delDatas);
	}

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
				img.css({
					"height" : "200px"
				});

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
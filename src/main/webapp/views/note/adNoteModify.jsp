<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/adheader.jsp" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<style type="text/css">	
	.ad-main-content{	
		margin: auto;
		margin-top: 150px;
		padding-left: 300px;
		width: 1450px;	
	}
	
	.ad-SelectBox{
		display: flex;
		align-items: center;
		justify-content: space-between;
		padding: 10px 0;
	}
	
    .no-mainTitleBox{
    	display:flex;
    	align-items: center;
    	border-bottom: 1px solid #E7E6E6;
    }
    
    .ad-mainTitle{
    	width: 150px;
    	text-align: center;
    	padding: 13px;
    	background-color: #F3F2F2;
    	margin:0;
    }
    
    .ad-mainDesc{
    	padding: 13px 13px 13px 20px;
    	margin:0;
    }
    
    .ad-mainContent{
    	width: 100%;
    	text-align: center;
    	padding: 13px;
    	background-color: #F3F2F2;
    	margin:0;
    }
    
    .ad-note-btnBox{
    	display: flex;
    	align-content: center;
    	justify-content: center;
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
</style>
<script type="text/javascript">
	function cancelBoard(){
		history.back();
	}
</script>
<main>
	<div>
		<%@ include file="/inc/adpage_side_bar.jsp"%>
		
		<div class="ad-main-content">
			<div style="background-color: rgba(237,242,255,0.7); padding: 15px 30px 25px 30px;">
				<form action='<c:url value="/admin/note/modify.do" />' method="post"  enctype="multipart/form-data" onsubmit="submitData();">
					<h1 class="ad-board-title" >공지사항 수정<span style="font-size:16px; float:right; margin-right:10px;"><label for="importance" style="position:relative; top:-3px; right:3px; cursor:pointer;">중요</label><input type="checkbox" id="importance" name="importance" value="T" style="width:20px; height:20px; cursor:pointer;" /></span></h1>
					<input type="hidden" name="dummyImg" id="dummyImg"/>
					<input type="hidden" name="deleteImg" id="deleteImg"/>
					<input type="hidden" name="no" value="${ note.noteIdx }"/>
					<div class="no-mainTitleBox">
			    		<p class="ad-mainTitle">제목</p>
			    		<p class="ad-mainDesc"><input type="text" name="title" value="${ note.title }" required/></p>
			    	</div>
			    	<div class="no-mainTitleBox">
			    		<p class="ad-mainTitle">작성자</p>
			    		<p class="ad-mainDesc"><input type="text" name="writer" value="${ note.writer }"  required/></p>
			    	</div>
			    	<div class="ad-mainContentBox">
			    		<p class="ad-mainContent">내용</p>
						<textarea id="summernote" name="content">${ note.content }</textarea>
					</div>
					<div class="ad-note-btnBox">
						<input type="submit" class="ad-note-btn" value="수정">
						<input type="button" class="ad-note-btn" style="margin-left: 10px;" onclick="cancelBoard();" value="취소">
					</div>
				</form>
			</div>
		</div>     
	</div>
</main>
<script>
	var imgDatas = [];	//저장할 이미지
	var delDatas = [];	//삭제할 이미지
	
	$(document).ready(function() {
	    $('#summernote').summernote({
	          height: 300,                 	// 에디터 높이
	          minHeight: null,             	// 최소 높이
	          maxHeight: null,             	// 최대 높이
	          focus: false,                	// 에디터 로딩후 포커스를 맞출지 여부
	          lang: "ko-KR",				// 한글 설정
	          callbacks: {
                onImageUpload: function (files, editor, welEditable) {
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
                onMediaDelete: function ($target, editor, $editable) {
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
            data: data,
            type: 'POST',
            url: '<c:url value="/file/tempUpload.do"/>',
            contentType: false,
            enctype: 'multipart/form-data',
            processData: false,
            success: function (data) {
                $(el).summernote(
                    'editor.insertImage',
                    data,
                    function ($image) {
                        $image.attr('alt', caption) // 캡션 정보를 이미지의 alt 속성에 설정
                    }
                )
                imgDatas.push(data);
            },
        })
    }
	
	//db에 저장해야할 추가 이미지
	function filterImg(_img){
		imgDatas = imgDatas.filter(function(img, index){
			return img != _img;
		});
	}
	
	function submitData(){	
		$("#dummyImg").val(imgDatas);
		$("#deleteImg").val(delDatas);
	}
</script>
</body></html>
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
	
    .ad-pagingBox{
	    display: flex;
	    justify-content: end;
	    margin-top: 10px;
	    margin-bottom: 50px;
	    border-collapse: collapse;
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
				<h1 class="ad-board-title" >공지사항 등록</h1>	
				<form action='<c:url value="/admin/note/write.do" />' method="post"  enctype="multipart/form-data" onsubmit="submitData();">
					<input type="hidden" name="dummyImg" id="dummyImg"/>
					<input type="hidden" name="deleteImg" id="deleteImg"/>
					<div class="no-mainTitleBox">
			    		<p class="ad-mainTitle">제목</p>
			    		<p class="ad-mainDesc"><input type="text" name="title" required/></p>
			    	</div>
			    	<div class="no-mainTitleBox">
			    		<p class="ad-mainTitle">작성자</p>
			    		<p class="ad-mainDesc"><input type="text" name="writer" value="관리자" required/></p>
			    	</div>
			    	<div class="ad-mainContentBox">
			    		<p class="ad-mainContent">내용</p>
						<textarea id="summernote" name="content"></textarea>
					</div>
					<div class="ad-note-btnBox">
						<input type="submit" class="ad-note-btn" value="등록">
						<input type="button" class="ad-note-btn"  style="margin-left: 10px;" onclick="cancelBoard();" value="취소">
					</div>
				</form>
			</div>
		</div>     
	</div>
</main>
<script>
	var imgDatas = [];
	var delDatas = [];
	
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
	
	//이미지 리사이징
	function resizeImage (_file, maxSize) {
	    var file = _file;
	    var maxSize = maxSize;
	    var reader = new FileReader();
	    var image = new Image();
	    var canvas = document.createElement('canvas');
	    var dataURItoBlob = function (dataURI) {
	        var bytes = dataURI.split(',')[0].indexOf('base64') >= 0 ?
	            atob(dataURI.split(',')[1]) :
	            unescape(dataURI.split(',')[1]);
	        var mime = dataURI.split(',')[0].split(':')[1].split(';')[0];
	        var max = bytes.length;
	        var ia = new Uint8Array(max);
	        for (var i = 0; i < max; i++)
	            ia[i] = bytes.charCodeAt(i);
	        return new Blob([ia], { type: 'image/jpeg'});
	    };
	    
	    var resize = function () {
	        var width = image.width;
	        var height = image.height;
	        if (width > height) {
	            if (width > maxSize) {
	                height *= maxSize / width;
	                width = maxSize;
	            }
	        } else {
	            if (height > maxSize) {
	                width *= maxSize / height;
	                height = maxSize;
	            }
	        }
	        canvas.width = width;
	         canvas.height = height;
	        canvas.getContext('2d').drawImage(image, 0, 0, width, height);
	        var dataUrl = canvas.toDataURL('image/jpeg');
	        return dataURItoBlob(dataUrl);
	    };
	    
	    return new Promise(function (ok, no) {
	    	//이미지가 아닐 시 에러 발생
	        if (!file.type.match(/image.*/)) {
	            no(new Error("Not an image"));
	            return;
	        }
	        reader.onload = function (readerEvent) {
	            image.onload = function () { return ok(resize()); };
	            image.src = readerEvent.target.result;
	        };
	        reader.readAsDataURL(file);
	    });
	};
	
	// 이미지 업로드 함수 ajax 활용
    function uploadSummernoteImageFile(file, el, caption) {
		console.log(el);
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
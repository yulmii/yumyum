<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/top.jsp" %>
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
<main>
	<div class="re-container">
<%-- <div class="re-right">등록일자 : ${recipe.createDate} 수정일자 : ${recipe.updateDate} 조회수 : ${recipe.hit}</div> --%>
		<div class="re-right">조회수 : ${recipe.hit}</div>
		<hr>
			<table border="1" style="margin: 0 auto; width:900px;">
				<colgroup>
					<col width="50%" />
					<col width="10%" />
					<col width="40%" />
				</colgroup>			
				<tr>
					<td colspan="3" class="re-center" style="hight: 150px" id="preview">
						<img src="/upload/recipe/${ recipe.thumbnail }" style="hight: 150px;">
					</td>
				</tr>
				<tr>
					<td>
						<select id="category" name="category">
							<option value="한식" ${recipe.category eq '한식' ? 'selected' : ''}>한식</option>
							<option value="중식" ${recipe.category eq '중식' ? 'selected' : ''}>중식</option>
							<option value="일식" ${recipe.category eq '일식' ? 'selected' : ''}>일식</option>
							<option value="양식" ${recipe.category eq '양식' ? 'selected' : ''}>양식</option>
						</select>
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
	</div>

</main>
<%@ include file="/inc/footer.jsp" %>
</body>
</html>
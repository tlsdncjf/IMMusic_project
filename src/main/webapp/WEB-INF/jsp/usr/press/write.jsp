<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="PRESS WRITE"></c:set>
<link rel="stylesheet" href="/resource/background.css" />
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Post Detail</title>
<style>
.input {
	border-radius: 5px;
}

.writebtn {
	margin: 5px 0;
	text-align: right;
	height: 40px;
}

.writebutton {
	width: 60px;
	height: 100%;
	text-align: center;
	padding: 10px 15px;
	font-size: 0.8rem;
	border-radius: 5px;
	background-color: #f2ede2;
}

.writebutton:hover {
	color:white;
	background-color: #b3a78f;
}

.post-container {
	max-width: 1000px;
	margin: 0 auto;
	background-color: rgba(255,255,255,0.3);
	padding: 10px;
}

/* 파일업로드 */
.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #ccc;
	border-radius: 5px;
    width: 30%;
    color: #999999;
}

.filebox label {
    display: inline-block;
    padding: 10px 15px;
    color: black;
    vertical-align: middle;
    background-color: #f2ede2;
    border-radius: 5px;
    cursor: pointer;
    height: 40px;
    margin-left: 5px;
    font-size: 0.8rem;
}

.filebox label:hover {
	border-style: none;
	background-color: #b3a78f;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}

</style>

<!-- Press write 관련 -->
<script>
$(document).ready(function() { //DOM이 준비되지 않음 -> 해결!
	$("#file").on('change',function(){
		 var fileName = $("#file").val();
		  $(".upload-name").val(fileName);
		});
});
	 
</script>

<script type="text/javascript">
	let PressWrite__submitFormDone = false;
	function PressWrite__submit(form) {
		
		if (PressWrite__submitFormDone) {
			return;
		}
		
		console.log('title: '+form.title.value);
		
		form.title.value = form.title.value.trim();
		if (form.title.value.length == 0) {
			alert('제목을 입력해주세요');
			return;
		}
		const editor = $(form).find('.toast-ui-editor').data(
				'data-toast-editor');
		const markdown = editor.getMarkdown().trim();
		if (markdown.length == 0) {
			alert('내용 써라');
			editor.focus();
			return;
		}
		$('#file').attr('name', 'file__press__' + ${currentId} + '__extra__Img__1');

		form.body.value = markdown;
		PressWrite__submitFormDone = true;
		form.submit();
	}
</script>
</head>

<div class="greet-bg">
	<p>
		IMMusic <br>& Art
	</p>
</div>

<section>
		<form action="../press/doWrite" method="POST" onsubmit="PressWrite__submit(this); return false;"
			enctype="multipart/form-data">
			<input type="hidden" name="${currentId }">
		<input type="hidden" name="body">
		<div class="post-container">
			<div style="display: flex; justify-content: space-between;">
				<div class="mb-5">
					<div class = "ml-1 mt-2">제목:  
						<input class="input input-bordered w-full max-w-xs mb-3 ml-2" autocomplete="off" type="text"
								placeholder="제목을 입력해주세요" name="title" style="height:40px"/>
					</div>
					<div class = "filebox ml-1 mb-1">첨부 이미지:
						    <input class="upload-name ml-2" value="첨부파일" placeholder="첨부파일">
						    <label for="file" class="text-sm">파일찾기</label> 
						    <input type="file" id="file">
					</div>
					<div class="toast-ui-editor">
						<script type="text/x-template"></script>
					</div>
					<div class="writebtn">
						<button class="writebutton btn-outline" type="submit" value="작성">작성</button>
					</div>
				</div>
			</div>
		</div>
	</form>

</section>
</html>

<%@ include file="../common/foot.jspf"%>
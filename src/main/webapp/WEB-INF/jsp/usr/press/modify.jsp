<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="PRESS MODIFY"></c:set>
<link rel="stylesheet" href="/resource/background.css" />
<%@ include file="../common/head.jspf"%>
<%@ include file="../common/toastUiEditorLib.jspf"%>

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
	background-color: #fff;
	padding: 10px;
}
</style>

<!-- press modify 관련 -->
<script type="text/javascript">
	let pressModify__submitFormDone = false;
	function pressModify__submit(form) {
		if (pressModify__submitFormDone) {
			return;
		}
		form.title.value = form.title.value.trim();
		if (form.title.value == 0) {
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
		$('#fileInput').attr('name', 'file__press__' + ${currentId} + '__extra__Img__1');
		
		form.body.value = markdown;
		pressModify__submitFormDone = true;
		form.submit();
	}
</script>

<div class="greet-bg">
	<p>
		IMMusic <br>& Art
	</p>
</div>

<section>
	<form action="../press/doModify" method="POST" onsubmit="pressModify__submit(this); return false;">
		<input type="hidden" name="id" value="${press.id }" >
		<input type="hidden" name="body">
		<div class="post-container">
			<div style="display: flex; justify-content: space-between;">
				<div class="mb-5">
					<div class="option">
						<div class="ml-1 mt-2 mb-1 flex">
							제목: <input class="input input-bordered w-full max-w-xs mb-3" autocomplete="off" type="text" value="${press.title}" name="title" style="height: 40px" />
					    </div>
					</div>
					<div class="ml-1 mt-2 mb-1">작성일: ${press.regDate.substring(0,10) }</div>
					<div class="ml-1 mt-2 mb-1">수정일: ${press.updateDate.substring(0,10) }</div>
					<div class = "ml-1 mt-2 mb-1">첨부이미지    
						<input id="fileInput" placeholder="이미지를 선택해주세요" type="file" />
					</div>
				</div>
			</div>
			<div class="toast-ui-editor">
				<script type="text/x-template">${press.body } </script>
			</div>
			<div class="writebtn">
					<button class="writebutton btn-outline" type="submit" value="수정">수정</button>
			</div>
		</div>
	</form>
</section>


</html>



<%@ include file="../common/foot.jspf"%>
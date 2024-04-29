<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ABOUT"></c:set>
<%@ include file="../common/head.jspf"%>


<div class="greet-bg">
	<p>
		IMMusic <br>& Art
	</p>
</div>


<section class="section-greet">
	<div class="greet">
		<p>아이엠뮤직앤아트는 클래식음악계를 이끌어 갈 재능 있는 예술가를 발굴·육성합니다.</p>
		<p>체계적인 매니지먼트와 전문 교육·지원을 통해 예술가가 자신의 예술 활동에 집중할 수 있도록 지원합니다.</p>
	</div>

	<div>
		<!-- 	<p><img src="/resource/IMMusicLogo자름.png" alt="" /></p> -->
		<p>IMMusic & Art</p>
	</div>


</section>



<style>
body {
	overflow-x: hidden;
}

.section-greet {
	padding-bottom: 200px;
	background-color: rgba(255, 255, 255, 0.8);
	
}

.section-greet>div:nth-child(2) {
	text-align: center;
	font-weight: bold;
	font-family: 'Arita buri';
	font-size: 50px;
}

/* .greet-bg {} -> common.css 파일에 있음*/
.greet {
	background-color: white;
	margin: auto;
	width: 1200px;
	height: 700px;
	/* 	border: 2px solid red; */
	background-color: rgba(255, 255, 255, 0.8);
	position: relative;
	opacity: 0; /* 초기에 투명도를 0으로 설정 */
	top: 100px;
	opacity: 0; /* 아래에서 시작할 위치 조정 */
}

.greet>p:nth-child(1) {
	font-size: 50px;
}

.greet>p:nth-child(2) {
	font-size: 25px;
}

</style>



<script>
	$(document).ready(function() {
		$('.greet').animate({
			top : 0,
			opacity : 1
		}, {
			duration : 1500,
			start : function() {
				$(this).fadeIn(); // fadeIn과 animate를 동시에 실행
			}
		});
	});
</script>


<%@ include file="../common/foot.jspf"%>
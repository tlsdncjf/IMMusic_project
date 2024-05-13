<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CONTACT US"></c:set>
<%@ include file="../common/head.jspf"%> 

<style>
section {
/* 	margin: 30px 0 200px 0; */
/* 	padding-top: 30px; */
	padding-bottom: 200px;
	text-align: center;
}

.inquiry-form {
	max-width: 400px;
	width: 50%;
	margin: 30px auto;
	padding: 50px;
	border-radius: 8px;
	background-color: #f2ede2;
	text-align: center;
}

.logoimg {
	width: 150px;
	height: 50px;
	margin: 0 auto;
}

button {
	background-color: #f2ede2;
	color: black;
	padding: 10px 15px;
	border: 1px solid #dddddd;
    border-radius: 4px;
    font-size: 0.8rem;
	cursor: pointer;
}

button:hover {
	background-color: #b3a78f;
}

</style>

<script>

    function home() {
        window.location.href = '/usr/home/main';   
    }

</script>

<div class="greet-bg">
		<p>
			IMMusic <br>& Art
		</p>
	</div>
	
<section class="px-4">
	<div class="inquiry-form">
		<img class="logoimg" src="\resource\inquiry.gif" alt="img" />
		<div class="text-base mt-5">접수가 완료되었습니다.</div>
        <div class="text-base">검토 후 연락드리겠습니다.</div>
		<div class="text-base mt-7">감사합니다.</div>
		<div class="text-sm mt-10">추가문의: immusic.manager@gmail.com</div>
	</div>
	
	<button type="button" onclick="home();">홈으로 이동</button>
</section>

<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>
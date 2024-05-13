<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CONTACT US"></c:set>
<%@ include file="../common/head.jspf"%>



<div class="greet-bg">
	<p>
		IMMusic <br>& Art
	</p>
</div>



<div class="text-xl text-center">연주자 가입문의 현황</div>

<table class="table-box-1 table" border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>성별</th>
			<th>휴대폰</th>
			<th>이메일</th>
			<th>주소</th>
			<th>전공</th>
			<th>sns</th>
			<th>사진</th>
			<th>경력</th>
			<th>소개글</th>
			<th>개인정보동의</th>
			<th>등록일자</th>
			<th>갱신일자</th>
			<!-- 					<th>삭제상태</th> -->
			<!-- 					<th>삭제일자</th> -->
		</tr>
	</thead>
	<tbody>

		<c:forEach var="contactArtist" items="${contactArtists }">
			<tr class="hover">
				<td>${contactArtist.id }</td>
				<td>${contactArtist.a_name }</td>
				<td>${contactArtist.a_birth }</td>
				<td>${contactArtist.a_gender }</td>
				<td>${contactArtist.a_phone }</td>
				<td>${contactArtist.a_email }</td>
				<td>${contactArtist.a_address }</td>
				<td>${contactArtist.a_major }</td>
				<td>${contactArtist.a_sns }</td>
				<td>${contactArtist.a_photo }</td>
				<td>${contactArtist.a_career }</td>
				<td>${contactArtist.a_introduction }</td>
				<td>${contactArtist.a_check }</td>
				<td>${contactArtist.regDate.substring(0,10) }</td>
				<td>${contactArtist.updateDate.substring(0,10) }</td>
				<%-- 						<td>${contactArtist.delStatus }</td> --%>
				<%-- 						<td>${contactArtist.delDate }</td> --%>

			</tr>
		</c:forEach>
	</tbody>
</table>

<br />
<hr />
<br />

<div class="text-xl text-center">공연문의 현황</div>

<table class="table-box-1 table mb-10" border="1">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>이메일</th>
			<th>휴대폰</th>
			<th>공연희망날짜</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>문의사항</th>
			<th>개인정보동의</th>
			<th>등록일자</th>
			<th>갱신일자</th>
			<!-- 					<th>삭제상태</th> -->
			<!-- 					<th>삭제일자</th> -->
		</tr>
	</thead>
	<tbody>

		<c:forEach var="contactConcert" items="${contactConcerts }">
			<tr class="hover">
				<td>${contactConcert.id }</td>
				<td>${contactConcert.c_name }</td>
				<td>${contactConcert.c_email }</td>
				<td>${contactConcert.c_phone }</td>
				<td>${contactConcert.c_date }</td>
				<td>${contactConcert.c_postcode }</td>
				<td>${contactConcert.c_address }</td>
				<td>${contactConcert.c_inquiry }</td>
				<td>${contactConcert.c_check }</td>
				<td>${contactConcert.regDate.substring(0,10) }</td>
				<td>${contactConcert.updateDate.substring(0,10) }</td>
				<%-- 						<td>${contactConcert.delStatus }</td> --%>
				<%-- 						<td>${contactConcert.delDate }</td> --%>

			</tr>
		</c:forEach>
	</tbody>
</table>





<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>
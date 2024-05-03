<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } PRESS LIST"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
/* Design */
*, *::before, *::after {
	box-sizing: border-box;
}

body {
	color: #272727;
	font-family: 'Quicksand', serif;
	font-style: normal;
	font-weight: 400;
	letter-spacing: 0;
	/* 	padding: 1rem; */
}

.main {
	max-width: 1200px;
	margin: 0 auto;
}

h1 {
	font-size: 24px;
	font-weight: 400;
	text-align: center;
}

img {
	height: auto;
	max-width: 100%;
	vertical-align: middle;
}

.btn {
	color: #ffffff;
	padding: 0.8rem;
	font-size: 14px;
	text-transform: uppercase;
	border-radius: 4px;
	font-weight: 400;
	display: block;
	width: 100%;
	cursor: pointer;
	border: 1px solid rgba(255, 255, 255, 0.2);
	background: transparent;
}

.btn:hover {
	background-color: rgba(255, 255, 255, 0.12);
}

.cards {
	display: flex;
	flex-wrap: wrap;
	list-style: none;
	margin: 0;
	padding: 0;
}

.cards_item {
	display: flex;
	padding: 25px;
}

@media ( min-width : 40rem) {
	.cards_item {
		width: 50%;
	}
}

@media ( min-width : 56rem) {
	.cards_item {
		width: 33.3333%;
	}
}

.card {
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 20px 40px -14px rgba(0, 0, 0, 0.15);
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

.card_content {
	padding: 1rem;
	 background: linear-gradient(to bottom left, #b3a78f 20%, #f2ede2 80%); 
	/* background: #b3a78f; */
}

.card_title {
	color: #ffffff;
	font-size: 1.1rem;
	font-weight: 700;
	letter-spacing: 1px;
	text-transform: capitalize;
	margin: 0px;
}

.card_text {
	color: #ffffff;
	font-size: 0.875rem;
	line-height: 1.5;
	margin-bottom: 1.25rem;
	font-weight: 400;
}

.made_by {
	font-weight: 400;
	font-size: 13px;
	margin-top: 35px;
	text-align: center;
}
</style>


<div class="main">


	<div>${press}</div>


	<ul class="cards">
		<li class="cards_item">
			<div class="card">
				<div class="card_image">
					<img src="https://picsum.photos/500/300/?image=10">
				</div>
				<div class="card_content">
					<h2 class="card_title">${press.get(0).getTitle() }</h2>
					<p class="card_text">${press.get(0).getBody() }</p>
					<a class="btn card_btn"
						href="detailTest?id=${press.get(0).getId() }">Read More</a>
				</div>
			</div>
		</li>
		<li class="cards_item">
			<div class="card">
				<div class="card_image">
					<img src="https://picsum.photos/500/300/?image=5">
				</div>
				<div class="card_content">
					<h2 class="card_title">${press.get(1).getTitle() }</h2>
					<p class="card_text">${press.get(1).getBody() }</p>
					<a class="btn card_btn"
						href="detailTest?id=${press.get(1).getId() }">Read More</a>
				</div>
			</div>
		</li>
		<li class="cards_item">
			<div class="card">
				<div class="card_image">
					<img src="https://picsum.photos/500/300/?image=11">
				</div>
				<div class="card_content">
					<h2 class="card_title">${press.get(2).getTitle() }</h2>
					<p class="card_text">${press.get(2).getBody() }</p>
					<a class="btn card_btn"
						href="detailTest?id=${press.get(2).getId() }">Read More</a>
				</div>
			</div>
		</li>
		<li class="cards_item">
			<div class="card">
				<div class="card_image">
					<img src="https://picsum.photos/500/300/?image=14">
				</div>
				<div class="card_content">
					<h2 class="card_title">${press.get(3).getTitle() }</h2>
					<p class="card_text">${press.get(3).getBody() }</p>
					<a class="btn card_btn"
						href="detailTest?id=${press.get(3).getId() }">Read More</a>
				</div>
			</div>
		</li>
		<li class="cards_item">
			<div class="card">
				<div class="card_image">
					<img src="https://picsum.photos/500/300/?image=17">
				</div>
				<div class="card_content">
					<h2 class="card_title">${press.get(3).getTitle() }</h2>
					<p class="card_text">${press.get(3).getBody() }</p>
					<a class="btn card_btn"
						href="detailTest?id=${press.get(3).getId() }">Read More</a>
				</div>
			</div>
		</li>
		<li class="cards_item">
			<div class="card">
				<div class="card_image">
					<img src="https://picsum.photos/500/300/?image=2">
				</div>
				<div class="card_content">
					<h2 class="card_title">${press.get(2).getTitle() }</h2>
					<p class="card_text">${press.get(2).getBody() }</p>
					<a class="btn card_btn"
						href="detailTest?id=${press.get(2).getId() }">Read More</a>
				</div>
			</div>
		</li>
	</ul>
</div>



<!-- 버전1  -->
<div class="pagination flex justify-center mt-3">
	<div class="btn-group">

		<a
			href="list??boardId=${boardId }&page=1&searchKeywordTypeCode=${param.searchKeywordTypeCode}&searchKeyword=${param.searchKeyword}">맨앞</a>
		<c:if test="${page > pagination.pageSize }">
			<a
				href="list?boardId=${boardId }&page=${pagination.from - 1}&searchKeywordTypeCode=${param.searchKeywordTypeCode}&searchKeyword=${param.searchKeyword}">◀</a>
		</c:if>

		<c:forEach begin="${pagination.from }" end="${pagination.end}" var="i">
			<a class="btn btn-sm ${page == i ? 'btn-active' : '' }"
				href="?boardId=${boardId }&page=${i }&searchKeywordTypeCode=${param.searchKeywordTypeCode}&searchKeyword=${param.searchKeyword}">${i }</a>
		</c:forEach>

		<c:if test="${pagination.end < pagination.totalPage }">
			<a
				href="list?boardId=${boardId }&page=${pagination.from + pagination.pageSize}&searchKeywordTypeCode=${param.searchKeywordTypeCode}&searchKeyword=${param.searchKeyword}">▶</a>
		</c:if>
		<a
			href="list?boardId=${boardId }&page=${pagination.totalPage}&searchKeywordTypeCode=${param.searchKeywordTypeCode}&searchKeyword=${param.searchKeyword}">맨뒤</a>

	</div>
</div>
<!-- </section> -->
<%@ include file="../common/foot.jspf"%>
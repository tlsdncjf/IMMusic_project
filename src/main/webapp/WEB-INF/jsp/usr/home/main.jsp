<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  <c:set var="main" value="MAIN"></c:set> --%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>${pageTitle }</title>
<link rel="stylesheet" type="text/css" href="acss/css/mogo.css">
<script src="https://use.fontawesome.com/692e9fe4aa.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

</head>



<style>
*, *:before, *:after {
	box-sizing: border-box;
	outline: none;
}

.page {
	/* 	overflow: hidden; */
	
}

h1, h2, h3, h4, h5, h6 {
	margin: 0;
}

hr {
	border: none;
	display: block;
	width: 100%;
	height: 1px;
	margin: 35px 0;
	background-color: #e5e5e5e5;
}

.container {
	width: 100%;
	max-width: 1230px;
	margin: 0 auto;
	padding: 0 15px;
}

/* 사진 슬라이더 */
.slider {
	background-repeat: no-repeat; /* 배경 이미지 반복 없음 */
	background-size: cover; /* 배경 이미지를 컨테이너에 맞게 크기 조정 */
	-webkit-background-size: cover; /* 웹킷 브라우저용 배경 이미지 크기 조정 */
	display: flex; /* 요소들을 행 방향으로 배치 */
	flex-direction: column; /* 요소들을 열 방향으로 배치 */
	justify-content: center; /* 요소들을 수직 중앙 정렬 */
	min-height: 820px; /* 최소 높이 지정 */
	position: relative; /* 위치 지정 */
}

.slide_viewer {
	width: 100%; /* 너비 100% */
	height: 100vh; /* 뷰포트의 높이만큼 설정 */
	overflow: hidden; /* 넘치는 부분 숨김 */
	position: relative; /* 위치 지정 */
	min-height: 820px; /* 최소 높이 지정 */
}

.slide_group {
	height: 100%; /* 높이 100% */
	position: relative; /* 위치 지정 */
	width: 100%; /* 너비 100% */
}

.slide {
	display: none; /* 화면에 보이지 않음 */
	height: inherit; /* 부모 요소의 높이 상속 */
	position: absolute; /* 위치 지정 */
	width: 100%; /* 너비 100% */
}

.slide img {
	height: inherit;
	width: inherit;
}

/* 첫 번째 슬라이드는 보이도록 설정 */
.slide:first-child {
	display: block;
}

.slide_buttons {
	position: absolute; /* 위치 지정 */
	height: 100%;
	width: 100%;
}

.slide_buttons_list {
	text-align: center;
}

a.slide_btn {
	color: #474544; /* 텍스트 색상 */
	font-size: 42px; /* 폰트 크기 */
	margin: 0 0.175em; /* 외부 여백 설정 */
	-webkit-transition: all 0.4s ease-in-out; /* 웹킷 브라우저용 트랜지션 설정 */
	-moz-transition: all 0.4s ease-in-out; /* 모질라 브라우저용 트랜지션 설정 */
	-ms-transition: all 0.4s ease-in-out; /* 마이크로소프트 브라우저용 트랜지션 설정 */
	-o-transition: all 0.4s ease-in-out; /* 오페라 브라우저용 트랜지션 설정 */
	transition: all 0.4s ease-in-out; /* 트랜지션 설정 */
}

/* 활성화된 슬라이드 버튼 또는 호버된 슬라이드 버튼의 스타일 설정 */
.slide_btn.active, .slide_btn:hover {
	color: #428CC6; /* 활성화 또는 호버 시 텍스트 색상 변경 */
	cursor: pointer; /* 커서 포인터로 변경 */
}

/* 슬라이드 버튼 이전, 다음 버튼의 스타일 설정 */
.previous_btn {
	position: absolute; /* 위치 지정 */
	top: 0;
	left: 0; /* 왼쪽 여백 설정 */
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.next_btn {
	position: absolute; /* 위치 지정 */
	top: 0;
	right: 0;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.previous_btn, .next_btn {
	cursor: pointer; /* 커서 포인터로 변경 */
	opacity: 0.5; /* 투명도 설정 */
	transition: opacity 0.4s ease-in-out; /* 트랜지션 설정 */
	width: 50px; /* 너비 설정 */
}

.previous_btn:hover, .previous_btn:focus, .next_btn:hover, .next_btn:focus
	{
	cursor: pointer;
	background: rgba(0, 0, 0, 0.5);
}
/* 슬라이드 버튼 호버 시 투명도 변경 */
.previous_btn:hover, .next_btn:hover {
	opacity: 1; /* 투명도 1로 설정 */
}

/* 반응형 디자인: 화면 크기가 작은 경우 버튼 위치 조정 */
@media only screen and (max-width: 767px) {
	.previous_btn {
		left: 50px; /* 왼쪽 여백 설정 */
	}
	.next_btn {
		right: 50px; /* 오른쪽 여백 설정 */
	}
}

.intro {
	width: 100%;
	height: 100vh;
	background-size: cover;
	-webkit-background-size: cover;
	display: flex;
	flex-direction: column;
	justify-content: center;
	min-height: 820px;
	position: relative;
}

.intro .slide_buttons_list {
	flex-grow: 0;
}

.intro_inner {
	width: 100%;
	max-width: 880px;
	margin: 0 auto;
	text-align: center;
	flex-grow: 1;
	display: flex;
	flex-direction: column; /* 요소를 세로로 배치 */
	justify-content: center; /* 세로 중앙 정렬 */
	align-items: center; /* 가로 중앙 정렬 */
	height: 100%; /* 부모 요소의 높이를 활용 */
}

.intro__title {
	font-size: 150px;
	color: #fff;
	font-weight: 700px;
	text-transform: uppercase;
	line-height: 1;
}

.intro__title>a {
	position: relative;
}

.intro__title>a::before {
	transform: scaleX(0);
	transform-origin: bottom right;
}

.intro__title>a:hover::before {
	transform: scaleX(1);
	transform-origin: bottom left;
}

.intro__title>a::before {
	content: " ";
	display: block;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	inset: 0 0 0 0;
	/*   background: hsl(200 100% 80%); */
	background: rgba(242, 237, 226, 0.3);
	z-index: 0;
	transition: transform .3s ease;
}

.intro__title:after {
	content: '';
	display: block;
	width: 60px;
	height: 3px;
	background-color: #fff;
	margin: 60px auto;
}

.intro__suptitle {
	margin-bottom: 20px;
	font-size: 72px;
	color: #fff;
	font-family: 'Kaushan Script', cursive;
}

.section {
	padding: 100px;
}

.section_heder {
	width: 100%;
	max-width: 950px;
	margin: 0 auto 50px;
	text-align: center;
}

.section_suptitle {
	font-size: 24px;
	color: #333;
	font-family: 'Kaushan Script', cursive;
}

.section_title {
	font-size: 30px;
	font-weight: 700;
	color: #333;
	text-transform: uppercase;
}

.section_title:after {
	content: "";
	display: block;
	width: 60px;
	height: 3px;
	background-color: #f38181;
	margin: 30px auto;
}

.section__Text {
	font-size: 15px;
	color: #999;
}

.cards {
	margin: 80px -15px 0;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.card__item {
	width: 33.333333%;
	padding: 0 15px;
}

.cards1 {
	margin: 80px -15px 0;
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	z-index: auto;
}

.card__item1 {
	width: 25%;
	padding: 0 15px;
	position: relative;
	z-index: 1;
}

.card__item2 {
	width: 25%;
	padding: 0 15px;
	position: relative;
	z-index: 2;
}

.card__item3 {
	width: 25%;
	padding: 0 15px;
	position: relative;
	z-index: 3;
}

.inner-card {
	background-color: #95e1d3;
	position: relative;
}

.inner-card:hover .card-imag {
	transform: translate3d(-10px, -10px, 0);
}

.inner-card:hover .card_text {
	opacity: 1;
}

.inner-card:hover .card-imag img {
	opacity: .1;
}

.card-imag {
	background: linear-gradient(to bottom, #f38181, #fce38a);
	transition: transform .2s linear;
}

.card-imag img {
	width: 100%;
	height: 500px;
	object-fit: cover;
	display: block;
	transition: opacity .1s linear;
}

.card_text {
	width: 100%;
	color: #fff;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 18px;
	position: absolute;
	text-align: center;
	opacity: 0;
	top: 50%;
	left: 0;
	z-index: 2;
	transform: translate3d(0, -50%, 0);
	transition: opacity .2s linear;
}

.stati {
	background-color: #f2ede2;
}

.stat {
	display: flex;
	flex-wrap: wrap;
}

.stat_item {
	flex: 1 1 0;
}

.stat_item {
	border-left: 1px solid #b5eae0;
	text-align: center;
	color: #000000;
	padding: 70px 25px;
}

.stat_item:last-child {
	border-right: 1px solid #b5eae0;
}

.section-gray {
	background-color: #f8f8f8;
}

.social_iteam {
	width: 55px;
	height: 55px;
	padding: 12px 10px;
	/* 	background-color: #fce38a; */
	background-color: #f2ede2;
	text-decoration: none;
	border-right: 1px solid #f9bd87;
	/* 	color: #f38181; */
	color: black;
	font-size: 30px;
	line-height: 1;
	transition: background .1s linear, color .1s linear;
}

.social_iteam:last-child {
	border-right: none;
}

.social {
	display: flex;
	justify-content: center;
	align-items: center;
}

.social_iteam:hover {
	/* 	background-color: #f38181; */
	/* 	color: #fff; */
	color: #b3a78f;
}

.card-name {
	color: #333;
	font-size: 20px;
	text-transform: uppercase;
}

.card-info {
	text-align: center;
	margin-top: 20px;
}

.card-prof {
	color: #999;
	font-size: 15px;
	font-style: italic;
	padding-top: 10px;
}

.card-prof2 {
	color: #999;
	font-size: 12px;
	font-style: italic;
	font-weight: 300px;
	padding-top: 10px;
}

.works {
	display: flex;
}

.works__col {
	flex: 1 1 0;
}

.works-item {
	/* 	position: relative; */
	/* 	background: linear-gradient(to bottom, #f38181, #fce38a); */
	/* 	overflow: hidden; */
	
}

.works-item:hover .work__image {
	/* 	opacity: .1; */
	
}

/* .works-item:hover .work-info { */
/* 	transform: translateY(-50%); */
/* 	opacity: 1; */
/* } */

/* .work-info { */
/* 	padding: 0 15px; */
/* 	width: 100%; */
/* 	position: absolute; */
/* 	top: 50%; */
/* 	left: 0; */
/* 	z-index: 1; */
/* 	opacity: 0; */
/* 	transform: translate3d(0, -50%, 0); */
/* 	transform: translateY(-500px); */
/* 	text-align: center; */
/* 	transition: opacity .2s linear; */
/* 	transition: .7s; */
/* } */
.work__image {
	display: block;
	transition: opacity .2s linear;
	max-width: 100%;
	height: auto;
	width: 100%;
}

.work__title {
	color: #fff;
	font-size: 14px;
	text-transform: uppercase;
	margin-bottom: 5px;
}

.works__text {
	font-style: italic;
	font-size: 15px;
	font-weight: 300;
}

.works-icon {
	color: #fff;
	font-size: 20px;
}

.logo_imge {
	display: block;
	max-width: 150px;
	height: 150px;
}

.logos {
	display: flex;
	justify-content: space-around;
	align-items: center;
	margin: 0 -15px;
}

.logo-items {
	padding: 0 15px;
}

/* 블로그 크롤링 부분 */
tr {
	position: relative;
}

tr:after {
	content: '';
	display: inline-block;
	width: 500px;
	height: 1px;
	position: absolute;
	background-color: #fff;
	background-image: linear-gradient(to right, rgba(0, 0, 0, 0),
		rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
	bottom: -1px;
	left: 50%;
	transform: translateX(-50%);
}

tr:hover {
	cursor: pointer;
	color: #b3a78f;
}

tr>td {
	text-align: left;
	padding: 15px 0px;
}

/* 더보기 */
.button-form {
	background-color: #f2ede2;
	color: black;
	padding: 20px 15px;
	border: 1px solid #b3a78f;
	border-radius: 4px;
	cursor: pointer;
	font-size: 0.8rem;
}

.button-form1 {
	border: none;
}

.button-form:hover {
	background-color: #b3a78f;
}

@media ( max-width : 1230px) {
	/* intro */
	.intro__title {
		font-size: 120px;
	}
	.intro__suptitle {
		font-size: 52px;
	}
	/*reviews*/
	.reviews_block {
		font-size: 19px;
	}
	/*works*/
}

@media ( max-width : 990px) {
	/* intro */
	.intro__title {
		font-size: 32px;
	}
	.intro__suptitle {
		font-size: 80px;
	}
	/* stati */
	.stat {
		justify-content: center;
	}
	.stat_item {
		flex: none;
		width: 33.33333%;
		border: none;
		padding-top: 30px;
		padding-bottom: 30px;
	}
	.stat_item:last-child {
		border-right: none;
	}
}

@media ( max-width : 770px) {
	/* intro */
	.intro {
		min-height: 650px;
	}

	/* section */
	.section {
		padding: 40px 0;
	}
	.section--devices {
		padding-bottom: 0;
	}

	/*card*/
	.cards {
		margin-top: 50px;
		justify-content: center;
	}
	.card__item {
		width: 100%;
		max-width: 410px;
		margin-bottom: 20px;
	}
	.card__item:last-child {
		margin-bottom: 0;
	}
	/* blog */
	.blog {
		max-width: 380px;
		margin: 0 auto;
	}
	.blo_item {
		width: 100%;
		margin-bottom: 30px;
	}
	.blo_item:last-child {
		margin-bottom: 0;
	}
}

@media ( max-width : 575px) {
	/* intro */
	.intro__title {
		font-size: 22px;
	}
	.intro__suptitle {
		font-size: 40px;
	}
	/* section */
	.section_title {
		font-size: 24px;
	}
	.section_suptitle {
		font-size: 20px;
	}
	.section_title:after {
		margin: 20px auto;
	}
	.section_heder {
		margin-bottom: 50px;
	}
	/* stati */
	.stat_item {
		width: 100%;
		border-bottom: 1px solid #b5eae0;
	}
	.stat_item:last-child {
		border-bottom: none;
	}
	.stat_count {
		font-size: 62px;
	}
}
</style>

<style>
/* 앨범 슬라이드쇼 */
#testbox {
	overflow: hidden; /* 넘치는 부분을 잘라냅니다. */
	position: relative; /* 자식 요소의 위치를 상대적으로 지정합니다. */
	width: 1200px; /* 테스트를 위한 임시 값으로 슬라이더의 가로 크기를 설정합니다. */
	height: 200px; /* 슬라이더의 세로 크기를 설정합니다. */
}

.test {
	width: 2520px; /* 모든 이미지와 클론 이미지를 포함하는 슬라이더의 가로 크기를 설정합니다. */
	height: 450px;
	display: flex; /* 내부 요소를 수평으로 배치하기 위해 flexbox 레이아웃을 사용합니다. */
	flex-wrap: nowrap; /* 내부 요소가 한 줄에 정렬되도록 합니다. */
	animation: bannermove 25s linear infinite; /* 슬라이드 애니메이션을 적용합니다. */
	padding-bottom: 30px; /* 하단 여백을 추가하여 이미지와 테두리가 겹치는 것을 방지합니다. */
}

.test>div {
	flex: 0 0 auto; /* 내부 요소가 flexbox의 아이템으로 동작하도록 설정합니다. */
	height: 200px; /* 내부 요소의 높이를 슬라이더의 높이와 일치시킵니다. */
	line-height: 200px; /* 텍스트를 수직으로 가운데 정렬하기 위해 사용합니다. */
	vertical-align: top; /* 내부 요소를 위쪽으로 정렬합니다. */
	text-align: center; /* 내부 요소의 텍스트를 가운데 정렬합니다. */
	position: relative;
	margin: 0 10px;
}

.test img {
	width: 100%; /* 이미지를 부모 요소의 너비에 맞게 설정합니다. */
	height: 100%; /* 이미지를 부모 요소의 높이에 맞게 설정합니다. */
	border-radius: 5px;
}

.text-overlay {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
 	background-color: rgba(0, 0, 0, 0.7); 
	color: white;
	transition: opacity 0.3s ease;
	height: 100%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
}

.test>div:hover .text-overlay {
	opacity: 1;
}

@keyframes slideAnimation {
    0% {
        transform: translateX(0);
    }
    
    100% {
        transform: translateX(-600px); /* 이미지의 너비에 맞게 수정하세요 */
    }
}

#testbox:hover .test {
	animation-play-state: paused; /* 마우스를 올리면 애니메이션을 일시정지합니다. */
}

/* 앨범 슬라이드 */

/* 아티스트 슬라이드쇼 */
#testbox2 {
	overflow: hidden;
	position: relative;
	width: 1200px;
	height: 450px;
}

.test2 {
	width: 4652px; /* 이미지 하나의 너비로 설정합니다. */
	height: 450px;
	display: flex;
	flex-wrap: nowrap;
	animation: bannermove 25s linear infinite;
	padding-bottom: 30px;
	position: relative; /* .text-overlay의 위치를 상대적으로 설정합니다. */
}

.test2 > div {
	flex: 0 0 auto;
	height: 450px;
	width: 310px;
	position: relative; /* .text-overlay의 위치를 상대적으로 설정합니다. */
	margin: 0 10px;
}

.test2 img {
	width: 100%; /* 이미지를 부모 요소의 너비에 맞게 설정합니다. */
	height: 100%; /* 이미지를 부모 요소의 높이에 맞게 설정합니다. */
	border-radius: 5px;
}

.text-overlay {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
 	background-color: rgba(0, 0, 0, 0.7); 
	color: white;
	transition: opacity 0.3s ease;
	height: 100%;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 5px;
}

.test2>div:hover .text-overlay {
	opacity: 1;
}

@keyframes bannermove {
    0% {
        transform: translate(0, 0);
    }

    100% {
        transform: translate(calc(-100% - 120px), 0);
    }
}

#testbox2:hover .test2 {
	animation-play-state: paused;
}

/* 아티스트 슬라이드 끝*/
</style>




<div class="page">

	<!-- <div class="intro" id="intro">
		<div class="intro_inner">
			<h2 class="intro__suptitle">IMMusic & Art</h2>
			<h1 class="intro__title">
				<a href="/usr/about">Welcome</a>
			</h1>
		</div>
	</div> -->


	<div class="slider">
		<div class="slide_viewer">
			<div class="slide_group">
				<div class="slide">
					<img src="/resource/무대사진.jpg" />
				</div>
				<div class="slide">
					<img src="/resource/에오 트리오 사진.jpg" />
				</div>
				<div class="slide">
					<img src="/resource/스페인음악여행 연주사진.jpg" />
				</div>
				<!-- 			<div class="slide"><img src="/resource/공연사진.jpg"/></div> -->
			</div>
		</div>

		<div class="slide_buttons">


			<div class="intro" id="intro">
				<div class="intro_inner">
					<h2 class="intro__suptitle">IMMusic & Art</h2>
					<h1 class="intro__title">
						<a href="/usr/about">Welcome</a>
					</h1>
				</div>
				<div class="slide_buttons_list"></div>
			</div>

			<div class="previous_btn" title="Previous">
				<i class="fa-solid fa-arrow-left fa-2xl" style="color: #f2ede2;"></i>
			</div>
			<div class="next_btn" title="Next">
				<i class="fa-solid fa-arrow-right fa-2xl" style="color: #f2ede2;"></i>
			</div>




		</div>

	</div>


	<div class="stati">
		<section class="section" id="about">
			<div class="container">

				<div class="section_heder">
					<h3 class="section_suptitle">IMMusic & Art</h3>
					<h2 class="section_title">주요 뉴스 및 공연 소식</h2>
					<div class="section__Text">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ab nulla recusandae quam dolor quod sapiente doloremque
							asperiores quisquam amet quaerat nam officiis odio provident
							aspernatur natus at ex laudantium debitis.</p>
					</div>
				</div>

				<div class="cards">
					<div class="card__item">
						<div class="inner-card">
							<div class=" card-imag">
								<img src="/resource/에오 트리오 사진.jpg" alt="Изображение">
								<div class="card_text">
									<a href="https://blog.naver.com/jazzjarasum/221102783565">피아니스트
										허대욱, 에오 트리오로 만나다.</a>
								</div>
							</div>
						</div>
					</div>
					<div class="card__item">
						<div class="inner-card">
							<div class="card-imag">
								<img src="/resource/공연 포스터 2.jpg" alt="Изображение">
								<div class="card_text">
									<a href="https://blog.naver.com/jazzjarasum/221102783565">포스터
										2</a>
								</div>
							</div>
						</div>
					</div>
					<div class="card__item">
						<div class="inner-card">
							<div class="card-imag">
								<img src="/resource/공연 포스터 1.jpg" alt="Изображение">
								<div class="card_text">포스터 1</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<div class="text-center mt-24">
				<a class="button-form" href="/usr/press/list">소식 더보기</a>
			</div>
		</section>

		<section class="section section-gray ">
			<div class="container">
				<div class="section_heder">
					<h3 class="section_suptitle">Who we are</h3>
					<h2 class="section_title">아티스트</h2>
					<div class="section__Text">
													<p>“비바기타앙상블”은 2012년부터 기타리스트 허원경이 이끄는 앙상블 팀으로 서울대학교 동문으로 이루어진 클래식기타 연주팀이다.</p>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Minima aspernatur numquam dolorem nostrum veritatis maxime iure
							ullam vitae hic consequuntur quia molestiae consectetur. Incidunt
							deserunt recusandae vel eveniet aspernatur delectus.</p>
					</div>
				</div>
				
<!-- 				<div class="artist-cards"> -->
<!-- 					<div class="cards1"> -->
<!-- 						<div class="card__item1"> -->
<!-- 							<div class="inner-card"> -->
<!-- 								<div class="card-imag"> -->
<!-- 									<a href="/usr/artist3"> <img src="/resource/허원경 프로필사진.png" -->
<!-- 										alt="Изображение"></a> -->
<!-- 									<div class="card_text"> -->
<!-- 										<div class="social"> -->
<!-- 											<a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-facebook-f"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-twitter"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-youtube"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-instagram"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-info"> -->
<!-- 								<div class="card-name"> -->
<!-- 									<a class=" hover:text-gray-300" href="/usr/artist3">허원경</a> -->
<!-- 								</div> -->
<!-- 								<div class="card-prof">리더(클래식 기타)</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="card__item2"> -->
<!-- 							<div class="inner-card"> -->
<!-- 								<div class="card-imag"> -->
<!-- 									<img src="/resource/구보근 프로필사진.png" alt="Изображение"> -->
<!-- 									<div class="card_text"> -->
<!-- 										<div class="social"> -->
<!-- 											<a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-facebook-f"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-twitter"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-youtube"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-instagram"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-info"> -->
<!-- 								<div class="card-name">구본근</div> -->
<!-- 								<div class="card-prof">단원(클래식 기타)</div> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						<div class="card__item3"> -->
<!-- 							<div class="inner-card"> -->
<!-- 								<div class="card-imag"> -->
<!-- 									<img src="/resource/원유현 프로필사진.png" alt="Изображение"> -->
<!-- 									<div class="card_text"> -->
<!-- 										<div class="social"> -->
<!-- 											<a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-facebook-f"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-twitter"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-youtube"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-instagram"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-info"> -->
<!-- 								<div class="card-name">원유현</div> -->
<!-- 								<div class="card-prof">단원(클래식 기타)</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="artist-cards"> -->
<!-- 					<div class="cards1"> -->
<!-- 						<div class="card__item1"> -->
<!-- 							<div class="inner-card"> -->
<!-- 								<div class="card-imag"> -->
<!-- 									<img src="/resource/임재민 프로필사진2.png" alt="Изображение"> -->
<!-- 									<div class="card_text"> -->
<!-- 										<div class="social"> -->
<!-- 											<a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-facebook-f"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-twitter"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-youtube"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-instagram"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-info"> -->
<!-- 								<div class="card-name">임재민</div> -->
<!-- 								<div class="card-prof">단원(클래식 기타)</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="card__item2"> -->
<!-- 							<div class="inner-card"> -->
<!-- 								<div class="card-imag"> -->
<!-- 									<img src="/resource/허대욱 프로필사진.jpg" alt="Изображение"> -->
<!-- 									<div class="card_text"> -->
<!-- 										<div class="social"> -->
<!-- 											<a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-facebook-f"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-twitter"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-youtube"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-instagram"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-info"> -->
<!-- 								<div class="card-name">허대욱</div> -->
<!-- 								<div class="card-prof">단원(재즈 피아노)</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="card__item3"> -->
<!-- 							<div class="inner-card"> -->
<!-- 								<div class="card-imag"> -->
<!-- 									<img src="/resource/허병훈 프로필사진.jpg" alt="Изображение"> -->
<!-- 									<div class="card_text"> -->
<!-- 										<div class="social"> -->
<!-- 											<a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-facebook-f"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-twitter"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-youtube"></i> -->
<!-- 											</a> <a href="#" class="social_iteam" target="_blank"> <i -->
<!-- 												class="fab fa-instagram"></i> -->
<!-- 											</a> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 							<div class="card-info"> -->
<!-- 								<div class="card-name">허병훈</div> -->
<!-- 								<div class="card-prof">고문</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

				<div id="testbox2">
					<div class="test2">
						<div>
							<img src="/resource/허원경 프로필사진.png">
							<div class="text-overlay">
								<p>허원경</p>
								<br>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div>
							<img src="/resource/구보근 프로필사진.png">
							<div class="text-overlay">
								<p>구본근</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div>
							<img src="/resource/원유현 프로필사진.png">
							<div class="text-overlay">
								<p>원유현</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div>
							<img src="/resource/임재민 프로필사진2.png">
							<div class="text-overlay">
								<p>임재민</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div>
							<img src="/resource/허대욱 프로필사진.jpg">
							<div class="text-overlay">
								<p>허대욱</p>
								<p>(재즈 피아니스트)</p>
							</div>
						</div>

						<div>
							<img src="/resource/허병훈 프로필사진.jpg">
							<div class="text-overlay">
								<p>허병훈</p>
								<p>(고문)</p>
							</div>
						</div>
						<!--   clone2     -->
						<div class="clone3">
							<img src="/resource/허원경 프로필사진.png">
							<div class="text-overlay">
								<p>허원경</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/구보근 프로필사진.png">
							<div class="text-overlay">
								<p>구본근</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/원유현 프로필사진.png">
							<div class="text-overlay">
								<p>원유현</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/임재민 프로필사진2.png">
							<div class="text-overlay">
								<p>임재민</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/허대욱 프로필사진.jpg">
							<div class="text-overlay">
								<p>허대욱</p>
								<p>(재즈 피아니스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/허병훈 프로필사진.jpg">
							<div class="text-overlay">
								<p>허병훈</p>
								<p>(고문)</p>
							</div>
						</div>
						<div class="clone3">
							<img src="/resource/허원경 프로필사진.png">
							<div class="text-overlay">
								<p>허원경</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/구보근 프로필사진.png">
							<div class="text-overlay">
								<p>구본근</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/원유현 프로필사진.png">
							<div class="text-overlay">
								<p>원유현</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/임재민 프로필사진2.png">
							<div class="text-overlay">
								<p>임재민</p>
								<p>(클래식기타리스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/허대욱 프로필사진.jpg">
							<div class="text-overlay">
								<p>허대욱</p>
								<p>(재즈 피아니스트)</p>
							</div>
						</div>

						<div class="clone3">
							<img src="/resource/허병훈 프로필사진.jpg">
							<div class="text-overlay">
								<p>허병훈</p>
								<p>(고문)</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>

			<div class="text-center  mt-24">
				<a class="button-form button-form1" href="/usr/artist">아티스트 더보기</a>
			</div>
		</section>

		<div class="section ">
			<div class="container">
				<div class="section_heder">
					<h3 class="section_suptitle">Albums</h3>
					<h2 class="section_title">앨범</h2>
					<div class="section__Text">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Dolorum atque, nihil impedit laboriosam ullam ipsa voluptate iure
							quis corrupti totam, nesciunt nemo voluptatem possimus doloribus
							similique perferendis blanditiis architecto? Ut!</p>
					</div>
				</div>
				
				<div id="testbox">
    					<div class="test" >
        					<div>
            					<img src="/resource/음악앨범 1.jpg" />
            					<div class="text-overlay">
                					<p>will it be spring tomorrow</p>
            					</div>
        					</div>
							
							<div>
								<img src="/resource/음악앨범 2.jpg" />
								<div class="text-overlay">
                					<p>interval of parallel</p>
            					</div>
							</div>
							
							<div>
								<img src="/resource/음악앨범 3.jpg" />
								<div class="text-overlay">
                					<p>trigram</p>
            					</div>
							</div>
							<div>
								<img src="/resource/음악앨범 4.jpg" />
								<div class="text-overlay">
                					<p>Le Moment Disperse</p>
            					</div>
							</div>
							<div>
								<img src="/resource/음악앨범 5.jpg" />
								<div class="text-overlay">
                					<p>to the west</p>
            					</div>
							</div>
							<div>
								<img src="/resource/음악앨범 7.jpg" />
								<div class="text-overlay">
                					<p>Aire de Espana</p>
            					</div>
							</div>
<!-- 							<div> -->
<!-- 								<img src="/resource/음악앨범 1.jpg" /> -->
<!-- 								<div class="text-overlay"> -->
<!--                 					<p>will it be spring tomorrow</p> -->
<!--             					</div> -->
<!-- 							</div> -->
<!-- 							<div> -->
<!-- 								<img src="/resource/음악앨범 2.jpg" /> -->
<!-- 								<div class="text-overlay"> -->
<!--                 					<p>interval of parallel</p> -->
<!--             					</div> -->
<!-- 							</div> -->
							<!--   clone     -->
							<div class="clone">
								<img src="/resource/음악앨범 1.jpg" />
								<div class="text-overlay">
                					<p>will it be spring tomorrow</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 2.jpg" />
								<div class="text-overlay">
                					<p>interval of parallel</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 3.jpg" />
								<div class="text-overlay">
                					<p>trigram</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 4.jpg" />
								<div class="text-overlay">
                					<p>Le Moment Disperse</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 5.jpg" />
								<div class="text-overlay">
                					<p>to the west</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 7.jpg" />
								<div class="text-overlay">
                					<p>Aire de Espana</p>
            					</div>
							</div>
<!-- 							<div class="clone"> -->
<!-- 								<img src="/resource/음악앨범 1.jpg" /> -->
<!-- 								<div class="text-overlay"> -->
<!--                 					<p>will it be spring tomorrow</p> -->
<!--             					</div> -->
<!-- 							</div> -->
<!-- 							<div class="clone"> -->
<!-- 								<img src="/resource/음악앨범 2.jpg" /> -->
<!-- 								<div class="text-overlay"> -->
<!--                 					<p>interval of parallel</p> -->
<!--             					</div> -->
<!-- 							</div> -->
							<!--   clone2     -->
							<div class="clone">
								<img src="/resource/음악앨범 1.jpg" />
								<div class="text-overlay">
                					<p>will it be spring tomorrow</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 2.jpg" />
								<div class="text-overlay">
                					<p>interval of parallel</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 3.jpg" />
								<div class="text-overlay">
                					<p>trigram</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 4.jpg" />
								<div class="text-overlay">
                					<p>Le Moment Disperse</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 5.jpg" />
								<div class="text-overlay">
                					<p>to the west</p>
            					</div>
							</div>
							<div class="clone">
								<img src="/resource/음악앨범 7.jpg" />
								<div class="text-overlay">
                					<p>Aire de Espana</p>
            					</div>
							</div>
<!-- 							<div class="clone"> -->
<!-- 								<img src="/resource/음악앨범 1.jpg" /> -->
<!-- 								<div class="text-overlay"> -->
<!--                 					<p>will it be spring tomorrow</p> -->
<!--             					</div> -->
<!-- 							</div> -->
<!-- 							<div class="clone"> -->
<!-- 								<img src="/resource/음악앨범 2.jpg" /> -->
<!-- 								<div class="text-overlay"> -->
<!--                 					<p>interval of parallel</p> -->
<!--             					</div> -->
<!-- 							</div> -->
						</div>
					</div>
				
<!-- 				<div class="logos"> -->
<!-- 					<div class="logo-items"> -->
<!-- 						<img class="logo_imge" src="/resource/음악앨범 1.jpg"> -->
<!-- 						<div class="card-prof2">Will It Be Spring Tomorrow?</div> -->
<!-- 					</div> -->
<!-- 					<div class="logo-items"> -->
<!-- 						<img class="logo_imge" src="/resource/음악앨범 2.jpg"> -->
<!-- 						<div class="card-prof2">Interval Of Parallel</div> -->
<!-- 					</div> -->
<!-- 					<div class="logo-items"> -->
<!-- 						<a href="https://youtu.be/KebPgX7_sGA"> <img class="logo_imge" -->
<!-- 							src="/resource/음악앨범 3.jpg"> -->
<!-- 						</a> -->
<!-- 						<div class="card-prof2">Trigram</div> -->
<!-- 					</div> -->
<!-- 					<div class="logo-items"> -->
<!-- 						<img class="logo_imge" src="/resource/음악앨범 4.jpg"> -->
<!-- 						<div class="card-prof2">Le Moment Disperse</div> -->
<!-- 					</div> -->
<!-- 					<div class="logo-items "> -->
<!-- 						<img class="logo_imge " src="/resource/음악앨범 5.jpg"> -->
<!-- 						<div class="card-prof2">To The West</div> -->
<!-- 					</div> -->
<!-- 					<div class="logo-items "> -->
<!-- 						<img class="logo_imge" src="/resource/음악앨범 6.png"> -->
<!-- 						<div class="card-prof2">sherpa</div> -->
<!-- 					</div> -->
<!-- 					<div class="logo-items "> -->
<!-- 						<img class="logo_imge" src="/resource/음악앨범 7.jpg"> -->
<!-- 						<div class="card-prof2">스페인의 인상</div> -->
<!-- 					</div> -->

<!-- 				</div> -->
				
				
				
				
				
			</div>
		</div>

		<section class="section section-gray" id="work">
			<div class="container">
				<div class="section_heder">
					<h3 class="section_suptitle">What we do</h3>
					<h2 class="section_title">공연 및 무대사진</h2>
					<div class="section__Text">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Dolorum atque, nihil impedit laboriosam ullam ipsa voluptate iure
							quis corrupti totam, nesciunt nemo voluptatem possimus doloribus
							similique perferendis blanditiis architecto? Ut!</p>
					</div>
				</div>
			</div>
			<div class="works">
				<div class="works__col">
					<div class="works-item">
						<img class="work__image" src="/resource/공연사진.jpg" alt="">
						<!-- 							<div class="work-info"> -->
						<!-- 								<a class="works-icon" href="#"> <i class="fas fa-mountain"></i> -->
						<!-- 								</a> -->
						<!-- 								<div class="work__title">creat infotr hurntd</div> -->
						<!-- 								<div class="works__text">Lorem ipsum dolor sit</div> -->
						<!-- 							</div> -->
					</div>
					<div class="works-item">
						<img class="work__image" src="/resource/무대사진.jpg" alt="">
					</div>
				</div>
				<div class="works__col">
					<div class="works-item">
						<img class="work__image" src="/resource/스페인음악여행 연주사진.jpg" alt="">
					</div>
					<div class="works-item">
						<img class="work__image" src="https://i.postimg.cc/0MTj6qG0/4.jpg"
							alt="">
					</div>
				</div>
				<div class="works__col">
					<div class="works-item">
						<img class="work__image"
							src="https://i.postimg.cc/nM9nX5PC/3.jpg[/img][/url]" alt="">
					</div>
				</div>
				<div class="works__col">

					<div class="works-item">
						<img class="work__image" src="https://i.postimg.cc/3Wvfpz0q/1.jpg"
							alt="">
					</div>
					<div class="works-item">
						<img class="work__image" src="https://i.postimg.cc/pmMjG4SS/7.jpg"
							alt="">
					</div>
				</div>
			</div>
		</section>

		<section class="section">
			<div class="container">
				<div class="section_heder">
					<h3 class="section_suptitle">IMMusic & Art</h3>
					<h2 class="section_title">lates blog</h2>
				</div>

				<!-- 					블로그 크롤링 -->
				<table>
					<colgroup>
						<col style="width: 10%" />
						<col style="width: 25%" />
						<col style="width: 65%" />
					</colgroup>
					<tbody id="blogContent">
						<!-- 						ajax script로 태그 그림 -->


						<%-- 							<c:forEach var="blog" items="${blog}"> --%>
						<%-- 								<tr class="mb-5" onclick="redirectToPost('${blog.post_url}')"> --%>
						<%-- 									<td>${blog.post_date}</td> --%>
						<%-- 									<td>${blog.post_title}</td> --%>
						<%-- 									<td>${blog.post_content}</td> --%>
						<!-- 								</tr> -->
						<%-- 							</c:forEach> --%>
					</tbody>
				</table>


			</div>
		</section>

		<script>
				function redirectToPost(postUrl) {
					console.log('Redirecting to: ' + postUrl);
					// var windowFeatures = 'width=800,height=600,resizable=yes,scrollbars=yes';
					window.open(postUrl, '_blank');
				}
		</script>

	</div>


</div>


<!-- 사진 슬라이더 js -->
<script>
	$('.slider').each(function() {
		var $this = $(this);
		var $group = $this.find('.slide_group');
		var $slides = $this.find('.slide');
		var bulletArray = [];
		var currentIndex = 0;
		var timeout;

		function move(newIndex) {
			var animateLeft, slideLeft;

			advance();

			if ($group.is(':animated') || currentIndex === newIndex) {
				return;
			}

			bulletArray[currentIndex].removeClass('active');
			bulletArray[newIndex].addClass('active');

			if (newIndex > currentIndex) {
				slideLeft = '100%';
				animateLeft = '-100%';
			} else {
				slideLeft = '-100%';
				animateLeft = '100%';
			}

			$slides.eq(newIndex).css({
				display : 'block',
				left : slideLeft
			});
			$group.animate({
				left : animateLeft
			}, function() {
				$slides.eq(currentIndex).css({
					display : 'none'
				});
				$slides.eq(newIndex).css({
					left : 0
				});
				$group.css({
					left : 0
				});
				currentIndex = newIndex;
			});
		}

		function advance() {
			clearTimeout(timeout);
			timeout = setTimeout(function() {
				if (currentIndex < ($slides.length - 1)) {
					move(currentIndex + 1);
				} else {
					move(0);
				}
			}, 4000);
		}

		$('.next_btn').on('click', function() {
			if (currentIndex < ($slides.length - 1)) {
				move(currentIndex + 1);
			} else {
				move(0);
			}
		});

		$('.previous_btn').on('click', function() {
			if (currentIndex !== 0) {
				move(currentIndex - 1);
			} else {
				move(3);
			}
		});

		$.each($slides, function(index) {
			var $button = $('<a class="slide_btn">&bull;</a>');

			if (index === currentIndex) {
				$button.addClass('active');
			}
			$button.on('click', function() {
				move(index);
			}).appendTo('.slide_buttons_list');
			bulletArray.push($button);
		});

		advance();
	});
</script>



<!-- 블로그 크롤링 -->
<script>
	$(document)
			.ready(
					function() {
						// AJAX 요청을 보냅니다.
						$
								.ajax({
									url : "/usr/home/crawl",
									type : "GET",
									success : function(data) {
										console.log("data: " + data);

										// 받은 데이터를 이용하여 HTML을 생성합니다.
										var html = "";
										data
												.forEach(function(blog) {
													var postDate = blog.post_date;
													var postTitle = blog.post_title;
													var postContent = blog.post_content;
													var postUrl = blog.post_url;

													// 생성한 HTML을 추가합니다.
													html += "<tr class='mb-5' onclick='redirectToPost(\""
															+ postUrl + "\")'>";
													html += "<td>" + postDate
															+ "</td>";
													html += "<td>" + postTitle
															+ "</td>";
													html += "<td>"
															+ postContent
															+ "</td>";
													html += "</tr>";
												});

										// 생성한 HTML을 해당 요소에 추가합니다.
										$("#blogContent").html(html);
									},
									error : function(xhr, status, error) {
										console.error("AJAX 요청 실패:", status,
												error);
									}
								});
					});
</script>





<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>
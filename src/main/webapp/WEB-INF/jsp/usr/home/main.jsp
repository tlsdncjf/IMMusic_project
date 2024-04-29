<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  <c:set var="main" value="MAIN"></c:set> --%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>

<!DOCTYPE html>
<html lang="en">
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
	overflow: hidden;
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

.intro {
	width: 100%;
	height: 100vh;
	/* 	background: url("https://i.postimg.cc/3JYVfWCW/img-intro-01.jpg"); */
	background: url("/resource/에오 트리오 사진.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	-webkit-background-size: cover;
	display: flex;
	flex-direction: column;
	justify-content: center;
	min-height: 820px;
	position: relative;
}

.intro_inner {
	width: 100%;
	max-width: 880px;
	margin: 0 auto;
	text-align: center;
}

.intro__title {
	font-size: 150px;
	color: #fff;
	font-weight: 700px;
	text-transform: uppercase;
	line-height: 1;
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
	background-color: #fce38a;
	text-decoration: none;
	border-right: 1px solid #f9bd87;
	color: #f38181;
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
	background-color: #f38181;
	color: #fff;
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
	font-size: 20px;
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
	position: relative;
	background: linear-gradient(to bottom, #f38181, #fce38a);
	overflow: hidden;
}

.works-item:hover .work__image {
	opacity: .1;
}

.works-item:hover .work-info {
	transform: translateY(-50%);
	opacity: 1;
}

.work-info {
	padding: 0 15px;
	width: 100%;
	position: absolute;
	top: 50%;
	left: 0;
	z-index: 1;
	opacity: 0;
	transform: translate3d(0, -50%, 0);
	transform: translateY(-500px);
	text-align: center;
	transition: opacity .2s linear;
	transition: .7s;
}

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
	max-width: 100%;
	height: auto;
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

.blog {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.blo_item {
	width: 31%;
}

.blog-header {
	position: relative;
	margin-bottom: 14px;
}

.blog_img {
	display: block;
	max-width: 100%;
	height: auto;
}

.blog-content {
	margin-bottom: 10px;
}

.blog_date {
	padding: 10px 20px;
	color: #fff;
	font-size: 15px;
	font-style: italic;
	background-color: #95e1d3;
	position: absolute;
	font-weight: 300px;
	text-align: center;
	bottom: 10px;
	left: -10px;
	z-index: 1;
	line-height: 1;
}

.blog-date-day {
	font-weight: 700;
	font-size: 30px;
	font-style: normal;
}

.blog_title {
	font-size: 14px;
	font-weight: 300;
	text-transform: uppercase;
	margin-bottom: 10px;
}

.blog_title a {
	color: inherit;
	text-decoration: none;
}

.blog_title a:hover {
	text-decoration: underline;
}

.blog-text {
	font-size: 15px;
	color: #999;
}

.blog_footer {
	border-top: 1px solid #e5e5e5;
	padding-top: 14px;
	font-size: 14px;
	font-weight: 300;
	color: #999;
	font-style: italic;
}

.blog-stat-item {
	display: inline-block;
	vertical-align: top;
	margin-right: 10px;
}

.blog-stat-item i {
	color: #95e1d3;
	margin-right: 5px;
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



<body>
	<div class="page">



		<div class="intro" id="intro">
			<div class="container">
				<div class="intro_inner">
					<h2 class="intro__suptitle">IMMusic & Art</h2>
					<h1 class="intro__title">
						<a href="/usr/about">Welcome</a>
					</h1>
					<!-- 					<a href="#" class="btn">Learn More</a> -->
				</div>
			</div>
		</div>

		<div class="stati">
			<section class="section" id="about">
				<div class="container">

					<div class="section_heder">
						<h3 class="section_suptitle">IMMusic & Art</h3>
						<h2 class="section_title">News & Show</h2>
						<div class="section__Text">
							<p>주요 뉴스 및 공연 소식</p>
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
					<a class="btn btn-outline" href="/usr/press/list">소식 더보기</a>
				</div>
			</section>

			<section class="section section-gray ">
				<div class="container">
					<div class="section_heder">
						<h3 class="section_suptitle">Who we are</h3>
						<h2 class="section_title">아티스트 소개</h2>
						<div class="section__Text">
							<!-- 							<p>“비바기타앙상블”은 2012년부터 기타리스트 허원경이 이끄는 앙상블 팀으로 서울대학교 동문으로 이루어진 클래식기타 연주팀이다.</p> -->
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Minima aspernatur numquam dolorem nostrum veritatis maxime iure
								ullam vitae hic consequuntur quia molestiae consectetur.
								Incidunt deserunt recusandae vel eveniet aspernatur delectus.</p>
						</div>
					</div>

					<div class="artist-cards">
						<div class="cards1">
							<div class="card__item1">
								<div class="inner-card">
									<div class="card-imag">
										<img src="/resource/허원경 프로필사진.png" alt="Изображение">
										<div class="card_text">
											<div class="social">
												<a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-facebook-f"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-twitter"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-pinterest-p"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-instagram"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="card-info">
									<div class="card-name">허원경</div>
									<div class="card-prof">리더(클래식 기타)</div>
								</div>
							</div>

							<div class="card__item2">
								<div class="inner-card">
									<div class="card-imag">
										<img src="/resource/구보근 프로필사진.png" alt="Изображение">
										<div class="card_text">
											<div class="social">
												<a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-facebook-f"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-twitter"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-pinterest-p"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-instagram"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="card-info">
									<div class="card-name">구본근</div>
									<div class="card-prof">단원(클래식 기타)</div>
								</div>
							</div>


							<div class="card__item3">
								<div class="inner-card">
									<div class="card-imag">
										<img src="/resource/원유현 프로필사진.png" alt="Изображение">
										<div class="card_text">
											<div class="social">
												<a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-facebook-f"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-twitter"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-pinterest-p"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-instagram"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="card-info">
									<div class="card-name">원유현</div>
									<div class="card-prof">단원(클래식 기타)</div>
								</div>
							</div>
						</div>
					</div>

					<div class="artist-cards">
						<div class="cards1">
							<div class="card__item1">
								<div class="inner-card">
									<div class="card-imag">
										<img src="/resource/임재민 프로필사진2.png" alt="Изображение">
										<div class="card_text">
											<div class="social">
												<a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-facebook-f"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-twitter"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-pinterest-p"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-instagram"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="card-info">
									<div class="card-name">임재민</div>
									<div class="card-prof">단원(클래식 기타)</div>
								</div>
							</div>

							<div class="card__item2">
								<div class="inner-card">
									<div class="card-imag">
										<img src="/resource/허대욱 프로필사진.jpg" alt="Изображение">
										<div class="card_text">
											<div class="social">
												<a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-facebook-f"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-twitter"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-pinterest-p"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-instagram"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="card-info">
									<div class="card-name">허대욱</div>
									<div class="card-prof">단원(재즈 피아노)</div>
								</div>
							</div>

							<div class="card__item3">
								<div class="inner-card">
									<div class="card-imag">
										<img src="/resource/허병훈 프로필사진.jpg" alt="Изображение">
										<div class="card_text">
											<div class="social">
												<a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-facebook-f"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-twitter"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-pinterest-p"></i>
												</a> <a href="#" class="social_iteam" target="_blank"> <i
													class="fab fa-instagram"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div class="card-info">
									<div class="card-name">허병훈</div>
									<div class="card-prof">고문</div>
								</div>
							</div>
						</div>
					</div>


					<div class="text-center mt-24">
						<a class="btn btn-outline" href="/usr/artist">아티스트 더보기</a>
					</div>
			</section>

			<div class="section ">
				<div class="container">
					<div class="section_heder">
						<h3 class="section_suptitle">Albums</h3>
						<h2 class="section_title">앨범</h2>
						<div class="section__Text">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Dolorum atque, nihil impedit laboriosam ullam ipsa voluptate
								iure quis corrupti totam, nesciunt nemo voluptatem possimus
								doloribus similique perferendis blanditiis architecto? Ut!</p>
						</div>
					</div>
					<div class="logos">
						<div class="logo-items">
							<img class="logo_imge" src="/resource/음악앨범 1.jpg">
							<div class="card-prof2">Will It Be Spring Tomorrow?</div>
						</div>
						<div class="logo-items">
							<img class="logo_imge" src="/resource/음악앨범 2.jpg">
							<div class="card-prof2">Interval Of Parallel</div>
						</div>
						<div class="logo-items">
							<a href="https://youtu.be/KebPgX7_sGA"> <img
								class="logo_imge" src="/resource/음악앨범 3.jpg">
							</a>
							<div class="card-prof2">Trigram</div>
						</div>
						<div class="logo-items">
							<img class="logo_imge" src="/resource/음악앨범 4.jpg">
							<div class="card-prof2">Le Moment Disperse</div>
						</div>
						<div class="logo-items ">
							<img class="logo_imge " src="/resource/음악앨범 5.jpg">
							<div class="card-prof2">To The West</div>
						</div>
						<div class="logo-items ">
							<img class="logo_imge" src="/resource/음악앨범 6.jpg">
							<div class="card-prof2">스페인의 인상</div>
						</div>

					</div>
				</div>
			</div>

			<section class="section section-gray" id="work">
				<div class="container">
					<div class="section_heder">
						<h3 class="section_suptitle">What we do</h3>
						<h2 class="section_title">공연 및 무대사진</h2>
						<div class="section__Text">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Dolorum atque, nihil impedit laboriosam ullam ipsa voluptate
								iure quis corrupti totam, nesciunt nemo voluptatem possimus
								doloribus similique perferendis blanditiis architecto? Ut!</p>
						</div>
					</div>
				</div>
				<div class="works">
					<div class="works__col">
						<div class="works-item">
							<img class="work__image" src="/resource/공연사진.jpg" alt="">
							<div class="work-info">
								<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
								</a>
								<div class="work__title">creat infotr hurntd</div>
								<div class="works__text">Lorem ipsum dolor sit</div>
							</div>
						</div>
						<div class="works-item">
							<img class="work__image" src="/resource/무대사진.jpg" alt="">
							<div class="work-info">
								<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
								</a>
								<div class="work__title">creat infotr hurntd</div>
								<div class="works__text">Lorem ipsum dolor sit</div>
							</div>
						</div>
					</div>
					<div class="works__col">
						<div class="works-item">
							<img class="work__image"
								src="https://i.postimg.cc/WhcW7SM1/2.jpg" alt="">
							<div class="work-info">
								<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
								</a>
								<div class="work__title">creat infotr hurntd</div>
								<div class="works__text">Lorem ipsum dolor sit</div>
							</div>
						</div>
						<div class="works-item">
							<img class="work__image"
								src="https://i.postimg.cc/0MTj6qG0/4.jpg" alt="">
							<div class="work-info">
								<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
								</a>
								<div class="work__title">creat infotr hurntd</div>
								<div class="works__text">Lorem ipsum dolor sit</div>
							</div>
						</div>
					</div>
					<div class="works__col">
						<div class="works-item">
							<img class="work__image"
								src="https://i.postimg.cc/nM9nX5PC/3.jpg[/img][/url]" alt="">
							<div class="work-info">
								<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
								</a>
								<div class="work__title">creat infotr hurntd</div>
								<div class="works__text">Lorem ipsum dolor sit</div>
							</div>
						</div>
					</div>
					<div class="works__col">

						<div class="works-item">
							<img class="work__image"
								src="https://i.postimg.cc/3Wvfpz0q/1.jpg" alt="">
							<div class="work-info">
								<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
								</a>
								<div class="work__title">creat infotr hurntd</div>
								<div class="works__text">Lorem ipsum dolor sit</div>
							</div>
						</div>
						<div class="works-item">
							<img class="work__image"
								src="https://i.postimg.cc/pmMjG4SS/7.jpg" alt="">
							<div class="work-info">
								<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
								</a>
								<div class="work__title">creat infotr hurntd</div>
								<div class="works__text">Lorem ipsum dolor sit</div>
							</div>
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
					<div class="blog">
						<div class="blo_item">
							<div class="blog-header">
								<a href="#"> <img class="blog_img"
									src="/resource/블로그사진1.jpg" alt="">
								</a>
								<div class="blog_date">
									<div class="blog-date-day">15</div>
									Jan
								</div>
							</div>
							<div class="blog-content">
								<div class="blog_title">
									<a href="#">Lorem ipsum dolor sit amet.</a>
								</div>
								<div class="blog-text">Lorem ipsum dolor sit amet,
									consectetur adipisicing elit. Sed perspiciatis magni,
									reprehenderit doloribus aliquid saepe commodi sit dolor, rem
									earum!</div>
							</div>
							<div class="blog_footer">
								<div class="blog-stat">
									<span class="blog-stat-item"><i class="far fa-eye"></i>542</span>
									<span class="blog-stat-item"><i
										class="far fa-comment-dots"></i>17</span>
								</div>
							</div>
						</div>
						<div class="blo_item">
							<div class="blog-header">
								<a href="#"> <img class="blog_img"
									src="/resource/블로그사진2.jpg" alt="">
								</a>
								<div class="blog_date">
									<div class="blog-date-day">15</div>
									Jan
								</div>
							</div>
							<div class="blog-content">
								<div class="blog_title">
									<a href="#">Lorem ipsum dolor sit amet.</a>
								</div>
								<div class="blog-text">Lorem ipsum dolor sit amet,
									consectetur adipisicing elit. Sed perspiciatis magni,
									reprehenderit doloribus aliquid saepe commodi sit dolor, rem
									earum!</div>
							</div>
							<div class="blog_footer">
								<div class="blog-stat">
									<span class="blog-stat-item"><i class="far fa-eye"></i>542</span>
									<span class="blog-stat-item"><i
										class="far fa-comment-dots"></i>17</span>
								</div>
							</div>
						</div>
						<div class="blo_item">
							<div class="blog-header">
								<a href="#"> <img class="blog_img"
									src="/resource/블로그사진3.jpg" alt="">
								</a>
								<div class="blog_date">
									<div class="blog-date-day">15</div>
									Jan
								</div>
							</div>
							<div class="blog-content">
								<div class="blog_title">
									<a href="#">Lorem ipsum dolor sit amet.</a>
								</div>
								<div class="blog-text">Lorem ipsum dolor sit amet,
									consectetur adipisicing elit. Sed perspiciatis magni,
									reprehenderit doloribus aliquid saepe commodi sit dolor, rem
									earum!</div>
							</div>
							<div class="blog_footer">
								<div class="blog-stat">
									<span class="blog-stat-item"><i class="far fa-eye"></i>542</span>
									<span class="blog-stat-item"><i
										class="far fa-comment-dots"></i>17</span>
								</div>
							</div>
						</div>
					</div>
					<!-- blog-->
				</div>
			</section>
		</div>


	</div>
</body>

</html>
<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>
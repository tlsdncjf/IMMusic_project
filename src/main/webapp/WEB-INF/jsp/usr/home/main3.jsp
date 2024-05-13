<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<link
	href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat:300i,400,700&display=swap&subset=cyrillic-ext"
	rel="stylesheet">
<script src="https://use.fontawesome.com/692e9fe4aa.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

</head>



<style>
/* 앨범 슬라이드쇼 */
#testbox {
	overflow: hidden;
	position: relative;
	width: 1200px;
	height: 450px;
}

.test {
	width: 3720px; /* 이미지 하나의 너비로 설정합니다. */
	height: 450px;
	display: flex;
	flex-wrap: nowrap;
	animation: bannermove 25s linear infinite;
	padding-bottom: 30px;
	position: relative; /* .text-overlay의 위치를 상대적으로 설정합니다. */
}

.test > div {
	flex: 0 0 auto;
	height: 250px;
	width: 250px;
	position: relative; /* .text-overlay의 위치를 상대적으로 설정합니다. */
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
    width: 3720px; /* 이미지 하나의 너비로 설정합니다. */
    height: 450px;
    display: flex;
    flex-wrap: nowrap;
    animation: bannermove 25s linear infinite;
    padding-bottom: 30px;
    position: relative; /* .text-overlay의 위치를 상대적으로 설정합니다. */
}

.test2>div {
    flex: 0 0 auto;
    height: 450px;
    width: 310px;
    position: relative; /* .text-overlay의 위치를 상대적으로 설정합니다. */
}

img {
	width: 100%; /* 이미지를 부모 요소의 너비에 맞게 설정합니다. */
	height: 100%; /* 이미지를 부모 요소의 높이에 맞게 설정합니다. */
	padding: 10px; /* 이미지 주위에 여백을 추가합니다. */
}

.text-overlay2 {
    position: absolute;
    bottom: 50%; /* 이미지의 중간을 기준으로 설정합니다. */
    left: 50%; /* 이미지의 중간을 기준으로 설정합니다. */
    transform: translate(-50%, -50%); /* 수직 및 수평 가운데 정렬을 위해 사용됩니다. */
    opacity: 0;
    background-color: rgba(0, 0, 0, 0.7);
    color: white;
    padding: 5px 10px;
    transition: opacity 0.3s ease;
    display: inline; /* p 요소를 인라인으로 설정하여 한 줄에 나오게 합니다. */
}

.test2>div:hover .text-overlay2 {
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

/* 아티스트 슬라이드 */
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

.header {
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	z-index: 1000;
	padding-top: 13px;
}

.header.fixed {
	padding: 10px 0;
	background-color: #eb8b8d;
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	transform: translate3d(0, 0, 0);
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2)
}

.header.active {
	background-color: #eb8b8d;
}

.header-inner {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 30px;
	font-weight: 700;
	color: #fff;
}

.nav {
	font-size: 14px;
	text-transform: uppercase;
}
/*nav-toggle*/
.nav-toggle {
	width: 30px;
	position: absolute;
	top: 25px;
	display: none;
	padding: 10px 0;
	right: 25px;
	font-size: 0;
	color: transparent;
	border: none;
	background: none;
	z-index: 1;
	cursor: pointer;
}

.nav-toggle__item {
	display: block;
	width: 100%;
	height: 3px;
	background-color: #fff;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	margin: auto;
	transition: background .1s linear;
}

.nav-toggle__item:before, .nav-toggle__item:after {
	content: '';
	display: block;
	position: absolute;
	width: 100%;
	height: 3px;
	background-color: #fff;
	left: 0;
	z-index: 1;
	transition: transform .2s linear;
}

.nav-toggle__item:before {
	top: -8px;
}

.nav-toggle__item:after {
	bottom: -8px;
}

.nav-toggle.active .nav-toggle__item:before {
	transform-origin: left top;
	transform: rotate(45deg) translate3d(0px, -2px, 0);
}

.nav-toggle.active .nav-toggle__item:after {
	transform-origin: left bottom;
	transform: rotate(-45deg) translate3d(0px, 3px, 0);
}

.nav-toggle.active .nav-toggle__item {
	background: none;
}

.nav-link {
	display: inline-block;
	vertical-align: top;
	margin: 0 10px;
	color: #fff;
	text-decoration: none;
	transition: color .1s linear;
	position: relative;
}

.nav-link.active {
	color: #fce38a;
}

.nav-link:hover {
	color: #fce38a;
}

.nav-link:after {
	content: '';
	display: block;
	width: 100%;
	height: 3px;
	top: 100%;
	background-color: #fce38a;
	position: absolute;
	left: 0;
	z-index: 1;
	opacity: 0;
	transition: opacity .1s linear;
}

.nav-link:hover:after, .nav-link.active:after {
	opacity: 1;
}

/* .btn { */
/* 	display: inline-block; */
/* 	vertical-align: top; */
/* 	border: 3px solid #fff; */
/* 	padding: 8px 30px; */
/* 	color: #fff; */
/* 	text-decoration: none; */
/* 	text-transform: uppercase; */
/* 	font-size: 14px; */
/* 	font-weight: 700; */
/* 	transition: background .1s linear, color .1s linear; */
/* } */

/* .btn:hover { */
/* 	cursor: pointer; */
/* 	background-color: #fff; */
/* 	color: black; */
/* } */
.slider {
	width: 100%;
	position: absolute;
	bottom: 0;
	left: 0;
	z-index: 1;
}

.slider_item {
	width: 23%;
	font-size: 18px;
	color: #fff;
	text-transform: uppercase;
	padding: 20px 0;
	position: relative;
	opacity: 0.7;
	border-top: 3px solid #fff;
}

.slider_inner {
	display: flex;
	justify-content: space-between;
}

.slider_nambur {
	font-size: 24px;
	font-weight: 700;
}

.slider_item.activ {
	opacity: 1;
}

.slider_item.activ:before {
	content: '';
	display: block;
	width: 71px;
	height: 3px;
	top: -3px;
	left: 0;
	z-index: 1;
	bottom: 6px;
	background-color: #f38181;
	position: absolute;
}

.section {
	padding-top: 50px;
}

.section_heder {
	width: 100%;
	max-width: 950px;
	margin: 0 auto 50px;
	text-align: center;
}

.section--map {
	padding: 35px 0;
	background: url('https://i.postimg.cc/d3YVzZGN/34355.jpg') center
		no-repeat;
	-webkit-background-size: cover;
	background-size: cover;
}

.section_suptitle {
	font-size: 24px;
	color: #333;
	font-family: 'Kaushan Script', cursive;
}

.section--devices {
	padding-bottom: 0;
	background: url("https://i.postimg.cc/c1nF4GZR/343434.jpg") center
		no-repeat;
	-webkit-background-size: cover;
	background-size: cover;
	margin-bottom: 76px;
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

.cards1 {
	margin: 80px -15px 0;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	z-index: auto;
}

.cards2 {
	margin: 80px -15px 0;
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.card__item {
	width: 33.33333%;
	padding: 0 15px;
}

.card__item1 {
	width: 33.33333%;
	padding: 0 15px;
	position: relative;
	z-index: 2;
}

.card__item2 {
	width: 33.33333%;
	padding: 0 15px;
	position: relative;
	z-index: 4;
}

.card__item3 {
	width: 33.33333%;
	padding: 0 15px;
	position: relative;
	z-index: 6;
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

.stat_count {
	margin-bottom: 10px;
	font-size: 72px;
	font-weight: 700;
	line-height: 1;
}

.stat_text_item {
	padding: 15px;
}

.stat_text {
	font-size: 14px;
	text-transform: uppercase;
}

.servisec {
	display: flex;
	flex-wrap: wrap;
}

.item_service {
	width: 33.33333%;
	position: relative;
	padding: 0 35px 40px 85px;
	margin-bottom: 40px;
}

.item_service_border {
	border-bottom: 1px solid #e5e5e5;
}

.servisec_img {
	position: absolute;
	top: 0;
	left: 28px;
	z-index: 1;
}

.service__title {
	margin-bottom: 10px;
	font-size: 14px;
	color: #333;
	text-transform: uppercase;
}

.service__text {
	font-size: 15px;
	color: #999;
}

.container-imges {
	width: 100%;
	max-width: 600px;
	margin: 0 auto;
	position: relative;
}

.deivice-item {
	display: block;
	max-width: 100%;
	height: auto;
}

.deivice-item--img-pone {
	position: absolute;
	right: 0;
	bottom: -80px;
	z-index: 1;
}

.wedo {
	display: flex;
	margin: 0 -10px;
	flex-wrap: wrap;
}

.wedo-item {
	width: 50%;
	padding: 0 15px;
}

.wedo-img {
	display: block;
	max-width: 100%;
	height: auto;
}

.acardion-item {
	border: 1px solid #e5e5e5;
	margin-bottom: 10px;
}

.acardion-header {
	border-bottom: 1px solid transparent;
	padding: 15px 20px 15px 65px;
	position: relative;
	cursor: pointer;
}

.acardion-item.active
.acardion-header {
	border-bottom-color: #e5e5e5;
}

.acardion-header:after {
	content: '';
	display: block;
	width: 10px;
	height: 10px;
	border-top: 2px solid #ccc;
	border-right: 2px solid #ccc;
	position: absolute;
	top: 50%;
	right: 20px;
	z-index: 1;
	transform: translateY(-50%) rotate(135deg);
}

.acardion-item.active
.acardion-header:after {
	transform: translateY(-50%) rotate(-45deg);
	margin-top: 5px;
}

.acardion-item.active 
.acardion_content {
	display: block;
}

.accard-icon {
	position: absolute;
	left: 15px;
	top: 50%;
	width: 30px;
	height: 30px;
	z-index: 1;
	transform: translateY(-50%);
}

.acardion_content {
	padding: 15px 20px;
	color: #999;
	font-size: 15px;
	font-style: italic;
	font-style: 300;
	display: none;
}

.header-text {
	font-size: 14px;
	color: #333;
	text-transform: uppercase;
	font-weight: 600;
}

.section-gray {
	background-color: #f8f8f8;
}

.reviews__item {
	min-height: 210px;
	padding-left: 260px;
	position: relative;
}

.reviews {
	padding: 0 110px;
	position: relative;
}

.reviews_photo {
	width: 210px;
	height: 210px;
	position: absolute;
	left: 0;
	top: 0;
	z-index: 1;
	border: 4px solid #95e1d3;
	border-radius: 50%;
	display: block;
}

.reviews_block {
	font-size: 23px;
	font-style: italic;
	font-weight: 300;
	color: #999;
	padding-top: 20px;
}

.reviews__author {
	font-size: 24px;
	color: #000;
	font-family: 'Kaushan Script', cursive;
}

.reviews__author:before {
	content: "";
	display: inline-block;
	vertical-align: middle;
	width: 60px;
	height: 3px;
	margin-right: 10px;
	background-color: #f38181;
}

.review-button {
	font-size: 0;
	color: transparent;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	z-index: 1;
}

.review-button:after {
	content: '';
	display: block;
	width: 15px;
	height: 15px;
	border-top: 2px solid #ccc;
	border-left: 2px solid #ccc;
	z-index: 1;
}

.reviews__bt--prev {
	left: 0;
	transform: rotate(-45deg);
}

.reviews__bt--next {
	right: 0;
	transform: rotate(135deg);
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

.clients {
	display: flex;
	flex-wrap: wrap;
	margin-top: 70px;
}

.clients__item {
	width: 50%;
	padding: 0 45px 0 175px;
	position: relative;
	margin-bottom: 60px;
}

.clients_photo {
	width: 110px;
	height: 110px;
	border-radius: 50%;
	position: absolute;
	top: 0;
	left: 40px;
	z-index: 1;
}

.clients_name {
	margin-bottom: 5px;
	font-size: 14px;
	color: #333;
	text-transform: uppercase;
}

.clients_prof {
	font-size: 15px;
	color: #333;
	font-style: italic;
	font-weight: 300;
}

.clients__text {
	font-size: 15px;
	color: #999;
}

.clients__text:before {
	content: "";
	display: block;
	width: 60px;
	height: 3px;
	background-color: #f38181;
	margin: 15px 0;
}

.section__fons {
	background: url("../img/images/343434.jpg") no-repeat center;
	-webkit-background-size: cover;
	background-size: cover;
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

.map {
	text-align: center;
}

.map__title {
	color: inherit;
	font-size: 24px;
	font-weight: 700;
	color: #f38181;
	text-transform: uppercase;
}

.map__title a {
	color: #f38181;
	text-decoration: none;
}

.map__title a:hover {
	text-decoration: underline;
}

.map__title:after {
	content: "";
	display: block;
	width: 60px;
	height: 3px;
	background-color: #f38181;
	margin: 20px auto;
}

.footer {
	padding: 65px;
	background-color: #f8f8f8
}

.footer_inner {
	padding-bottom: 65px;
	display: flex;
	justify-content: space-between;
	margin: 0 -15px;
}

.footer__col {
	padding: 0 15px;
}

.footer_logo {
	font-size: 46px;
	font-weight: 700;
	color: #ccc;
	margin-bottom: 30px;
}

.footer_col--first {
	width: 40%;
}

.footer_col--second {
	width: 29%;
}

.footer_col--third {
	width: 22%;
}

.footer-text {
	font-size: 15px;
	color: #999;
	margin-bottom: 30px;
}

.footer__social {
	margin-bottom: 25px;
}

.footer__social--header {
	padding-bottom: 15px;
	font-size: 14px;
	color: #333;
	border-bottom: 1px solid #e5e5e5;
}

.footer__social--header b {
	font-size: 18px;
}

.footer__social--content {
	padding-top: 15px;
	font-size: 15px;
	color: #999;
	font-style: italic;
	font-weight: 300;
}

.footer__social--content a {
	display: inline-block;
	vertical-align: middle;
	margin-left: 10px;
	color: #95e1d3;
	font-size: 18px;
	text-decoration: none;
}

.subst {
	width: 100%;
	max-width: 380px;
	display: flex;
}

.input_subst {
	width: 60%;
	height: 40px;
	background-color: #fff;
	border: 1px solid #e7e7e7;
	font-size: 15px;
	font-style: italic;
	color: #333;
	font-weight: 300;
	padding: 12px;
	font-family: 'Montserrat', sans-serif;
	line-height: 1.1;
	border-right: 0;
}

.input_subst:focus {
	border-color: #95e1d3;
}

.footer__title {
	margin: 30px 0;
	text-transform: uppercase;
	font-size: 14px;
	color: #333;
}

.subset_button {
	width: 40%;
	height: 40px;
	padding: 12px 30px;
	background-color: #94e1d3;
	font-family: 'Montserrat', sans-serif;
	border: none;
	cursor: pointer;
	font-size: 14px;
	font-weight: 700;
	line-height: 1.1;
	color: #fff;
	text-transform: uppercase;
	transition: background .2s linear;
}

.subset_button::placeholder {
	color: #ccc;
}

.subset_button:hover {
	background-color: #74c7b8;
}

.blog_item {
	display: flex;
	margin-bottom: 19px;
	align-items: center;
}

.blogs_contents {
	padding-left: 20px;
}

.bloks_title {
	margin-bottom: 5px;
	font-size: 12px;
	text-transform: uppercase;
	text-decoration: none;
	line-height: 1.5;
	display: block;
}

.blogs_img {
	width: 120px;
	height: 80px;
	line-height: 1;
}

.bloks_title:hover {
	text-decoration: underline;
}

.blogs_date {
	font-size: 13px;
	color: #999;
	font-style: italic;
	font-weight: 300;
}

.instagram {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.insta_item {
	width: 33%;
	border-bottom: 1px solid #fff;
}

.insta_item img {
	display: block;
	max-width: 100%;
	height: auto;
}

.copyright {
	padding: 20px 0;
	border-top: 1px solid #e5e5e5;
	font-size: 14px;
	text-align: center;
	color: #333;
}

.copyright span {
	color: #f38181;
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
	/*header*/
	.header {
		padding: 10px 0;
	}
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
	/*item_service*/
	.item_service {
		width: 50%;
		padding-bottom: 0;
	}
	.item_service_border {
		border-bottom: 0;
	}
	/* . reviews */
	.reviews_block {
		font-size: 19px;
	}
	.reviews_photo {
		width: 150px;
		height: 150px;
		top: 25px;
	}
	.reviews__item {
		padding-left: 175px;
	}
	/*clients__item*/
	.clients {
		max-width: 600px;
		margin: 0 auto;
	}
	.clients__item {
		width: 100%;
		margin-bottom: 30px;
		border-bottom: 1px dashed silver;
		padding-bottom: 10px;
		padding-right: 0;
	}
	.clients__item:last-child {
		border-bottom: none;
		margin-bottom: 0;
	}
	/*footer_col--first*/
	.footer_inner {
		flex-wrap: wrap;
	}
	.footer_col--first {
		width: 100%;
	}
	.footer_col--second, .footer_col--third {
		width: 50%;
	}
	/*instagram*/
	.instagram {
		justify-content: flex-start;
	}
	.insta_item {
		width: auto;
		border-right: 1px solid #fff;
	}
	.footer {
		padding-right: 0;
	}
}

@media ( max-width : 770px) {
	/* intro */
	.intro {
		min-height: 650px;
	}
	/*nav */
	.nav {
		display: none;
		width: 100%;
		position: absolute;
		top: 100%;
		left: 0;
		background-color: #eb8b8b;
	}
	.nav.active {
		display: block;
	}
	.nav-link {
		display: block;
		margin: 0;
		padding: 8px 20px;
	}

	/*nav-toggle*/
	.nav-toggle {
		display: block;
	}

	/* slider--text*/
	.slider--text {
		display: none;
	}
	.slider_item.activ:before {
		width: 50%;
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
	/*item_service*/
	.servisec {
		justify-content: center;
	}
	.item_service {
		width: 100%;
		max-width: 400px;
		padding-left: 55px;
		padding-right: 0;
	}
	.servisec_img {
		left: 0;
	}
	/*wedo-img*/
	.wedo-img {
		display: none;
	}
	.wedo-item {
		width: 100%;
	}
	/*reviews*/
	.reviews {
		padding: 0 60px;
	}
	.reviews_photo {
		position: static;
		margin: 0 auto 20px;
	}
	.reviews__item {
		padding-left: 0;
	}
	.reviews_block {
		font-size: 16px;
	}
	.reviews__author {
		font-size: 20px;
	}
	/*works*/
	.works {
		flex-wrap: wrap;
	}
	.works__col {
		flex: none;
		width: 50%;
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
	/*footer_col--first*/
	.footer_col--second, .footer_col--third {
		width: 100%;
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
	/*devices*/
	.container-imges {
		max-width: 320px;
	}
	.deivice-item--img-pone {
		width: 180px;
		bottom: -50px;
		right: -60px;
	}
	/*reviews*/
	.reviews {
		padding: 0px;
	}
	.review-button {
		top: 18%;
	}
	.logos {
		flex-wrap: wrap;
		justify-content: center;
	}
	.logo_items {
		width: 50%;
		margin-bottom: 20px;
	}
	.logo_imge {
		margin: 0 auto;
		margin-right: 20px;
	}

	/*works*/
	.works__col {
		width: 100%;
	}
	/*clients__item*/
	.clients_photo {
		position: static;
	}
	.clients__item {
		padding-left: 0;
		text-align: center;
	}
	.clients__text:before {
		margin: 15px auto;
	}

	/*footer_col--first*/
	.footer_col--third {
		width: 100%;
	}
	.footer {
		padding-left: 20px;
	}
	/*subst*/
	.subst {
		flex-wrap: wrap;
		max-width: none;
	}
	.input_subst {
		width: 100%;
		margin-bottom: 10px;
		border-right: 1px solid #e7e7e7;
	}
	.subset_button {
		width: 100%;
	}
	/*blogs_img*/
	.blogs_img {
		width: 80px;
		height: 50%;
	}
	.bloks_title {
		font-size: 10px;
	}
	.blogs_date {
		font-size: 10px;
	}
	.works-item {
		max-width: 600px;
	}
}
</style>

<script>

</script>


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
										<a href="https://blog.naver.com/jazzjarasum/221102783565">피아니스트 허대욱, 에오 트리오로 만나다.</a>
									</div>
								</div>
							</div>
						</div>
						<div class="card__item">
							<div class="inner-card">
								<div class="card-imag">
									<img src="/resource/공연 포스터 2.jpg" alt="Изображение">
									<div class="card_text">
										<a href="https://blog.naver.com/jazzjarasum/221102783565">포스터 2</a>
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
			</section>

			<div class="section">
				<div class="container">
					<div class="section_heder">
						<h3 class="section_suptitle">Who we you</h3>
						<h2 class="section_title">단원 소개</h2>
						<div class="section__Text">
							<p>“비바기타앙상블”은 2012년부터 기타리스트 허원경이 이끄는 앙상블 팀으로 서울대학교 동문으로 이루어진 클래식기타 연주팀이다.</p>
						</div>
					</div>
				
			<div id="testbox2">
				<div class="test2" id="slider">
					<div>
        				<img src="/resource/허원경 프로필사진.png">
        				<div class="text-overlay2">
                			<p>허원경</p>
               		 		<p>리더(클래식 기타)</p>
            			</div>
    				</div>

					<div>
						<img src="/resource/구보근 프로필사진.png">
						<div class="text-overlay2">
                			<p>구본근</p>
               		 		<p>단원(클래식 기타)</p>
            			</div>
					</div>

					<div>
						<img src="/resource/원유현 프로필사진.png">
						<div class="text-overlay2">
                			<p>원유현</p>
               		 		<p>단원(클래식 기타)</p>
            			</div>
					</div>

					<div>
						<img src="/resource/임재민 프로필사진2.png">
						<div class="text-overlay2">
                			<p>임재민</p>
               		 		<p>단원(클래식 기타)</p>
            			</div>
					</div>

					<div>
						<img src="/resource/허대욱 프로필사진.jpg">
						<div class="text-overlay2">
                			<p>허대욱</p>
               		 		<p>단원(재즈 피아노)</p>
            			</div>
					</div>

					<div>
						<img src="/resource/허병훈 프로필사진.jpg">
						<div class="text-overlay2">
                			<p>허병훈</p>
               		 		<p>고문</p>
            			</div>
					</div>
					<!--   clone2     -->
					<div class="clone3">
						<img src="/resource/허원경 프로필사진.png">
						<div class="text-overlay2">
                			<p>허원경</p>
               		 		<p>리더(클래식 기타)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/구보근 프로필사진.png">
						<div class="text-overlay2">
                			<p>구본근</p>
               		 		<p>단원(클래식 기타)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/원유현 프로필사진.png">
						<div class="text-overlay2">
                			<p>원유현</p>
               		 		<p>단원(클래식 기타)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/임재민 프로필사진2.png">
						<div class="text-overlay2">
                			<p>임재민</p>
               		 		<p>단원(클래식 기타)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/허대욱 프로필사진.jpg">
						<div class="text-overlay2">
                			<p>허대욱</p>
               		 		<p>단원(재즈 피아노)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/허병훈 프로필사진.jpg">
						<div class="text-overlay2">
                			<p>허병훈</p>
               		 		<p>고문</p>
            			</div>
					</div>
					<div class="clone3">
						<img src="/resource/허원경 프로필사진.png">
						<div class="text-overlay2">
                			<p>허원경</p>
               		 		<p>리더(클래식 기타)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/구보근 프로필사진.png">
						<div class="text-overlay2">
                			<p>구본근</p>
               		 		<p>단원(클래식 기타)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/원유현 프로필사진.png">
						<div class="text-overlay2">
                			<p>원유현</p>
               		 		<p>단원(클래식 기타)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/임재민 프로필사진2.png">
						<div class="text-overlay2">
                			<p>임재민</p>
               		 		<p>단원(클래식 기타)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/허대욱 프로필사진.jpg">
						<div class="text-overlay2">
                			<p>허대욱</p>
               		 		<p>단원(재즈 피아노)</p>
            			</div>
					</div>

					<div class="clone3">
						<img src="/resource/허병훈 프로필사진.jpg">
						<div class="text-overlay2">
                			<p>허병훈</p>
               		 		<p>고문</p>
            			</div>
					</div>
				</div>
			</div>
		</div>
	</div>


			<div class="section ">
				<div class="container">
					<div class="section_heder">
						<h3 class="section_suptitle">Albums</h3>
						<h2 class="section_title">앨범</h2>
						<div class="section__Text">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum atque, nihil impedit laboriosam ullam
								ipsa voluptate iure quis corrupti totam, nesciunt nemo voluptatem possimus doloribus similique perferendis
								blanditiis architecto? Ut!</p>
						</div>
					</div>
					
					<div id="testbox">
    					<div class="test" id="slider">
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
						</div>
					</div>
				</div>

					<section class="section section-gray" id="work">
						<div class="container">
							<div class="section_heder">
								<h3 class="section_suptitle">Who we do</h3>
								<h2 class="section_title">공연 및 무대사진</h2>
								<div class="section__Text">
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum atque, nihil impedit laboriosam ullam
										ipsa voluptate iure quis corrupti totam, nesciunt nemo voluptatem possimus doloribus similique perferendis
										blanditiis architecto? Ut!</p>
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
									<img class="work__image" src="https://i.postimg.cc/WhcW7SM1/2.jpg" alt="">
									<div class="work-info">
										<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
										</a>
										<div class="work__title">creat infotr hurntd</div>
										<div class="works__text">Lorem ipsum dolor sit</div>
									</div>
								</div>
								<div class="works-item">
									<img class="work__image" src="https://i.postimg.cc/0MTj6qG0/4.jpg" alt="">
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
									<img class="work__image" src="https://i.postimg.cc/nM9nX5PC/3.jpg[/img][/url]" alt="">
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
									<img class="work__image" src="https://i.postimg.cc/3Wvfpz0q/1.jpg" alt="">
									<div class="work-info">
										<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
										</a>
										<div class="work__title">creat infotr hurntd</div>
										<div class="works__text">Lorem ipsum dolor sit</div>
									</div>
								</div>
								<div class="works-item">
									<img class="work__image" src="https://i.postimg.cc/pmMjG4SS/7.jpg" alt="">
									<div class="work-info">
										<a class="works-icon" href="#"> <i class="fas fa-mountain"></i>
										</a>
										<div class="work__title">creat infotr hurntd</div>
										<div class="works__text">Lorem ipsum dolor sit</div>
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
										<a href="#"> <img class="blog_img" src="/resource/블로그사진1.jpg" alt="">
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
										<div class="blog-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed perspiciatis magni,
											reprehenderit doloribus aliquid saepe commodi sit dolor, rem earum!</div>
									</div>
									<div class="blog_footer">
										<div class="blog-stat">
											<span class="blog-stat-item"><i class="far fa-eye"></i>542</span> <span class="blog-stat-item"><i
												class="far fa-comment-dots"></i>17</span>
										</div>
									</div>
								</div>
								<div class="blo_item">
									<div class="blog-header">
										<a href="#"> <img class="blog_img" src="/resource/블로그사진2.jpg" alt="">
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
										<div class="blog-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed perspiciatis magni,
											reprehenderit doloribus aliquid saepe commodi sit dolor, rem earum!</div>
									</div>
									<div class="blog_footer">
										<div class="blog-stat">
											<span class="blog-stat-item"><i class="far fa-eye"></i>542</span> <span class="blog-stat-item"><i
												class="far fa-comment-dots"></i>17</span>
										</div>
									</div>
								</div>
								<div class="blo_item">
									<div class="blog-header">
										<a href="#"> <img class="blog_img" src="/resource/블로그사진3.jpg" alt="">
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
										<div class="blog-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed perspiciatis magni,
											reprehenderit doloribus aliquid saepe commodi sit dolor, rem earum!</div>
									</div>
									<div class="blog_footer">
										<div class="blog-stat">
											<span class="blog-stat-item"><i class="far fa-eye"></i>542</span> <span class="blog-stat-item"><i
												class="far fa-comment-dots"></i>17</span>
										</div>
									</div>
								</div>
							</div>
							<!-- blog-->
						</div>
					</section>
				</div>



				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
				<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
				<script src="acss/js/app.js"></script>
			</div>
</body>

</html>
<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>
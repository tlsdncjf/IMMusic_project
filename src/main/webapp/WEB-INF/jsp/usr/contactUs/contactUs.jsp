<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CONTACT US"></c:set>
<%@ include file="../common/head.jspf"%>

<style>
* {
	box-sizing: border-box;
}

section {
	height: 700px;
}

.cards {
	width: 75%;
	display: flex;
	display: -webkit-flex;
	justify-content: center;
	-webkit-justify-content: center;
	margin: 0 auto;
}

.card--1 .card_img, .card--1 .card_img--hover {
	background-image:
		url('https://www.pngarts.com/files/10/Default-Profile-Picture-PNG-Download-Image.png');
}

.card--2 .card_img, .card--2 .card_img--hover {
	background-image:
		url('/resource/원유현.jpg');
	background-size: cover; /* Adjusts the background image to cover the entire container */
    background-repeat: no-repeat; /* Ensures the background image is not repeated */
    /* Additional styles */
    width: 100%; /* Set a width for the container */
    height: 235px; /* Set a height for the container */
}

.card_img {
	visibility: hidden;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	width: 100%;
	height: 235px;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
}

.card_info-hover {
	position: absolute;
	padding: 16px;
	width: 100%;
	opacity: 0;
	top: 0;
}

.card_img--hover {
	transition: 0.2s all ease-out;
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	width: 100%;
	position: absolute;
	height: 235px;
	border-top-left-radius: 12px;
	border-top-right-radius: 12px;
	top: 0;
}

.card {
	margin-right: 80px;
	transition: all .4s cubic-bezier(0.175, 0.885, 0, 1);
	background-color: #fff;
	width: 33.3%;
	position: relative;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0px 13px 8px -7px rgba(0, 0, 0, 0.1), /* 하단 그림자 */
                8px 0px 10px -7px rgba(0, 0, 0, 0.1); /* 오른쪽 그림자 */
}

.card:last-child {
	margin-right: 0;
}

.card:hover {
	box-shadow: 0px 30px 18px -8px rgba(0, 0, 0, 0.1);
	transform: scale(1.10, 1.10);
}

.card_info {
	z-index: 2;
	background-color: #fff;
	border-bottom-left-radius: 12px;
	border-bottom-right-radius: 12px;
	padding: 16px 24px 24px 24px;
}

.card_name {
	/* text-transform: uppercase; 대문자처리*/
	font-size: 15px;
	letter-spacing: 1px;
	font-weight: 700;
}

.blank {
	height:7px;
}

.card_subinfo {
	font-size: 13px;
	font-weight: 500;
	color: #868686;
	white-space: nowrap;
	margin-bottom: 5px;
}

.card_subinfo img {
	display: inline-block; /* Display inline */
    vertical-align: middle; /* Align vertically */
	width: 15px;
	height: 15px;
	margin-right: 3px;
}

.card_title {
	margin-top: 5px;
	margin-bottom: 10px;
}

.card_by {
	font-size: 12px;
	font-weight: 500;
}

.card_author {
	font-weight: 600;
	text-decoration: none;
	color: #AD7D52;
}

.card:hover .card_img--hover {
	height: 100%;
	opacity: 0.3;
}

.card:hover .card_info {
	background-color: transparent;
	position: relative;
}

.card:hover .card_info-hover {
	opacity: 1;
}

/* sns hover */
.git:hover, 
.velog:hover {
    color: #b3a78f;
    font-weight: 600;
}
</style>


<div class="greet-bg">
	<p>
		IMMusic <br>& Art
	</p>
</div>


<section>
	<div class="cards">
		<article class="card card--2">
			<div class="card_info-hover">
		<!-- 		<svg class="card_like" viewBox="0 0 24 24">
		    <path fill="#000000"
						d="M12.1,18.55L12,18.65L11.89,18.55C7.14,14.24 4,11.39 4,8.5C4,6.5 5.5,5 7.5,5C9.04,5 10.54,6 11.07,7.36H12.93C13.46,6 14.96,5 16.5,5C18.5,5 20,6.5 20,8.5C20,11.39 16.86,14.24 12.1,18.55M16.5,3C14.76,3 13.09,3.81 12,5.08C10.91,3.81 9.24,3 7.5,3C4.42,3 2,5.41 2,8.5C2,12.27 5.4,15.36 10.55,20.03L12,21.35L13.45,20.03C18.6,15.36 22,12.27 22,8.5C22,5.41 19.58,3 16.5,3Z" />
		</svg>
				<div class="card_clock-info">
					<svg class="card_clock" viewBox="0 0 24 24">
						<path
							d="M12,20A7,7 0 0,1 5,13A7,7 0 0,1 12,6A7,7 0 0,1 19,13A7,7 0 0,1 12,20M19.03,7.39L20.45,5.97C20,5.46 19.55,5 19.04,4.56L17.62,6C16.07,4.74 14.12,4 12,4A9,9 0 0,0 3,13A9,9 0 0,0 12,22C17,22 21,17.97 21,13C21,10.88 20.26,8.93 19.03,7.39M11,14H13V8H11M15,1H9V3H15V1Z" />
		        </svg>
					<span class="card_time">15 min</span>
				</div> -->
			</div>
			<div class="card_img"></div>
			<a href="#" class="card_link">
				<div class="card_img--hover"></div>
			</a>
			<div class="card_info">
				<span class="card_name">원유현</span>
				<div class="blank"></div>
				<div class="card_subinfo"><img src="/resource/birth.png" alt="Icon Image">1994.10.23</div>
				<div class="card_subinfo"><img src="/resource/phone.png" alt="Icon Image">010-3084-1288</div>
				<div class="card_subinfo"><img src="/resource/gmail.png" alt="Icon Image">yhwit30@gmail.com</div>
				<div class="card_subinfo"><a href="https://velog.io/@yhwit30/posts" class="velog" target = "_blank"><img src="/resource/velog.png" alt="Icon Image">velog.io/@yhwit30/posts</a></div>
				<div class="card_subinfo"><a href="https://github.com/yhwit30" class="git" target = "_blank"><img src="/resource/github.png" alt="Icon Image">github.com/yhwit30</a></div>
			</div>
		</article>

		<article class="card card--1">
			<div class="card_info-hover">
			</div>
			<div class="card_img"></div>
			<a href="#" class="card_link">
				<div class="card_img--hover"></div>
			</a>
			<div class="card_info">
				<span class="card_name">오효주</span>
				<div class="blank"></div>
				<div class="card_subinfo"><img src="/resource/birth.png" alt="Icon Image">1997.02.06</div>
				<div class="card_subinfo"><img src="/resource/phone.png" alt="Icon Image">010-7607-0903</div>
				<div class="card_subinfo"><img src="/resource/gmail.png" alt="Icon Image">555gywn@gmail.com</div>
				<div class="card_subinfo"><a href="https://velog.io/@ohyo555/posts" class="velog" target = "_blank"><img src="/resource/velog.png" alt="Icon Image">velog.io/@ohyo555/posts</a></div>
				<div class="card_subinfo"><a href="https://github.com/ohyo555" class="git" target = "_blank"><img src="/resource/github.png" alt="Icon Image">github.com/ohyo555</a></div>
			</div>
		</article>

		<article class="card card--1">
			<div class="card_info-hover">
			</div>
			<div class="card_img"></div>
			<a href="#" class="card_link">
				<div class="card_img--hover"></div>
			</a>
			<div class="card_info">
				<span class="card_name">강민창</span>
				<div class="blank"></div>
				<div class="card_subinfo"><img src="/resource/birth.png" alt="Icon Image">2001.02.19</div>
				<div class="card_subinfo"><img src="/resource/phone.png" alt="Icon Image">010-7518-3408</div>
				<div class="card_subinfo"><img src="/resource/gmail.png" alt="Icon Image">itkang0219@gmail.com</div>
				<div class="card_subinfo"><a href="https://velog.io/@itkang0219/posts" class="velog" target = "_blank"><img src="/resource/velog.png" alt="Icon Image">velog.io/@itkang0219/posts</a></div>
				<div class="card_subinfo"><a href="https://github.com/itkmc" class="git" target = "_blank"><img src="/resource/github.png" alt="Icon Image">github.com/itkmc</a></div>
			</div>
		</article>

		<article class="card card--1">
			<div class="card_info-hover">
			</div>
			<div class="card_img"></div>
			<a href="#" class="card_link">
				<div class="card_img--hover"></div>
			</a>
			<div class="card_info">
				<span class="card_name">신우철</span>
				<div class="blank"></div>
				<div class="card_subinfo"><img src="/resource/birth.png" alt="Icon Image">2000.08.08</div>
				<div class="card_subinfo"><img src="/resource/phone.png" alt="Icon Image">010-9915-0734</div>
				<div class="card_subinfo"><img src="/resource/gmail.png" alt="Icon Image">shinwc147369@gmail.com</div>
				<div class="card_subinfo"><a href="https://velog.io/@shinwc0808/posts" class="velog" target = "_blank"><img src="/resource/velog.png" alt="Icon Image">velog.io/@shinwc0808/posts</a></div>
				<div class="card_subinfo"><a href="https://github.com/tlsdncjf" class="git" target = "_blank"><img src="/resource/github.png" alt="Icon Image">github.com/tlsdncjf</a></div>
			</div>
		</article>
	</div>

</section>
<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>
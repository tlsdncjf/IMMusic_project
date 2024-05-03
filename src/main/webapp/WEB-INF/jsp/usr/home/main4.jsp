<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--  <c:set var="main" value="MAIN"></c:set> --%>
<c:set var="pageTitle" value="MAIN"></c:set>
<%@ include file="../common/head.jspf"%>


<div class="slider">
	<div class="slide_viewer">
		<div class="slide_group">
			<div class="slide"><img src="/resource/공연사진.jpg"/></div>
			<div class="slide"><img src="/resource/에오 트리오 사진.jpg"/></div>
			<div class="slide"><img src="/resource/스페인음악여행 연주사진.jpg"/></div>
<!-- 			<div class="slide"><img src="/resource/공연사진.jpg"/></div> -->
		</div>
	</div>


	<div class="slide_buttons">
		<!-- 	<div class="directional_nav"> -->
		<div class="previous_btn" title="Previous">◁</div>
		<div class="next_btn" title="Next">▷</div>
		<!-- 	</div> -->
	</div>
</div>



<style>
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

 /* 슬라이드의 배경색 지정 */
.slide:nth-of-type(1) {
	background: #D7A151;
}

.slide:nth-of-type(2) {
	background: #F4E4CD;
}

.slide:nth-of-type(3) {
	background: #C75534;
}

.slide:nth-of-type(4) {
	background: #D1D1D4;
} 

.slide_buttons {
	left: 0; /* 왼쪽 정렬 */
	position: absolute; /* 위치 지정 */
	right: 0; /* 오른쪽 정렬 */
	text-align: center; /* 텍스트 가운데 정렬 */
	height: 100vh;
	display: flex;
	align-items: flex-end;
	justify-content: center;
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
	bottom: 0; /* 아래쪽 정렬 */
	left: 10px; /* 왼쪽 여백 설정 */
	position: absolute; /* 위치 지정 */
	top: 50%; /* 위쪽 정렬 */
}

.next_btn {
	bottom: 0; /* 아래쪽 정렬 */
	position: absolute; /* 위치 지정 */
	right: 10px; /* 오른쪽 여백 설정 */
	top: 50%; /* 위쪽 정렬 */
}

.previous_btn, .next_btn {
	cursor: pointer; /* 커서 포인터로 변경 */
	height: 65px; /* 높이 설정 */
	opacity: 0.5; /* 투명도 설정 */
	-webkit-transition: opacity 0.4s ease-in-out; /* 웹킷 브라우저용 트랜지션 설정 */
	-moz-transition: opacity 0.4s ease-in-out; /* 모질라 브라우저용 트랜지션 설정 */
	-ms-transition: opacity 0.4s ease-in-out; /* 마이크로소프트 브라우저용 트랜지션 설정 */
	-o-transition: opacity 0.4s ease-in-out; /* 오페라 브라우저용 트랜지션 설정 */
	transition: opacity 0.4s ease-in-out; /* 트랜지션 설정 */
	width: 65px; /* 너비 설정 */
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
</style>

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
			}).appendTo('.slide_buttons');
			bulletArray.push($button);
		});

		advance();
	});
</script>







<!-- 페이지 하단 -->
<%@ include file="../common/foot.jspf"%>
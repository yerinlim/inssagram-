<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>inssagram</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<style>
.right {
	text-align: right;
}

.left {
	text-align: left;
}

.center {
	text-align: center;
}

p {
	text-align: center;
}

.myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

.myImg:hover {
	opacity: 0.7;
}

/* The Modal (background) */
.modal {
	display: none;
	/* Hidden by default */
	position: fixed;
	/* Stay in place */
	z-index: 1;
	/* Sit on top */
	padding-top: 5px;
	/* Location of the box */
	left: 20%;
	top: 15%;
	width: 60%;
	/* Full width */
	height: 80%;
	/* Full height */
	background-color: rgba(216, 214, 216, 0.9);
	/* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
	margin: 2.5em 1em 0 0;
	display: block;
	width: 50%;
	max-width: 500px;
}

/* Caption of Modal Image */
.caption {
	margin: auto;
	display: block;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

dl.alt dd {
	margin: 0 0 0 4em;
	font-size: 15px;
}

dl.alt dt {
	font-size: 15px;
}

hr {
	border: 0;
	border-bottom: solid 1px;
	margin: 0.5em 0;
}

dl {
	margin: 0 0 0 0;
}

.spotlight .image {
	margin-right: 0.5em;
	margin-left: 0;
	padding: 0em;
	border-radius: 0%;
	/* border: 0; */
}

.image.fit {
	margin: 0 0 0 0;
}

/* .icon.alt {
	margin: 0.5em 0 0.5em 0;
	border: 0;
} */
</style>
</head>
<body class="is-preload">

	<nav class="alt" id="nav">
		<div class="navbar-header">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-4">
				<a href="${pageContext.request.contextPath}/timeLine">
					<span class="logo">
						<img src="${pageContext.request.contextPath}/resources/images/KakaoTalk_20190110_174629325.png"></span></a>
				</div>
				<div class="col-5">
					<ul class="actions">
						<li><input class="submit_on_enter" type="text" value=""
							placeholder="Search..." style="width: 200px; height: 40px;"></li>
					</ul>
				</div>
				<div class="col-1">
					<a href="${pageContext.request.contextPath}/myTimeLine" class="icon alt fa-user-o"><span
						class="label"></span></a>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
	</nav>

	<!-- Wrapper -->
	<div id="wrapper">
      <header id="header">
      </header>

      <nav id="nav2" class="">
         <ul>
            <li><a href="${pageContext.request.contextPath}/timeLine">타임라인</a></li>
            <li><a href="${pageContext.request.contextPath}/gallery" class="active">갤러리</a></li>
         </ul>
      </nav>

		<!-- Main -->
		<div id="main">

			<!-- Introduction -->
			<section id="intro" class="main">

				<div class="box alt">
					<div class="row gtr-uniform">
					
						<c:forEach var="r" items="${list}">
							<div class="col-4">
								<span class="image fit">
									<a href="#myModal">
										<img class="myImg"
										src="${pageContext.request.contextPath}/resources/images/${r.picture}"
										alt="게시글">
									</a>
								</span>
							</div>
						</c:forEach>
					
					</div>
				</div>

				<!-- The Modal -->
			  <div class="modal fade" id="myModal" role="dialog">
					<div class="modal-dialog">

						<div class="row" style="padding: 10px; margin: 1em;">
							<div class="col-7">
								<span class="image fit"><img class="modal-content" alt=""></span>
							</div>
							<div class="col-5">
								<div class="row-inline">
									<div class="spotlight">
										<span class="image">
										<img src="${pageContext.request.contextPath}/resources/images/dthumbGKD2Y7I4.jpg"
											class="img-circle" alt=""></span>
										<div class="content">
											<h3>dogom</h3>
										</div>
										
										<span class="close">&times;</span>
									</div>
								</div>
								
								<div class="alt">
									<h5>
										<a href=""> <strong>dogom</strong></a> 노을이 너무 아름답다
									</h5>
								</div>

								<hr style="border-color:rgb(138, 134, 140);">
								<div class=""
									style="overflow-y: scroll; overflow-x: hidden; height: 300px;">
									<dl class="alt">
										<dt>minjin</dt>
										<dd>나는 뮤지컬보러간다~</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!!!~~</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
										<dt>jong__</dt>
										<dd>잘못된 액션을 처리했군요.</dd>
									</dl>
								</div>

								<div>
									<div class="row-inline">
										<h5>
											<a href="#" class="icon alt fa-heart-o"><span
												class="label">Twitter</span></a> <strong>dmsthf</strong>님 <strong>외
												37명</strong>이 좋아합니다.
										</h5>
									</div>
									<div>
									<form>
										<input class="submit_on_enter" type="text"
											style="height: 2em; border-color:rgb(138, 134, 140);" placeholder="댓글달기~~~">
									</form>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>
	</div>


	<!-- Scripts -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#logo").on("click", function() {
				location.assign("${pageContext.request.contextPath}/index.jsp");
			});
			var modal = $("#myModal"); //팝업 div

			var imgsUrl; //이미지 url

			var altText; //이미지안 alt값 출력

			$(".myImg").on("click", function() { //클릭 이벤트

				var _index = $(this).parent().index(); //해당 index 찾기

				var _indexTar = $(".img-list div").eq(_index); //해당 인덱스

				$(".img-list div").removeClass("open"); //"open" 클래스 삭제

				_indexTar.addClass("open"); //"open" 클래스 추가

				imgsUrl = $(this).attr("src"); //이미지 경로에 src경로 찾기

				altText = $(this).attr("alt"); //이미지 경로에 alr값 찾기

				modal.find(".modal-content").attr("src", imgsUrl); //해당 팝업 안에 이미지 넣기

				modal.find(".modal-content").attr("id", ""); //팝업안 이미지 순서

				modal.find(".modal-content").attr("id", "imgs_" + _index); //팝업안 이미지 순서

				modal.find(".caption").text(altText); // 팝업 텍스트 출력

				modal.show(); //팝업 열기

			})

			$(".close").on("click", function() {

				modal.hide(); //팝업 닫기

			})

			$('.submit_on_enter').keydown(function(event) {
				// enter has keyCode = 13, change it if you want to use another button
				if (event.keyCode == 13) {
					this.form.submit();
					return false;
				}
			});

		});
	</script>
</body>
</html>
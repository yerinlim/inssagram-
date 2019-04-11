<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>inssagram</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
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

hr {
	border: 0;
	border-bottom: solid 1px;
	margin: 0.5em 0;
}

.spotlight .image {
	margin-right: 0.5em;
	margin-left: 0;
	padding: 0em;
	border-radius: 0%;
	border: 0;
}

.image.fit {
	margin: 0 0 0 0;
}

.image.fit img {
	border-radius: 50%;
}

/* .icon.alt {
	margin: 0.5em 0 0.5em 0;
	border: 0;
} */
.navbar-header a {
	vertical-align: text-bottom;
	text-decoratio: none;
}

/*********프로필편집 css**********/
.profileEditForm {
	max-width: 800px;
	padding: 20px 12px 10px 20px;
	font: Arial, Helvetica, sans-serif;
}

.profileEditForm_heading {
	font-weight: bold;
	border-bottom: 2px solid #ddd;
	margin-bottom: 20px;
	font-size: 25px;
	padding-bottom: 3px;
}

aside {
	float: left;
	width: 150px;
	text-align: right;
}

label {
	margin-top: 6%;
	font-weight: 600;
}

#main {
	max-width: 85%;
	margin-left: auto;
	margin-right: auto;
}

.content {
	width: 80%;
	float: right;
	border-left: solid 0.5px #ddd;
	font-size: 18px;
	margin-bottom : 5%;
}

.sidebar {
	font-size: 18px;
	width: 20%;
	float: left;
	width: 20%;
}

.sidebar a {
	border-left: 3px solid transparent;
}

.sidebar li:hover {
	background-color: #ddd;
	border-left: 3px solid #8e9196;
}

.sidebar li:visited {
	background-color: #ddd;
	border-left-color: #262626;
	font-weight: 600;
}

.sidebar ul {
	list-style: none;
	padding: 0 0 0;
}

.sidebar li {
	vertical-align: baseline;
	display: list-item;
	padding: 16px 16px 16px 30px;
	line-height: 20px;
	border-left: 3px solid transparent;
}

.clear {
	clear: both;
}

#resultModal {
	display: none;
	/* Hidden by default */
	position: fixed;
	/* Stay in place */
	z-index: 1;
	/* Sit on top */
	padding-top: 5px;
	/* Location of the box */
	left: 40%;
	top: 40%;
	width: 23%;
	height: 20%;
	background-color: rgba(216, 214, 216, 0.9);
}

form {
	margin: 0;
}

ul.actions li {
	padding: 10px;
}
ul.line{
	float : left;
}
ul.line li {
	list-style-type: none;
	float: left;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<nav class="alt" id="nav">
		<div class="navbar-header">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-4">
					<span class="logo"><a
						href="${pageContext.request.contextPath}/timeLine"><img
							src="${pageContext.request.contextPath}/resources/images/KakaoTalk_20190110_174629325.png"></a></span>
				</div>
				<div class="col-5">
					<ul class="actions">
						<li><input class="submit_on_enter" type="text" value=""
							placeholder="Search..." style="width: 200px; height: 40px;"></li>
					</ul>

				</div>
				<div class="col-1">
					<a href="${pageContext.request.contextPath}/myTimeLine"
						class="icon alt fa-user-o"><span class="label"></span></a>
				</div>
				<div class="col-1"></div>

			</div>
		</div>
	</nav>
	<div id="wrapper">

		<header id="header"> </header>

		<div id="main" class="container">

			<div class="content">
				<div style="margin: 10% 20% 10% 20%">
					<div class="profileEditForm" id="profileEditForm">

						<form method="post"
							action="${pageContext.request.contextPath}/profilePictureUpdate"
							method="post" enctype="multipart/form-data">

							<div>
								<p>
									<span class="image fit"> <img id="preview"
										src="${pageContext.request.contextPath}/resources/images/${user.profile_}"
										alt="등록사진">
									</span>
								</p>

								<input type="file" class="button icon" id="getfile" name="pUrl" 
										style="border: 1px solid #BFC4C7;">
								<div style="margin-top : 5%;">
									<ul class="actions">
										<li><a
											href="${pageContext.request.contextPath}/profileEdit">
											<input type="button" style="font-size: 20px; border: 1px solid #BFC4C7; font-weight: 500;" value="취소">
										</a>
										</li>
										<li>
											<input type="submit"
												style="font-size: 20px; border: 3px solid #DA6E97; font-weight: 500;" value="저장">
										</li>
									</ul>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<ul>
					<li style="background-color: #ddd; border-left-color: #262626;"><a
						href="${pageContext.request.contextPath}/profileEdit"
						class="w3-bar-item w3-button active">프로필 편집</a></li>
					<li
						style="background-color: #ddd; border-left-color: #262626; font-size: 15px; font-weight: 600;"><a
						href="#" class="w3-bar-item w3-button active">&nbsp;프로필 사진 편집</a></li>
					<li><a href="${pageContext.request.contextPath}/passwordEdit"
						class="w3-bar-item w3-button">비밀번호 변경</a></li>
				</ul>
			</div>
			<div class="clear"></div>


			<div class="modal fade" id="resultModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-head">&nbsp;</div>
						<div class="modal-body">
							<!-- 내용 -->
							<h4 id="resultMessage" class="center"
								style="font-size: 20px; font-weight: 600;">resultMessage</h4>
							<div class="right" style="padding-right: 30px;">
								<button id="btnDismiss" type="button" class="btn btn-default">확인</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>





		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer>
	</div>

	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {

			$('.submit_on_enter').keydown(function(event) {
				// enter has keyCode = 13, change it if you want to use another button
				if (event.keyCode == 13) {
					this.form.submit();
					return false;
				}
			});

			$("#btnDismiss").on("click", function() {
				$("#resultModal").hide();
			});

			if ('${result}' == 'success') {
				$("#resultMessage").text("프로필 수정에 성공했습니다.");
				$("#resultModal").show();
			}
			if ('${result}' == 'fail') {
				$("#resultMessage").text("프로필 수정에 실패했습니다.");
				$("#resultModal").show();
			}

			//이미지 미리보기 
			var file = document.querySelector('#getfile');
			file.onchange = function() {
				var fileList = file.files;

				//읽기
				var reader = new FileReader();
				reader.readAsDataURL(fileList[0]);
				//로드 한 후
				reader.onload = function() {
					//로컬 이미지를 보여주기
					document.querySelector('#preview').src = reader.result;

					tempImage.onload = function() {
						//리사이즈를 위해 캔버스 객체 생성
						var canvas = document.createElement('canvas');
						var canvasContext = canvas.getContext("2d");

						//캔버스 크기 설정
						canvas.width = 100; //가로 100px
						canvas.height = 100; //세로 100px

						//이미지를 캔버스에 그리기
						canvasContext.drawImage(this, 0, 0, 100, 100);

						//캔버스에 그린 이미지를 다시 data-uri 형태로 변환
						var dataURI = canvas.toDataURL("image/jpeg");

					};
				};
			};

		});
	</script>
	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>
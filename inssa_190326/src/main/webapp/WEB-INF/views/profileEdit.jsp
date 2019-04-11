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

.content {
	width: 80%;
	float: right;
	border-left: solid 0.5px #ddd;
	font-size: 18px;
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
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<nav class="alt" id="nav">
		<div class="navbar-header">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-4">
					<span class="logo"><img
						src="${pageContext.request.contextPath}/resources/images/KakaoTalk_20190110_174629325.png"></span>
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
				<div style="margin-left: 5%">
					<div class="profileEditForm" id="profileEditForm">
						<div class="row">
							<div class="spotlight">
								<aside class="image">
									<span style="float: right; padding-right: 20px;"><img
										src="${pageContext.request.contextPath}/resources/images/${user.profile_}"
										class="img-circle" alt=""></span>
								</aside>
								<div>
									<h1 style="font-size: 25px; font-weight: 400; margin:0">${userSession.id_}</h1>
									<a href="${pageContext.request.contextPath}/profilePicture" style="color: #DA6E97; font-weight: 600; padding:0; ">프로필사진 바꾸기</a>
								</div>
							</div>
						</div>
						<form action="${pageContext.request.contextPath}/profileUpdate" method="post" class="form_">

							<div class="row">
								<aside class="label_">
									<label>사용자 아이디<span class="required"
										style="color: #DA6E97;">*</span></label>
								</aside>
								<div class="input_">
									<input type="text" style="height: 50px; width: 480px;"
										class="input-field" name="id_" value="${userSession.id_}"
										placeholder="${userSession.id_}" readonly/>
								</div>
							</div>

							<div class="row">
								<aside class="label_">
									<label>소개</label>
								</aside>
								<div class="input_">
									<input type="text" style="height: 50px; width: 480px;"
										class="input-field" name="status_message" value="${user.status_message}" />
								</div>
							</div>

							<div class="row">
								<aside class="label_">
									<label>이메일<span class="required"
										style="color: #DA6E97;">*</span></label>
								</aside>
								<div class="input_">
									<input type="text" style="height: 50px; width: 480px;"
										class="input-field" name="email" value="${user.email}"
										placeholder="${user.email}" />
								</div>
							</div>

							<div class="submit" style="padding: 30px;">
								<aside class="label_">
									<label></label>
								</aside>
								<button type="submit" class="btnProfileEdit"
									style="background-color: #FFF; border: 3px solid #DA6E97; border-radius: 4px; font-size: 16px; font-weight: 600; cursor: pointer;">
									저장</button>
							</div>

							<div style="padding-left: 30px;">
								<aside class="label_">
									<label></label>
								</aside>
							</div>


						</form>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<ul>
					<li  style="background-color: #ddd; border-left-color: #262626; font-weight: 600;"><a href="#" class="w3-bar-item w3-button active">프로필 편집</a></li>
					<li><a href="${pageContext.request.contextPath}/passwordEdit"
						class="w3-bar-item w3-button">비밀번호 변경</a></li>
				</ul>
			</div>
			<div class="clear"></div>

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
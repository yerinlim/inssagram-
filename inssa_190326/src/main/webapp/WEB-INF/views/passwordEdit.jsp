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

aside {
	float: left;
	width: 150px;
	text-align: right;
}

label {
	margin-top: 6%;
	font-weight: 600;
}

.passwordEditForm {
	max-width: 800px;
	padding: 20px 12px 10px 20px;
	font: Arial, Helvetica, sans-serif;
}

.passwordEditForm_heading {
	font-weight: bold;
	border-bottom: 2px solid #ddd;
	margin-bottom: 20px;
	font-size: 25px;
	padding-bottom: 3px;
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

.sidebar li:active {
	background-color: #ddd;
	border-left-color: #262626;
	font-weight: 600;
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
	width: 25%;
	height: 20%;
	background-color: rgba(216, 214, 216, 0.9);
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



		<!-- Main -->
		<div id="main" class="container">

			<div class="content">
				<div style="margin-left: 5%">
					<div class="passwordEditForm" id="passwordEditForm">
						<!-- <div class="profileEditForm_heading center">프로필 편집</div> -->
						<div class="row">
							<div class="spotlight">
								<aside class="image">
									<span style="float: right; padding-right: 20px;"><img
										src="${pageContext.request.contextPath}/resources/images/${userSession.profile_}"
										class="img-circle" alt=""></span>
								</aside>
								<span style="font-size: 25px; font-weight: 400;" id="id_">${userSession.id_}</span>

							</div>
						</div>
						<form action="${pageContext.request.contextPath}/passwordUpdate"
							method="post" class="form_">
							<input type="hidden" name="id_" value="${userSession.id_}">							
							<div class="row">
								<aside class="label_">
									<label>현재 비밀번호</label>
								</aside>
								<div class="input_">
									<input type="password" style="height: 50px; width: 480px;"
										class="input-field" id="pw_" name="pw_" required />
								</div>
							</div>

							<div class="row">
								<aside class="label_">
									<label>새 비밀번호</label>
								</aside>
								<div class="input_">
									<input type="password" style="height: 50px; width: 480px;"
										class="input-field" id="newPw" name="newPw" required />
								</div>
							</div>

							<div class="row">
								<aside class="label_">
									<label>새 비밀번호 확인</label>
								</aside>
								<div class="input_">
									<input type="password" style="height: 50px; width: 480px;"
										class="input-field" id="newPw2" name="newPw2" required />
								</div>
							</div>

							<div class="submit" style="padding: 30px;">
								<aside class="label_">
									<label></label>
								</aside>
								<button type="submit" class="btnPasswordEdit"
									id="btnPasswordEdit"
									style="background-color: #FFF; border: 3px solid #DA6E97; border-radius: 4px; font-size: 16px; font-weight: 600; cursor: pointer;">비밀번호
									변경</button>
							</div>

							<div style="padding-left: 30px;">
								<aside class="label_">
									<label></label>
								</aside>
								<a href="${pageContext.request.contextPath}/find" style="color: #DA6E97; font-weight: 600;">비밀번호를
									잊으셨나요?</a>
							</div>


						</form>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<ul>
					<li><a href="${pageContext.request.contextPath}/profileEdit"
						class="w3-bar-item w3-button">프로필 편집</a></li>
					<li
						style="background-color: #ddd; border-left-color: #262626; font-weight: 600;"><a
						href="#resultModal" class="w3-bar-item w3-button">비밀번호 변경</a></li>
				</ul>
			</div>
			<div class="clear"></div>



			<div class="modal fade" id="resultModal" role="dialog">
				<div class="modal-dialog">
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-body">
							<!-- 내용 -->
							<h4 id="resultMessage">resultMessage</h4>
							<div class="row">
								<div class="right">
									<button id="btnDismiss" type="button" class="btn btn-default">확인</button>
								</div>
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

			var pw_ = $("#pw_").val();
			var newPw = $("#newPw").val();
			var newPw2 = $("#newPw2").val();
			
			$("#btnDismiss").on("click", function() {
				$("#resultModal").hide();
			});

			if ('${result}' == 'success') {
				$("#resultMessage").text("비밀번호 수정에 성공했습니다.");
				$("#resultModal").show();
			}
			if ('${result}' == 'fail') {
				$("#resultMessage").text("비밀번호 수정에 실패했습니다.");
				$("#resultModal").show();
			}
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
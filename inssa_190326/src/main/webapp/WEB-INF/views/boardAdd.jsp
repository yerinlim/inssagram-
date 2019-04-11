<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>inssagram</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
	<style>
.fileBox .fileName {
	display:inline-block;
	width:190px;
	height:30px;
	padding-left:10px;
	margin-right:5px;
	line-height:30px;
	border:1px solid #aaa;
	background-color:#fff;
	vertical-align:middle
	}
	
.fileBox .btn_file {
	display:inline-block;
	border:1px solid #000;
	width:100px;
	height:30px;
	font-size:0.8em;
	line-height:30px;
	text-align:center;
	vertical-align:middle
}

		.right {
			text-align: right;
		}
		
		.left {
			text-align: left;
		}
		
		.center {
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
			border: 0;
		}
		
		.image.fit {
			margin: 0 0 0 0;
		}
		
		
		.image.fit img {
		    width: 19.5em;
		    height: 19.5em;
		}
		
		.icon.alt {
			/* margin: 0.5em 0 0.5em 0; */
			border: 0;
		}
		
		#header .row>.col-4 {
			width: 33.3333333333%;
			height: 13em;
		}
		
		#header .row>.col-4 img {
			border-radius: 100%;
		}
		
		textarea {
		    padding: 0.75em 1em;
		    width: 19.5em;
		    height: 19.5em;
		    resize: none;
		}
	</style>
   </head>
   <body class="is-preload">

   <!-- Wrapper -->
   <nav class="alt" id="nav">
      <div class="navbar-header">
         <div class="row">
         <div class="col-1">
         </div>
            <div class="col-4">
            <a href="${pageContext.request.contextPath}/timeLine">
               <span class="logo"><img
                  src="${pageContext.request.contextPath}/resources/images/KakaoTalk_20190110_174629325.png"></span></a>
            </div>
            <div class="col-5">
               <ul class="actions">
                  <li><input class="submit_on_enter" type="text" value="" 
                     placeholder="Search..." style="width: 200px; height: 40px;"></li>
               </ul>

            </div>
            <div class="col-1">
               <a href="#" class="icon alt fa-user-o"><span class="label"></span></a>
            </div>
            <div class="col-1">
            </div>

         </div>
      </div>
   </nav>
   <div id="wrapper">

		<header id="header">
      </header>

      <nav id="nav2" class="">
         <ul>
            <li><a href="${pageContext.request.contextPath}/myTimeLine"
               class="">타임라인</a></li>
            <li><a href="${pageContext.request.contextPath}/myGallery">갤러리</a></li>
         </ul>
      </nav>

 		<!-- Main -->
		<div id="main">

			<!-- Content -->
			<section id="content" class="main">

				<!-- Form -->
				<section>
					<h2>새 게시글</h2>
					<form method="post" action="${pageContext.request.contextPath}/boardAdd/newAdd"
						method="post" enctype="multipart/form-data">
						<div class="row gtr-uniform">
							<div class="col-6">
								<p>
									<span class="image fit">
									<img id="preview" src="${pageContext.request.contextPath}/resources/images/solsol_p.jpg" alt="등록사진">
									</span>
								</p>
							</div>
							<div class="col-6">
								<textarea name="content" id="demo-message"
									placeholder="Enter your message" rows="6"></textarea>
							</div>
							<div class="col-6 fileBox">
								<ul class="actions">
									<li><input type="file" class="" id="getfile" name="pUrl" required></li>
								</ul>
							</div>
							<div class="col-6">
								<ul class="actions">
									<li><input type="reset" value="취소"></li>
									<li><input type="submit" value="게시물 작성" class="primary"></li>
								</ul>
							</div>
						</div>
					</form>
				</section>

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
			
			//이미지 미리보기 
			var file = document.querySelector('#getfile');
			file.onchange = function () {
				var fileList = file.files ;

			    //읽기
			    var reader = new FileReader();
			    reader.readAsDataURL(fileList [0]);
			    //로드 한 후
			    reader.onload = function  () {
			        //로컬 이미지를 보여주기
			        document.querySelector('#preview').src = reader.result;

			        tempImage.onload = function () {
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
</body>
</html>
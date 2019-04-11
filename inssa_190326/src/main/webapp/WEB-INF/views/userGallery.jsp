<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>inssagram</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
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

/* p {
	text-align: center;
} */

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


#follower_list {
	display: none;
	/* Hidden by default */
	position: fixed;
	/* Stay in place */
	z-index: 1;
	/* Sit on top */
	padding-top: 5px;
	/* Location of the box */
	left: 40%;
	top: 15%;
	width: 25%;
	/* Full width */
	height: 60%;
	/* Full height */
	background-color: rgba(216, 214, 216, 0.9);
	/* Black w/ opacity */
	overflow-y: scroll;
	overflow-x: hidden;
}

#following_list {
	display: none;
	/* Hidden by default */
	position: fixed;
	/* Stay in place */
	z-index: 1;
	/* Sit on top */
	padding-top: 5px;
	/* Location of the box */
	left: 40%;
	top: 15%;
	width: 25%;
	/* Full width */
	height: 60%;
	/* Full height */
	background-color: rgba(216, 214, 216, 0.9);
	/* Black w/ opacity */
	overflow-y: scroll;
	overflow-x: hidden;
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
	border: 0;
}

.image.fit {
	margin: 0 0 0 0;
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
</style>
<%-- <noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript> --%>
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
               <a href="${pageContext.request.contextPath}/myTimeLine" class="icon alt fa-user-o"><span class="label"></span></a>
            </div>
            <div class="col-1">
            </div>

         </div>
      </div>
   </nav>
   <div id="wrapper">

		<header id="header">
			<div class="row">
				<div class="col-4 image">
					<!-- 사진크기 정사각형 아닌거 width랑 heigth 정적으로 맞추면 페이지 줄였을때 반응 안함 어떻게 하쥐?(정적으로 정해놓으면 235적당) -->
					<img
						src="${pageContext.request.contextPath}/resources/images/${user.profile_}"
						class="img-circle" alt="" width="100%" height="100%" >
				</div>

				<div class="col-8">

					<ul class="actions">
						<li><h2>${user.id_}</h2></li>
						<li class="profileEdit">
							<button class="small ${followCheck==0?'follow':'unfollow primary'}" 
								value="${user.id_}" style="font-weight:bold;">
								${followCheck==0?"팔로우":"팔로잉"}
							</button>
						</li>
					</ul>
					<ul class="actions">
						<li><p>
								게시글 <strong>${fn:length(list)}</strong>
							</p></li>
						<li class="follower_list">
							<p><a href="#follower_list">
									팔로워 <strong>${fn:length(follower_list)}</strong>
								</a></p></li>
						<li class="following_list"><p><a href="#following_list">
									팔로우 <strong>${fn:length(following_list)}</strong>
								</a></p></li>
					</ul>
					<ul class="actions">
						<li><p>${user.status_message}</p></li>
					</ul>
				</div>
			</div>
		</header>

		<nav id="nav2" class="">
         <ul>
            <li><a href="${pageContext.request.contextPath}/userTimeLine?id_=${user.id_}">타임라인</a></li>
            <li><a href="${pageContext.request.contextPath}/userGallery?id_=${user.id_}" class="active">갤러리</a></li>
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
										<img class="myImg" alt="${r.board_id}"
										src="${pageContext.request.contextPath}/resources/images/${r.picture}">
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
										<img src="${pageContext.request.contextPath}/resources/images/${user.profile_}"
											class="img-circle" alt=""></span>
										<div class="content">
											<h3>${user.id_}</h3>
										</div>
										<span class="close">&times;</span>
									</div>
								</div>

								<div class="alt board_content">
									<h5>
										<strong>${user.id_}</strong>
										<span>노을이 너무 아름답다</span>
									</h5>
								</div>
								<hr style="border-color: rgb(138, 134, 140);">
								<div class="commentList" style="overflow-y: scroll; overflow-x: hidden; height: 300px;">
									<dl class="alt">
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
												style="height: 2em; border-color: rgb(138, 134, 140);"
												placeholder="댓글달기~~~">
										</form>
									</div>
								</div>

							</div>

						</div>
					</div>
				</div>
				
				
				<!-- 팔로잉 목록 모달창-->
			<div class="modal fade" id="following_list" role="dialog">
				<div class="modal-dialog">
					<div class="row-inline">
						<h5 class="center"
							style="height: 25px; line-height: 25px; margin-top: 0.5em; font-weight: bold;">
							팔로잉 <span class="close right">&times;&ensp;</span>
						</h5>
					</div>
					<hr style="border-color: rgb(255, 255, 255);">
					
					<div class="row" style="padding: 10px; margin: 1em;">
						<c:forEach var="following" items="${following_list}">
							<div class="spotlight col-6" style="padding: 0;">
									<span class="image"><img
										src="${pageContext.request.contextPath}/resources/images/${following.profile_}"
										class="img-circle" alt=""></span>
		
									<div class="content">
										<h3><a href="#"class="userGallery">${following.receive_user}</a></h3>
									</div>
							</div>
							<div class="col-5">
								<c:forEach var="fc" items="${followCheck2}">
									<c:if test="${fc.key==following.receive_user}">
										<c:if test="${fc.key!=sessionScope.userSession.id_}">
											<h3>
												<button type="button" class="${fc.value==0?'follow':'unfollow primary'}"
												value="${fc.key}" style="font-weight: bold;">
												${fc.value==0?"팔로우":"팔로잉"}</button>
											</h3>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			
			
			<!-- 팔로워 목록 모달창-->
			<div class="modal fade" id="follower_list" role="dialog">
				<div class="modal-dialog">
					<div class="row-inline">
						<h5 class="center"
							style="height: 25px; line-height: 25px; margin-top: 0.5em; font-weight: bold;">
							팔로워 <span class="close right">&times;&ensp;</span>
						</h5>
					</div>
					<hr style="border-color: rgb(255, 255, 255);">
					<div class="row" style="padding: 10px; margin: 1em;">
						<c:forEach var="follower" items="${follower_list}">
							<div class="spotlight col-6" style="padding: 0;">
									<span class="image"><img
										src="${pageContext.request.contextPath}/resources/images/${follower.profile_}"
										class="img-circle" alt=""></span>
		
									<div class="content">
										<h3>
											<a href="#"
											class="userGallery">${follower.send_user}</a>
										</h3>
									</div>
							</div>
							<div class="col-5">
								<c:forEach var="fc" items="${followCheck2}">
									<c:if test="${fc.key==follower.send_user}">
										<c:if test="${fc.key!=sessionScope.userSession.id_}">
											<h3>
												<button type="button" class="${fc.value==0?'follow':'unfollow primary'}"
												value="${fc.key}" style="font-weight: bold;">
												${fc.value==0?"팔로우":"팔로잉"}</button>
											</h3>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
						</c:forEach>
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
				location.assign("${pageContext.request.contextPath}/userPage");
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
				
				// 게시글 번호
				var board_id = $(this).attr("alt");
				$.ajax({
	        		url: "${pageContext.request.contextPath}/galleryClick",
	        		data: {board_id : board_id},
	        		success: function(a){
	        			var data = JSON.parse(a);
	        			$("#myModal .board_content span").text(data.content);
	        			
	        			console.log(a);
        				var dl = $("<dl class='alt'></dl>");
	        			for(var b = 0; b < data.comment.length; ++b){
	        				var comment = data.comment[b];
	        				var dt = $("<dt></dt>").text(comment.Cid);
	        				var dd = $("<dd></dd>").text(comment.comment_content);
	        				$(dl).append(dt, dd);
	        				$(".commentList").html(dl);
	        			}
					},
					error: function(error){
						alert("에러요 " + error.status + " " + error.statusText);
					}
				 })
			});
		
			/*****************************팔로잉 팔로우 목록 모달*************************************/
			//팔로워 목록 모달
			var follower_list = $("#follower_list");
			$(".follower_list").on("click", function() {
				follower_list.show(); //팝업 열기
			});

			//팔로잉 목록 모달
			var following_list = $("#following_list");
			$(".following_list").on("click", function() {
				following_list.show(); //팝업 열기
			});

			/*************************************************************************/
			//모달 닫기
			$(".close").on("click", function() {

				modal.hide(); //팝업 닫기
				follower_list.hide();
				following_list.hide();
			});

			//게시물 번호
			var temp = $("#main input").eq(0).val();

			$('.submit_on_enter').keydown(function(event) {
				// enter has keyCode = 13, change it if you want to use another button
				if (event.keyCode == 13) {
					this.form.submit();
					return false;
				}
			});
			
			
			
			// 팔로우
	         $(document).on("click", ".follow", function() {
	        	 var receive_user = $(this).val();
	        	 var send_user = "${sessionScope.userSession.id_}";
	        	 var button = $(this);
	        	$.ajax({
	        		url: "${pageContext.request.contextPath}/follow"
					,data: {receive_user : receive_user, send_user : send_user}
					,success: function(data){
						if(data==1){
							$(button).attr("class", "unfollow primary");
							$(button).text("팔로잉");
						}
						if($(button).parent().attr("class")=="profileEdit"){
							$(button).addClass("small");
						}
						// console.log("팔로우");
					}//success
					,error: function(error){
						 alert(error);
					}
				 })
	         });
	         
	         // 언팔로우
	         $(document).on("click", ".unfollow", function() {
	        	 var receive_user = $(this).val();
	        	 var send_user = "${sessionScope.userSession.id_}";
	        	 var button = $(this);
	        	$.ajax({
	        		url: "${pageContext.request.contextPath}/unFollow"
					,data: {receive_user : receive_user, send_user : send_user}
					,success: function(data){
						if(data==1){
							$(button).attr("class", "follow");
							$(button).text("팔로우");
						}
						if($(button).parent().attr("class")=="profileEdit"){
							$(button).addClass("small");
						}
					}//success
					,error: function(error){
						 alert(error);
					}
				 })
	         });
	         
	         //특정 유저페이지로 이동 
	         $(".userGallery").on("click", function(){
	        	 var id_ = $(this).text();
	        	 if(id_=="${userSession.id_}"){
		        	window.location.assign("${pageContext.request.contextPath}/myGallery");
	        	 }else{
		        	window.location.assign("${pageContext.request.contextPath}/userGallery?id_="+id_);
	        	 }
	         });

		});
	</script>
</body>
</html>
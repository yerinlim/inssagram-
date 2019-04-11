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

.center {
	text-align: center;
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

#header .row>.col-4 {
	width: 33.3333333333%;
	height: 13em;
}

#header .row>.col-4 img {
	border-radius: 100%;
}

dd span {
	font-size: x-small;
	margin-left: 1em;
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

#likeyModal {
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

</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<nav class="alt" id="nav">
		<div class="navbar-header">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-4">
					<a href="${pageContext.request.contextPath}/timeLine">
						<span class="logo">
						<img src="${pageContext.request.contextPath}/resources/images/KakaoTalk_20190110_174629325.png">
						</span></a>
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

		<nav id="nav2" class="">
			<ul>
				<li><a href="${pageContext.request.contextPath}/timeLine"
					class="active">타임라인</a></li>
				<li><a href="${pageContext.request.contextPath}/gallery">갤러리</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<!-- Content -->
			<c:forEach var="t" items="${boardList}">
				<section class="main">
					<!-- 유저정보 -->
					<div class="spotlight">
						<span class="image">
							<img src="${pageContext.request.contextPath}/resources/images/${t.profile_}" alt="프로필">
						</span>
						<div class="content">
							<h2><a href="${pageContext.request.contextPath}/userTimeLine?id_=${t.id_}">${t.id_}</a></h2>
						</div>
					</div>
					
					<!-- 게시글(사진) -->
					<div class="box alt">
						<div class="col-12">
							<span class="image fit">
								<img src="${pageContext.request.contextPath}/resources/images/${t.picture}" alt="타임라인"></span>
						<div id = why>
							<!-- 좋아요 상태(게시물에 나의 좋아요가 있는지 )-->
							<input type="hidden" id= "likey_check" value="${t.lid}">
						</div>
						
						<a  class="${t.lid=='0'?'icon alt fa-heart-o heart':'icon alt fa-heart heart'}" 
								style="cursor : pointer;"><span class="label" >Twitter</span></a>
							<input type="hidden" value="${t.board_id}">
							<input type="hidden" value="${sessionScope.userSession.id_}">
							<input type="hidden" id="lcount"value="${t.likey_count}">
							<a href="#" class="icon alt fa-comment-o"><span class="label"></span></a>
							
							<!-- 좋아요 갯수 -->							
							<h4 class="likey">
								<a href="#likeyModal" class="hahaha" value="${t.board_id}">
									<b id="likeyCount">
									<!-- 좋아요 1개이상부터 표시  -->
									<c:if test="${t.likey_count >0}">
										좋아요 ${t.likey_count}개
									</c:if></b>
								</a>
							</h4>
							
							<!-- 게시글(내용) -->
							<dl class="alt">
								<dt><a href="${pageContext.request.contextPath}/userTimeLine?id_=${t.id_}">${t.id_}</a></dt>
								<dd>${t.content}<span>${t.b_reg_date}</span></dd>
							</dl>
							<hr>
							
							<dl class="alt">
								<!-- 댓글 출력 -->
								<c:forEach var="c" items="${comment}">
									<c:if test="${c.board_id==t.board_id}">
											<dt><a href="#" class="userGallery">${c.id_}</a></dt>
											<dd>${c.comment_content}
												<span>${c.c_reg_date}</span>
												<c:if test="${sessionScope.userSession.id_==c.id_}">
													<span class="comment_delete" value="${c.comment_id}">&times;</span>
												</c:if> 
											</dd>
									</c:if>
								</c:forEach> 
							</dl>
							
							<!-- 댓글입력 -->
							<form action="${pageContext.request.contextPath}/timeLine/insert" method="post">
								<input type="text" name="comment_content" id="comment_content" value=""
									placeholder="댓글을 입력하세요 ">
								<input type="hidden" id="id_" name="id_" value="${sessionScope.userSession.id_}">
								<input type="hidden" id="board_id" name="board_id" value="${t.board_id}">
							</form>
						</div>
					</div>
				</section>
			</c:forEach>
			
			<!-- 좋아요 모달  -->
			<div class="modal fade" id="likeyModal" role="dialog">
				<div class="modal-dialog">
					<div class="row-inline">
						<h5 class="center"
							style="height: 25px; line-height: 25px; margin-top: 0.5em; font-weight: bold;">
							좋아요 <span class="close right">&times;&ensp;</span>
						</h5>
					</div>
					<hr style="border-color: rgb(255, 255, 255);">
					<div class="row" id="lol" style="padding: 10px; margin: 1em;">
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
	<script>
	      $(document).ready(function() {
	         $('.submit_on_enter').keydown(function(event) {
	            // enter has keyCode = 13, change it if you want to use another button
	            if (event.keyCode == 13) {
	               this.form.submit();
	               return false;
	            }
	         });
	         
			/*************************************************************************/
			var likeyModal = $("#likeyModal");
			$(".hahaha").on("click",function(){
				 likeyModal.show(); 
				 
				 $.ajax({
					 url: "${pageContext.request.contextPath}/userPage/likeyAjax"
					 ,data: {board_id:$(this).attr('value')}
					 ,success: function(data_){
						console.log("success");
						
						var user_id = "${userSession.id_}";

						var data = JSON.parse(data_);
						var likey_info = data.likey_info;
						var likeyList ="";
						
						
						for(var i=0; i<likey_info.length; i++){
							var d = likey_info[i];
							var id_=d.id_;
							var profile_ = d.profile_;
							var check_ = d.check_;
							
							 likeyList += "<div class='spotlight col-6' style='padding: 0;'>";
							 likeyList += "<span class='image'><img src='${pageContext.request.contextPath}/resources/images/"+profile_;
							 likeyList += "' class='img-circle' alt=''></span><div class='content'><h3>";
							
							 if(id_==user_id){
							 	likeyList += "<a href='${pageContext.request.contextPath}/myGallery?id_="+id_+"'>"+id_+"</a></h3></div></div>";
							 	likeyList +="<div class='col-5'></div>";

							 }else{
							 	likeyList += "<a href='${pageContext.request.contextPath}/userGallery?id_="+id_+"'>"+id_+"</a></h3></div></div>";
							 	likeyList +="<div class='col-5'><h3>";
								 if(check_=="0"){
								 	likeyList += "<button type='button' class='follow' value='"+id_+"'";
								 	likeyList += " style='font-weight: bold;'>팔로우";
								 }else if(check_=="1"){
									 	likeyList += "<button type='button' class='unfollow primary' value='"+id_+"'";
									 	likeyList += " style='font-weight: bold;'>팔로잉";
								 }
								 likeyList +="</button></h3></div>";
							 }
							
						}
						 $("#lol").html(likeyList);
			
					 },error: function(error){
						 console.log("fail");
					 }
					 })
				 
			});
			
			//모달 닫기
			$(".close").on("click", function() {
				likeyModal.hide();
			});
	         
			
	         //댓글 삭제
	         $(".comment_delete").on("click", function(){
	        	var cid=$(this).attr("value");
	        	window.location.assign("${pageContext.request.contextPath}/timeLine/del?comment_id="+cid);
	         });
	         
	         //좋아요 기능 
	         $(".heart").on("click", function(){
	        	 var board_id = $(this).next().val();
	        	 var id_ = $(this).next().next().val();
	        	 var likey_count = $(this).next().next().next().val();
	        	 var likey_check = $(this).prev().find('#likey_check').val();
	        	 var ll = $(this).nextAll().eq(4).children().eq(0).children().eq(0);
	        	 
	        	 var cAdd = parseInt(likey_count) + 1;
	        	 var cDel = parseInt(likey_count) - 1;
				 var t = $(this);
				 var txt="";
				 var txt01="";
				 
	        	 $.ajax({
					 url: "${pageContext.request.contextPath}/userPage/likey"
					 ,data: {board_id:board_id, id_:id_, likey_check:likey_check}
					 ,success: function(data){
						console.log("success");
						
						if(likey_check=="0"){
								t.prop("class", "icon alt fa-heart heart");
								//좋아요 개수 출력
								txt = "좋아요 "+cAdd+"개";
								txt01="<input type='hidden' id='likey_check' value='1'>";
								t.next().next().next().val(cAdd);
								
							}else {
								t.prop("class", "icon alt fa-heart-o heart");
								txt = "좋아요 "+cDel+"개";
								txt01="<input type='hidden' id='likey_check' value='0'>";
								if(cDel==0){
									txt="";
								}
							 	t.next().next().next().val(cDel);
							}
							 	t.prev().html(txt01);
								ll.html(txt);
						}//success
						
					 ,error: function(error){
						 console.log("fail");
					 }
					 
					 })//ajax
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
	         
		      //팔로우
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
						console.log("팔로우");
					}//success
					,error: function(error){
						// alert(error);
					}
				 })
	         });
	         
	         //언팔로우
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
						console.log("언팔로우");
					}//success
					,error: function(error){
						alert(error);
					}
				 })
	         });
	      });
	      
	      
	      
	   </script>
</body>
</html>
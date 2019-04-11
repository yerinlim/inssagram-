<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE HTML>
<html>
   <head>
      <title>inssagram</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
      
      <style>
form {
    margin: 2em 0 0 0;
}
dd span {
	font-size: x-small;
	margin-left: 1em;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
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
         #header .row > .col-4 {
             width: 33.3333333333%;
             height: 13em;
         }
         #header .row > .col-4 img {
            border-radius: 100%;
         }
 
 .center {
	text-align: center;
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

#followerModal {
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

#followingModal {
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
#boardUpdateModal {
	display: none;
	/* Hidden by default */
	position: fixed;
	/* Stay in place */
	z-index: 1;
	/* Sit on top */
	padding-top: 5px;
	/* Location of the box */
	left: 30%;
	top: 15%;
	width: 35%;
	/* Full width */
	height: 70%;
	/* Full height */
	background-color: rgba(216, 214, 216, 0.9);
	/* Black w/ opacity */
	overflow-x: hidden;
}

/* Modal Content (image) */
.modal-content {
	margin: 0em 1em 0 0;
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
      <noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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

		<header id="header" >
			<div class="row">
				<div class="col-4">
					<img src="${pageContext.request.contextPath}/resources/images/${user.profile_}" alt="" width="100%" height="100%">
				</div>
				
				<div class="col-8">
					<ul class="actions">
						<li><h2>${userSession.id_}</h2></li>
						<li class="profileEdit"><a href="${pageContext.request.contextPath}/profileEdit" class="button small">프로필 편집</a></li>
						<li class="boardAdd"><a href="${pageContext.request.contextPath}/boardAdd" class="fa fa-plus-square b_add" title="게시물 추가 "></a></li>
					</ul>
					<ul class="actions">
						<li><p>게시글 <strong>${fn:length(list)}</strong></p></li>
						<li class="follower_list"><p> <a href="#followerModal">팔로워</a>  <strong>${fn:length(follower_list)}</strong></p></li>
						<li class="following_list"><p> <a href="#followingModal">팔로잉</a> <strong>${fn:length(following_list)}</strong></p></li>
					</ul>
					<p>${user.status_message}</p>
				</div>
			</div>
		</header>

		<nav id="nav2" class="">
         <ul>
            <li><a href="${pageContext.request.contextPath}/myTimeLine" class="active">타임라인</a></li>
            <li><a href="${pageContext.request.contextPath}/myGallery">갤러리</a></li>
         </ul>
      </nav>

      <!-- Main -->
      <div id="main">
         <!-- Content -->
			<c:forEach var="b" items="${list}">
						<section id="content" class="main">
				<div class="box alt">
					<div class="col-12">
						<span class="image fit"><img
							src="${pageContext.request.contextPath}/resources/images/${b.picture}" alt=""></span> 
						<div id = why>
							<!-- 좋아요 상태(게시물에 나의 좋아요가 있는지 )-->
							<input type="hidden" id= "likey_check" value="${b.lid}">
						</div>
						
						<a  class="${b.lid=='0'?'icon alt fa-heart-o heart':'icon alt fa-heart heart'}" 
								style="cursor : pointer;"><span class="label" >Twitter</span></a>
						<input type="hidden" value="${b.board_id}">
						<input type="hidden" value="${b.id_}">
						<input type="hidden" id="lcount"value="${b.likey_count}">
						<a href="#" class="icon alt fa-comment-o"><span class="label">Twitter</span></a>
								
						<h4 class="likey">
							<a href="#likeyModal" class="likey_list" value="${b.board_id}">
							<b id="likeyCount">
								<!-- 좋아요 1개이상부터 표시  -->
								<c:if test="${b.likey_count >0}">
									좋아요 ${b.likey_count}개
								</c:if></b></a>
								
								<!-- 드롭다운 -->
							 	<div class="col-3 dropdown" style="float:right; cursor : pointer;">
								      <i class="fa fa-ellipsis-v"></i>
								    <div class="dropdown-content">
								      <a  href ="#boardUpdateModal" class="b_update" value="${b.board_id}" >수정 </a>
								      <a href="#" class="b_del" value="${b.board_id}">삭제 </a>
									</div>
								</div>
						</h4>
						<dl class="alt">
							<dt><a href="#" rel="${b.id_}">${b.id_}</a></dt>
							<dd id="test" value="${b.content}">${b.content} <span>${b.b_reg_date}</span></dd>
						</dl>
						<hr>
						
							<dl class="alt">
								<!-- 댓글 출력 -->
								<c:forEach var="c" items="${comment}">
									<c:if test="${c.board_id==b.board_id}">
											<dt><a href="#" class="userGallery">${c.id_}</a></dt>
											<dd>${c.comment_content}
												<span>${c.c_reg_date}</span> 
												<span class="comment_delete" value="${c.comment_id}">&times;</span>
											</dd>
									</c:if>
								</c:forEach> 
							</dl>
						
							<!-- 댓글 입력  -->
							<form action="${pageContext.request.contextPath}/myTimeLine/insert" method="post">
								<input type="text" name="comment_content" id="comment_content" value=""
									placeholder="댓글을 입력하세요 ">
								<input type="hidden" id="id_" name="id_" value="${b.id_}">
								<input type="hidden" id="board_id" name="board_id" value="${b.board_id}">
							</form>
					</div>
				</div>
			</section>
			</c:forEach> 
			
				<!-- 좋아요 모달  -->
				<div class="modal fade" id="likeyModal" role="dialog">
				<div class="modal-dialog">
					<div class="row-inline">
						<h5 class="center" style=" height: 25px; line-height: 25px; margin-top:0.5em; font-weight: bold;">
							좋아요  <span class="close right">&times;&ensp;</span>
						</h5>
					</div>
					<hr style="border-color: rgb(255, 255, 255); ">
					<div class="row" id="lol" style="padding: 10px; margin: 1em;">
					
					</div>
				</div>
				</div>

				
				<!-- 팔로워 모달 -->
				<div class="modal fade" id="followerModal" role="dialog">
				<div class="modal-dialog">
					<div class="row-inline">
						<h5 class="center" style=" height: 25px; line-height: 25px; margin-top:0.5em; font-weight: bold;">
							팔로워 <span class="close right">&times;&ensp;</span>
						</h5>
					</div>
					<hr style="border-color: rgb(255, 255, 255); ">
					<div class="row" style="padding: 10px; margin: 1em;">
						<c:forEach var="fl" items="${follower_list}">
							<div class="spotlight col-6" style="padding : 0;">
									<span class="image">
									<img src="${pageContext.request.contextPath}/resources/images/${fl.profile_}"
											class="img-circle" alt="">
									</span>
									<div class="content">
										<h3><a href="#" class="userGallery">${fl.send_user}</a></h3>
									</div>
							</div>
							<div class="col-5">
								<c:forEach var="fc" items="${followCheck2}">
									<c:if test="${fc.key==fl.send_user}">
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
					
				<!-- 팔로잉  모달 -->
			 	<div class="modal fade" id="followingModal" role="dialog">
				<div class="modal-dialog">
					<div class="row-inline">
						<h5 class="center" style=" height: 25px; line-height: 25px; margin-top:0.5em; font-weight: bold;">
							팔로잉  <span class="close right">&times;&ensp;</span>
						</h5>
					</div>
					<hr style="border-color: rgb(255, 255, 255); ">
					<div class="row" style="padding: 10px; margin: 1em;">
						<c:forEach var="fw" items="${following_list}">
							<div class="spotlight col-6" style="padding : 0;">
									<span class="image">
									<img src="${pageContext.request.contextPath}/resources/images/${fw.profile_}"
											class="img-circle" alt="">
									</span>
							
									<div class="content">
										<h3><a href="#" class="userGallery">${fw.receive_user}</a></h3>
									</div>
							</div>
							<div class="col-5">
									<c:forEach var="fc" items="${followCheck2}">
									<c:if test="${fc.key==fw.receive_user}">
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
				
				<!-- 게시글 수정  모달 -->				
				<div class="modal fade" id="boardUpdateModal" role="dialog">
					<div class="modal-dialog">
								<h5 class="center" style="height: 25px; line-height: 25px; margin-top:0.5em; font-weight: bold;">
							게시물 수정   <span class="close right">&times;&ensp;</span>
						</h5>

						<div class="row" style="padding: 10px; margin: 1em;">
							<div class="col-12">
								<span class="image fit"><img class="modal-content" alt=""></span>
							</div>
							<div class="col-12">
							<form action="${pageContext.request.contextPath}/myTimeLine/myBoardUpdate" method="post">
								<div class="">
									<textarea  style="overflow-x: hidden; 
												height: 220px; background-color:white; margin-bottom:1em;" 
											id="contentUpdate"name="content"></textarea>
									<input type="hidden" id="b-hidden" name="board_id" value="">
								</div>
								<div align="right">
								<button class="primary" type="submit">완료 </button>
								</div>
							</form>
							</div>

						</div>
					</div>
				</div>
      
      </div> <!-- main -->

      <!-- Footer -->
      <footer id="footer">
         <p class="copyright">
            &copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.
         </p>
      </footer>
					
</div> <!-- wrapper -->

<script>
      $(document).ready(function() {
    	  	
	        var followerModal = $("#followerModal");
	        var followingModal = $("#followingModal");
	        var likeyModal = $("#likeyModal");
	        var boardUpdateModal = $("#boardUpdateModal");
	        
	        followerModal.hide();
	        followingModal.hide();
	        likeyModal.hide();
	        boardUpdateModal.hide();

			 //follwer 모달 
	         $(".follower_list").on("click", function() {
	        	 followerModal.show(); 
	         });
	         
	         
			 //following 모달 
	         $(".following_list").on("click", function() {
	        	 followingModal.show();  
	         });
	         
	         
	         //likey 모달 
			 $(".likey_list").on("click",function(){
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
	        	 followerModal.hide();
	        	 followingModal.hide();
	        	 likeyModal.hide();
	        	 boardUpdateModal.hide();
	         });

	        //엔터키로 댓글 입력  
            $('.submit_on_enter').keydown(function(event) {
              // enter has keyCode = 13, change it if you want to use another button
              if (event.keyCode == 13) {
                 this.form.submit();
                 return false;
              }
            });
	         
	         //댓글 삭제
	         $(".comment_delete").on("click", function(){
	        	var cid=$(this).attr("value");
	        	window.location.assign("${pageContext.request.contextPath}/myTimeLine/del?comment_id="+cid);
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
						
					 ,error:function(error){
					        console.log("fail");
				       }
					 
					 })//ajax
	         });
	         
	         
	         //게시물 수정 
	         $(".b_update").on("click", function(){
	        	 boardUpdateModal.show();  
	        	 
	        	 var tmp = $(this).parent().parent().parent().parent().children().eq(0);
	        	 //이미지 경로 
	        	 var pic = tmp.children().eq(0).attr('src');
	        	 //이미지 경로
	        	 //모달에 이미지불러오기 
	        	 boardUpdateModal.find(".modal-content").attr("src", pic); 
	        	 
	        	 var board_id= $(this).attr('value');
		         var content =$(this).parent().parent().parent().next().children().eq(1).attr('value');
		         boardUpdateModal.find("#contentUpdate").text(content);
		         boardUpdateModal.find("#b-hidden").val(board_id);
	         });
	         
	         //게시물 삭제 
	         $(".b_del").on("click", function(){
	        	 if(confirm(" 게시물을 삭제하시겠습니까?")==true){
	        		 var board_id = $(this).attr('value');
	        		 window.location.assign("${pageContext.request.contextPath}/myTimeLine/myBoardDel?board_id="+board_id);
	        	 }else{
	        		 return;
	        	 }
	         });

	         //특정 유저페이지로 이동 
	         $(".userGallery").on("click", function(){
	        	 var id_ = $(this).text();
	        	window.location.assign("${pageContext.request.contextPath}/userGallery?id_="+id_);
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

   <!-- Scripts -->
      <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
      <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
   </body>
</html>
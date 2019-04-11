<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<!DOCTYPE HTML>
<!--
   Stellar by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>

<head>
<title>inssagram</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<script src='https://www.google.com/recaptcha/api.js'></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>


<body class="is-preload">

   <!-- Wrapper -->
   <div id="wrapper">

      <!-- Header -->
      <!--                <header id="header" class="alt">
                  <span class="logo"><img src="images/logo.svg" alt="" /></span>
                  <h1>Stellar</h1>
                  <p>Just another free, fully responsive site template<br />
                  built by <a href="https://twitter.com/ajlkn">@ajlkn</a> for <a href="https://html5up.net">HTML5 UP</a>.</p>
               </header> -->
      <p></p>
      <!-- Main -->
      <div id="main">

         <!-- Content -->
         <section id="content" class="main" style="padding: 30px;">
            <!-- Form -->
            <section>
               <span class="logo"><img src="${pageContext.request.contextPath}/resources/images/KakaoTalk_20190110_174629325.png"></span>
               <div style="font-size: 70%;">
                  <p>
                     <b>ID / PW 찾기</b>
                  </p>
                  <p>아이디를 입력하세요.</p>
               </div>
               <form id="form1" method="post" action="${pageContext.request.contextPath}/find/findPw">
                  <div class="row gtr-uniform">
                     <div class="col-12 col-12-xsmall">
                        <input type="text" name="id_" id="id_" value=""
                           placeholder="id" required>
                     </div>
                     <div class="col-12 col-12-xsmall" style="font-size: 100%">
                        <input type="submit" value="비밀번호 찾기 " onclick="test1(); return false;"class="primary button">
                     </div>
					
                     <div class="col-12 col-12-xsmall find" style="font-size: 100%; text-align: center;">
                     
                     </div>
                  </div>
               </form>
            </section>
         </section>
      </div>

      <!-- Footer -->
      <footer id="footer">
         <p></p>
         <p></p>
         <p></p>
         <p></p>
      </footer>
   </div>
 <script>
 
	 //비밀번호 전송을 위한 임시 이메일 변수 
	 var e = "";
 	 var id_ ="";
 	function test1(){
	 		id_ = $("#id_").val();
 		var formData = $("#form1").serialize();
 		
        $.ajax({
            cache : false,
            url : "${pageContext.request.contextPath}/find/findPw", 
            type : 'POST', 
            data : formData, 
            success : function(data) {
            	console.log("success");
            	var txt="";
            	var str = JSON.stringify(data);
            	var temp = JSON.parse(str);
            	var email = temp.email;
            	e = email;
            	
            	if(email!=null){
            	   	txt += id_+"님의 이메일 주소 " + "<b style='font-size:small;'>"+email+"</b><br><br>";
    	        	txt += "<input type='button' class='tempPw' value='이메일주소로 비밀번호 전송' style='font-size:small;'>";
        	    	$(".find").html(txt);
        	    	
            	}else{
        	      	txt += "아이디가 존재하지 않습니다.<br>";
    	        	txt += "<a href='${pageContext.request.contextPath}/findId' style='color:blue;'>아이디 찾기</a>";
        	    	$(".find").html(txt);
            	}
            }, // success 
    
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
        }); // $.ajax */
 	}
 	
    $(document).ready(function() {
    	//이메일로 비밀번호 보내기  
    	$(document).on("click", ".tempPw", function(){
    		window.location.assign("${pageContext.request.contextPath}/find/findPw/sendPw?id_="+id_+"&email="+e);
    	});
    });
  </script>
   <!-- Scripts -->
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
   <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
</body>
<style>
html {
   box-sizing: border-box;
   height: 100%;
}

.button {
   font-size: 50%;
   width: 100%;
   height: 50%;
}

#main {
   width: 40%;
   height: 80%;
   display: block;
   margin-left: auto;
   margin-right: auto;
   text-align: center;
}

#content {
   display: inline-block;
   display: block;
   margin-left: 30px;
   margin-right: 30px;
   text-align: center;
   padding-top: 30px;
   padding-right: 30px;
   padding-left: 30px;
}

input[type="submit"], input[type="reset"], input[type="button"], button,
   .button {
   -moz-appearance: none;
   -webkit-appearance: none;
   -ms-appearance: none;
   appearance: none;
   -moz-transition: background-color 0.2s ease-in-out, color 0.2s
      ease-in-out;
   -webkit-transition: background-color 0.2s ease-in-out, color 0.2s
      ease-in-out;
   -ms-transition: background-color 0.2s ease-in-out, color 0.2s
      ease-in-out;
   transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
   border-radius: 8px;
   border: 0;
   cursor: pointer;
   display: inline-block;
   font-weight: 200;
   height: 4.75em;
   line-height: 2.75em;
   min-width: 9.25em;
   padding: 0 1.5em;
   text-align: center;
   text-decoration: none;
   white-space: nowrap;
}

input[type="text"], input[type="password"], input[type="email"], select,
   textarea {
   -moz-appearance: none;
   -webkit-appearance: none;
   -ms-appearance: none;
   appearance: none;
   border-radius: 5px;
   border: solid 1px;
   color: inherit;
   display: block;
   outline: 0;
   padding: 0 1em;
   text-decoration: none;
   width: 100%;
   height: 160%;
}
</style>
</html>
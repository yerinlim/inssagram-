<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE HTML>
<html>
<head>
<title>inssagram</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
<script src='https://www.google.com/recaptcha/api.js'></script>

<style>
html {
   box-sizing: border-box;
   height: 100%;
}
.button{
   font-size: 50%;
	width: 100%;
	height: 50%;
   }
#main {
   width: 50%; height: 70%;
       display: block;
    margin-left: auto;
    margin-right: auto;
   text-align: center; 

}
 #content{ 
 display: inline-block; 
        display: block;
    margin-left:  30px;
    margin-right: 30px;
   text-align: center; 
   padding-top: 30px;
    padding-right: 30px;
    padding-left: 30px;
    
 }
 
input[type="submit"], input[type="reset"], input[type="button"], button, .button {
    -moz-appearance: none;
    -webkit-appearance: none;
    -ms-appearance: none;
    appearance: none;
    -moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
    -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
    -ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
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

input[type="text"], input[type="password"], input[type="email"], select, textarea {
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
#footer {
    padding: 0;
    display: block;
    margin: 0 0 3em 0;
    width: 100%;
    line-height: 100%;
    text-align: center;
    padding-top: 5%;
}
 #wrapper {
    width: 64em;
    max-width: calc(100% - 4em);
    margin: 0 auto;
    padding-bottom: 2.4%;
    
} 
</style> 
</head>
<body class="is-preload">

      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Header -->
 					<header id="header" class="alt">
						<span class="logo"><img src="images/logo.svg" alt="" /></span>
					</header>
			<p></p>
            <!-- Main -->
               <div id="main" >

                  <!-- Content -->
                     <section id="content" class="main" style="padding:30px;">
                        <!-- Form -->
                           <section>
                           <img src="${pageContext.request.contextPath}/resources/images/KakaoTalk_20190110_174629325.png" width="40%">
                              <div style="font-size:large;">
                              	<p>회원님의 이메일로 비밀번호 전송이 완료되었습니다. </p>
                              </div>
                              <input type="button" class="primary" onclick="location.href='${pageContext.request.contextPath}/login'" value="로그인 하러 가기 ">
                           </section>
                     </section>

               </div>

				<!-- Footer -->
					

         </div>
<footer id="footer">
</footer>

      <!-- Scripts -->
         <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
         <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
         <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
         <script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
         <script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
         <script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
         <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

   
</body>
</html>
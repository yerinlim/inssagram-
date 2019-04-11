<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>inssagram</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
      <%-- <noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript> --%>
<style>
html {
   box-sizing: border-box;
   height: 100%;
}
.button{
   font-size: 50%;
   width: 100%;
   height: 40%;
   }
#main {
   width: 40%; 
   height: 80%;
    display: block;
    margin-left: auto;
    margin-right: auto;
   text-align: center; 

}
 #content{ 
 display: inline-block; 
        display: block;
    margin-left: 30px;
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
</style> 
   </head>
   

<body class="is-preload">

      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Header -->
	<p> </p>

            <!-- Main -->
               <div id="main">

                  <!-- Content -->
                     <section id="content" class="main" style="padding:30px;">
                        <!-- Form -->
                           <section>
                          <img src="${pageContext.request.contextPath}/resources/images/KakaoTalk_20190110_174629325.png">
                          <p></p>
                              <form method="post" action="${pageContext.request.contextPath}/user/login">
                                 <div class="row gtr-uniform">
                                    <div class="col-12 col-12-xsmall">
                                       <input type="text" name="id_" id="demo-id" value="" placeholder="id">
                                    </div>
                                    <div class="col-12 col-12-xsmall">
                                       <input type="password" name="pw_" id="demo-pw" value="" placeholder="password">
                                    </div>
                                    <div class="col-12 col-12-xsmall">
                                    		<b style="color: red; font-size:small">아이디 또는 비밀번호를 다시확인하세요.</b>
                                    </div>
                                    <div class="col-12 col-12-xsmall">
                                          <input type="submit" value="로그인" class="primary button">
                                    </div>
                                    <div class="col-12 col-12-xsmall">
                                    	<a href="${pageContext.request.contextPath}/find" style="font-size:70%">
                                    		비밀번호를 잊으셨나요?
                                    	</a>
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
<p></p>
<p></p>
<p></p>
<p></p>
<p></p>
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

   
</body>
</html>
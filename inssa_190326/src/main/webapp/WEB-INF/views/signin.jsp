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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
   width: 30%; height: 30%;
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
<!-- 					<header id="header" class="alt">
						<span class="logo"><img src="images/logo.svg" alt="" /></span>
						<h1>Stellar</h1>
						<p>Just another free, fully responsive site template<br />
						built by <a href="https://twitter.com/ajlkn">@ajlkn</a> for <a href="https://html5up.net">HTML5 UP</a>.</p>
					</header> -->
			<p></p>
            <!-- Main -->
               <div id="main">
                  <!-- Content -->
                     <section id="content" class="main" style="padding:10%;">
                        <!-- Form -->
                           <section>
                           <img src="${pageContext.request.contextPath}/resources/images/KakaoTalk_20190110_174629325.png" width="60%">
                              <div style="font-size:70%;">
                              	<p>친구들의 사진과 동영상 보려면 가입하세요</p>
                              </div>
                              <form method="post" action="${pageContext.request.contextPath}/signin/userAdd">
                                 <div class="row gtr-uniform">
                                    <div class="col-12 col-12-xsmall">
                                       <input type="text" name="id_" id="id_" value="" placeholder="id" 
                                       onkeyup="idcheck();" required>
                                    </div>
                                     <div class="col-12 col-12-xsmall check">
                                     		<span id="confirmId" style="font-size:small;"></span>
                                    </div>
                                    <div class="col-12 col-12-xsmall">
                                       <input type="email" name="email" id="demo-pw" value="" placeholder="email" required>
                                    </div>
                                    
                                    <div class="col-12 col-12-xsmall">
                                       <input type="password" name="pw_" id="pw" value="" placeholder="password" 
                                       				onkeyup="passwordCheckFunction();" required>
                                    </div>
                                    <div class="col-12 col-12-xsmall">
                                       <input type="password" name="pwcheck" id="pwcheck" value="" placeholder="check password" 
                                       				onkeyup="passwordCheckFunction();" required>
                                    </div>
                                    <div class="col-12 confirm">
                                     	<span id="confirmMsg" style="font-size:small;"></span>
                                    </div>
                                    <div class="col-12 col-12-xsmall" style="font-size: 100%">
                                          <input type="submit" id="signin" value="회원가입" class="primary button">
                                    </div>
                                 </div>
                              </form>
                           </section>
                     </section>
                     

				
               </div>
					

         </div>
<!-- Footer -->
<footer id="footer">
</footer>
<script>
//패스워드 일치여부 
function passwordCheckFunction(){
	 var pw = $('#content #pw').val();
	 var pwcheck = $('#content #pwcheck').val();
		var confrimMsg = document.getElementById('confirmMsg');		
		var correctColor = "#00ff00";	
		var wrongColor ="#ff0000";	
		
		if(pw==pwcheck){
			confirmMsg.style.color = correctColor;
			confirmMsg.innerHTML ="비밀번호가 일치합니다.";
			$('#content #signin').attr('type', 'submit');
		}else if(pwcheck==""){
		}else{
			confirmMsg.style.color = wrongColor;
			confirmMsg.innerHTML ="비밀번호가 일치하지 않습니다.";
			$('#content #signin').css('type', 'button');
			
		}
	}

//아이디 중복검사 
function idcheck(){
		var id_= $('#id_').val();
        var txt="";
		var text="";
		
        $.ajax({
            cache : false,
            url : "${pageContext.request.contextPath}/signin/idCheck", 
            type : 'POST', 
            data : {id_:id_}, 
            success : function(data) {
            	console.log("success");
            	var str = JSON.stringify(data);
            	var temp = JSON.parse(str);
            	var id_ = temp.id_;
            	
            	txt=id_+"는 이미 사용중인 아이디입니다.";
    			$("#confirmId").html(txt);
    			$('#content #signin').attr('type', 'button');
//    			$('#confirmId').css('color', 'red');
            }, // success 
    
            error : function(error) {
            	if(id_!=text){
	            	txt=id_+"는 사용가능한 아이디입니다.";
    				$('#content #signin').attr('type', 'submit');
            	}else{
	            	txt=id_+"아이디를 입력해주세요.";
            	}
            	
    			$("#confirmId").html(txt);
            }
        }); // $.ajax */
		
		
		
	}
	$(document).ready(function() {
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
</html>
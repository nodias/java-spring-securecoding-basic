<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script src="../js/webtoolkit.base64.js"></script>
<script src="../js/jquery-1.7.1.js"></script>
<style type="text/css">
	#box2 {
		float: left;
		width: 20%;
		padding: 10px;
		display: inline;
		border: 1px solid orange;
		margin-bottom:10px;	
	}
	
	#box3 {
		float: right;
		width: 75%;
		padding: 10px;
		display: inline;
		border: 1px solid white;
		margin-bottom:10px;	
	}
	
   .hint {
		font-size: 22px;
		font-weight: bold;
	}
	

	#side-title
	{
	    background-color: #eee;
	    font-weight: bold;
	    width: 200px;
	    height: 30px;
	    font-family:  "맑은고딕" ,"sans-serif";
	    color: #444;
	    font-size: 16px; 
 	    text-align: center; 
 	    padding-top: 10px;
	    margin: 0;
	}
	
	#select-test
	{
	    background-color: #deb887;
	    width: 200px;
	    height: 30px;
	    font-weight: bold;
	    font-family:  "맑은고딕" ,"sans-serif";
	    color: #ffffff;
	    font-size: 16pt; 
 	    text-align: center; 
        padding-top: 10px;
	    margin: 0;
	}
	
	#test-result
	{
	    background-color: #bc8f8f;
	    width: 200px;
	    height: 30px;
	    font-weight: bold;
	    font-family:  "맑은고딕" ,"sans-serif";
	    color: #ffffff;
	    font-size: 16pt; 
 	    text-align: center; 
 	    padding-top: 10px;
	    margin: 0;
	}
	
</style>
<script type="text/javascript">
$(document).ready(function(){
    $("#labs div").hide();
    $("#div${param.no}").show();
  
    $('.menu').css('cursor','pointer').click(function() {
       /*
      $('#result').html('');
      $('.hint').hide();
      $('#div'+$(this).attr('no')).show();
      */         
      location.href = "/openeg/test/esapi_test.do?no="+$(this).attr('no');
    });
  });
</script>
</head>
<body>
<div id="container">
		
	<h1>
		<jsp:include page="../board/header.jsp"/>  
	</h1>

	<div id="content-container">
	<div id="content" style="width:100%;">
		<div id="box2">
			<p id="side-title">ESAPI 테스트</p>
			<ul id="lists">
				<li class="menu" no="1">인코딩</li>
				<li class="menu" no="2">암호화</li>
				<li class="menu" no="3">SQL 인젝션</li>
				<li class="menu" no="4">XSS</li>
				<li class="menu" no="5">회원관리</li>
				<li class="menu" no="6">Validation</li>
				<li class="menu" no="7">Redirect</li>			
			</ul>
			<br/><br/><br/><br/><br/><br/>
		</div>

		<div id="box3">
     				
			<div id="labs">
  
           <div class="hint"  id="div0">
       				<pre class="showLabs">
<font color="indigo"  size="6">ESAPI 테스트</font><br/>
<font color="#aa66ff" size="4">왼쪽 메뉴를 선택하세요 !!</font>
       				</pre>
     			</div>
     			
 <div class="hint" id="div1">

     <p id="select-test">인코딩 테스트</p>
     <hr/>
     <form id="form1"  action="esapi_encode_test.do">
         <pre class="showLabs">

인코딩할 문자열: <input type="text" name="data"  id="data1" size="50"> <input type="button"  id="button1" value="실행" > 
<br/>    
 <input type="radio"  name="type" value="0" checked="checked"> BASE64 인코딩 <input type="radio"  name="type" value="1"> BASE64 디코딩
          </pre>
     </form>
 </div>
 
 <div class="hint" id="div2">
     <p id="select-test">암호화 테스트</p>
     <hr/>
       <form action="esapi_encrypt_test.do"  id="form2">
       <pre>

 암호화할 문자열: <input type="text" name="data"  id="data2" size="50">  <input type="button" id="button2" value="실행"  >

 <input type="radio"  name="type" value="0" checked="checked"> SHA-256 암호화   
 <input type="radio"  name="type" value="1"> AES 암호화  <input type="radio"  name="type" value="2"> AES 복호화
          </pre>
     </form>
  </div>

   <div class="hint" id="div3">
     <p id="select-test">SQL 인젝션 테스트</p>
     <hr/>
     <form action="esapi_sql_test.do"  id="form8">
          <pre>

 ID: <input type="text" name="id"  id="data8"> PASSWORD: <input type="password" name="passwd"  id="data8"> <input type="button"  id="button8"  value="로그인"  >      
          </pre>  
       
     </form>
  </div>
  
 <div class="hint" id="div4">
     <p id="select-test">XSS 테스트</p>
     <hr/>
     <form action="esapi_xss_test.do"  id="form3">
          <pre>

문자열입력: <input type="text" name="data"  id="data3" size="50"> <input type="button"   id="button3"  value="실행"  >
 <br/><br/>     

          </pre>
     </form>
  </div>

  <div class="hint" id="div5">
     <p id="select-test">회원관리</p>
     <hr/>
     <form action="esapi_authenticator_test.do"  id="form4">
         <pre>
[STEP 1] 회원가입    <br/>
          ID: <input type="text" name="id"  id="data4"> PASSWORD: <input type="password" name="passwd"  id="data4"> <input type="button"  id="button4"  value="회원가입"  >
          </pre>
     </form>
 
  
   
     <form action="esapi_login_test.do"  id="form5">
          <pre>
[STEP 2] 로그인   <br/>
          ID: <input type="text" name="id"  id="data5"> PASSWORD: <input type="password" name="passwd"  id="data5"> <input type="button"  id="button5"  value="로그인"  >     
          </pre>   
     </form>


      <form action="esapi_logout_test.do"  id="form9">
          <pre>
[STEP 3] 로그아웃  <input type="button"  id="button9"  value="로그아웃"  >      
          </pre>  
     </form>
  </div>
    
   <div class="hint" id="div6">
       <p id="select-test"> Validation 테스트</p>
       <hr/>
       <form action="esapi_validation_test.do"  id="form6">
          <pre>

문자열입력: <input type="text" name="data"  id="data8" size="50"> <input type="button" id="button6" value="실행"  >
          </pre>
        </form>
    </div>

    <div class="hint" id="div7">
       <p id="select-test"> Redirect 테스트</p>
       <hr/>
       <form action="esapi_redirect_test.do"  id="form7">
          <pre>

이동 페이지 선택: <select  name="data"  id="data7">
               <option value="http://www.naver.com">--- 네이버 ---</option>
               <option value="http://www.nate.com">--- 네이트 ---</option>
               <option value="http://www.google.com">--- 구글 ---</option>
              </select> <input type="button" id="button7" value="이동"  >
          </pre>
        </form>
    </div>

</div>
<br/>
     <p id="test-result">실행결과</p>
     <hr/>
     <div class="result"  id="result"></div>
</div>

		<div id="footer">
			 <jsp:include page="../board/footer.jsp"/> 
		</div>

</div>
</div>
</div>
		


<script type="text/javascript"> 
 $( 
   function() { 

 	 $('#button1').click( 
    	     function() { 
    	    	 var formData = $("#form1").serializeArray();  
	    	     var URL = $("#form1").attr("action");  
	    	     $('#result').empty(); 
	    	     $.post(URL,  
 	    			   formData,   
	    			       function(data, textStatus, jqXHR)     {        	    		             
    	    		           $('#result').append(data); 
    	    		        } 
     	    	 ).fail(function(jqXHR, textStatus, errorThrown) {   
    	    		    	   $('#result').append("요청처리 실패"); 
    	    	  }); 
    }); 

 	 $('#button2').click( 
    	     function() { 
    	    	 var formData = $("#form2").serializeArray();  
	    	     var URL = $("#form2").attr("action");  
	    	     $('#result').empty(); 
	    	     $.post(URL,  
 	    			   formData,   
	    			       function(data, textStatus, jqXHR)     {  
	    	        	       var uri_dec = decodeURIComponent(data);
    	    		           $('#result').append(uri_dec); 
    	    		        } 
     	    	 ).fail(function(jqXHR, textStatus, errorThrown) {   
    	    		    	   $('#result').append("요청처리 실패"); 
    	    	  }); 
    }); 
 	 
 	$('#button3').click( 
    	     function() { 
    	    	 var formData = $("#form3").serializeArray();  
	    	     var URL = $("#form3").attr("action");  
	    	     $('#result').empty(); 
	    	     $.post(URL,  
 	    			   formData,   
	    			       function(data, textStatus, jqXHR)     {        	    		             
    	    		           $('#result').append(data); 
    	    		        } 
     	    	 ).fail(function(jqXHR, textStatus, errorThrown) {   
    	    		    	   $('#result').append("요청처리 실패"); 
    	    	  }); 
    }); 
 	
 	$('#button4').click( 
   	     function() { 
   	    	 var formData = $("#form4").serializeArray();  
	    	     var URL = $("#form4").attr("action");  
	    	     $('#result').empty(); 
	    	     $.post(URL,  
	    			   formData,   
	    			       function(data, textStatus, jqXHR)     {        	    		             
   	    		           $('#result').append(data); 
   	    		        } 
    	    	 ).fail(function(jqXHR, textStatus, errorThrown) {   
   	    		    	   $('#result').append("요청처리 실패"); 
   	    	  }); 
   }); 
 	
 	$('#button5').click( 
   	     function() { 
   	    	 var formData = $("#form5").serializeArray();  
	    	 var URL = $("#form5").attr("action");  
	    	 $('#result').empty(); 
	    	 $.post(URL,  
	    			   formData,   
	    			       function(data, textStatus, jqXHR)     {        	    		             
   	    		           $('#result').append(data); 
   	    		        } 
    	    	 ).fail(function(jqXHR, textStatus, errorThrown) {   
   	    		    	   $('#result').append("요청처리 실패"); 
   	    	  }); 
   }); 
 	
   $('#button6').click( 
 		   function() { 
 		   	    	 var formData = $("#form6").serializeArray();  
 			    	 var URL = $("#form6 ").attr("action");  
 			    	 $('#result').empty(); 
 			    	 $.post(URL,formData,   
 			    			function(data, textStatus, jqXHR)     {        	    		             
 		   	    		           $('#result').append(data); 
 		   	    		    } 
 		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
 		   	    		    	   $('#result').append("요청처리 실패"); 
 		   	    	         }); 
 		   });
 	
 	$('#button7').click( 
 		   function() { 
 		   	    	 var formData = $("#form7").serializeArray();  
 			    	 var URL = $("#form7").attr("action");  
 			    	 $('#result').empty(); 
 			    	 $.post(URL,formData,   
 			    			function(data, textStatus, jqXHR)     {        	    		             
 		   	    		           $('#result').append(data); 
 		   	    		    } 
 		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
 		   	    		    	   $('#result').append("요청처리 실패"); 
 		   	    	         }); 
 		   });
 	
 	$('#button8').click( 
	   function() { 
	   	    	 var formData = $("#form8").serializeArray();  
		    	 var URL = $("#form8").attr("action");  
		    	 $('#result').empty(); 
		    	 $.post(URL,formData,   
		    			function(data, textStatus, jqXHR)     {        	    		             
	   	    		           $('#result').append(data); 
	   	    		    } 
	    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
	   	    		    	   $('#result').append("요청처리 실패"); 
	   	    	         }); 
	   });

 	$('#button9').click( 
 		   function() { 
 			    	 var URL = $("#form9").attr("action");  
 			    	 $('#result').empty(); 
 			    	 $.get(URL,
 			    			function(data, textStatus, jqXHR)     {        	    		             
 		   	    		           $('#result').append(data); 
 		   	    		    } 
 		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
 		   	    		    	   $('#result').append("요청처리 실패"); 
 		   	    	         }); 
 		   });
 	
});

    	    	
</script>
 <!--  	var uri = "http://w3schools.com/my test.asp?name=st책le&car=saab"; -->
 <!--  	var uri_enc = encodeURIComponent(uri); -->
 <!--  	var uri_dec = decodeURIComponent(uri_enc); -->
 <!--  	var res = uri_enc + "<br>" + uri_dec; -->

</body>
</html>











<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	
	.comment {
	    font-size: 12px;
	   	color: #555;
	   	margin: 1px;
		padding: 1px;
		font-weight: normal;
	}
	
	.result{
		font-size: 16px;
		color: red;
		font-weight: bold;
		margin-top:10px;	
		margin-bottom:10px;	
	}
	
	.hint {
		font-size: 22px;
		font-weight: bold;
	}
	
	#comment
	{
	   color: #666;
	   font-family:  "맑은고딕" ,"sans-serif";
	   font-size: 11pt;
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
	    font-family:  "맑은고딕" , "sans-serif";
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
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script src="../js/webtoolkit.base64.js"></script>
<script src="../js/jquery-1.7.1.js"></script>

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
	         location.href = "/openeg/test/test.do?no="+$(this).attr('no');
	       });
	     });
	 function postPopUp(formName){ 
		 fm=document.getElementById(formName);
		 window.open("","viewer","width=1000, height=700, menubar=no,status=yes,scrollbars=no");
	     fm.action="forward_test.do";
	     fm.target="viewer";
	     fm.method="post";
	     fm.submit();
	}
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
			<p id="side-title">시큐어코딩테스트</p>
			<ul id="lists">
				<li class="menu" no="1">인코딩</li>
				<li class="menu" no="2">정규식</li>
				<li class="menu" no="3" >SQL 인젝션</li>
				<li class="menu" no="4" >명령어 인젝션</li>
				<li class="menu" no="5" >XPath 인젝션</li>
				<li class="menu" no="6" >XSS</li>
				<li class="menu" no="15" >CSRF</li>
				<li class="menu" no="7" >암호화</li>
				<li class="menu" no="8" >오픈리다이렉트</li>
				<li class="menu" no="9" >보안쿠키</li>
				<li class="menu" no="10" >인증</li>
				<li class="menu" no="11" >HTTP응답분할</li>
				<li class="menu" no="12" >접근제어</li>
				<li class="menu" no="13" >예외처리</li>
				<li class="menu" no="14" >정수오버플로우</li>
				<li class="menu" no="16" >TOCTOU</li>
				<li class="menu" no="17" >세션간의 정보노출</li>
				<li class="menu" no="18" >반복문제어 부재</li>
				<li class="menu" no="19" >널포인트 역참조</li>
				<li class="menu" no="30" >캡슐화 위배</li>
				<li class="menu" no="31" >중요정보 노출</li>
			</ul>
		</div>
    
    	<div id="box3">
     		 
     		<div id="labs">
     
     			<div class="hint"  id="div0">
       				<pre class="showLabs">
<font color="#555"  size="6">시큐어코딩테스트</font><br/>
<font color="blue" size="4">왼쪽 메뉴를 선택하세요 !!</font>
       				</pre>
     			</div>
     
     
    <div class="hint"  id="div1">
        <p id="select-test">인코딩 테스트</p>
        <hr/>
        <p id="comment">URL인코딩 테스트를 위해 입력값을 10&b=20을 입력합니다.<br/>
                                      HTML인코딩 테스트를 위해 입력값을 &lt;script&gt;alert(1);&lt;script&gt;를 입력합니다.<br/>
                                      BASE64인코딩 테스트를 위해 입력값을 10 이라고 입력합니다.</p>
       <form id="form1"  action="encode_test.do">
       <pre class="showLabs">

테스트스트링:   <input type="text" name="data"  id="data1" size="40" placeholder="<script>alert('test');</script>"> <input type="button"  id="button1" value="실행" > 

   <input type="radio"  name="type"  value="0" > BASE64 인코딩     
   <input type="radio"  name="type"  value="1" > BASE64 디코딩
   <input type="radio"  name="type"  value="2" > URL 인코딩        
   <input type="radio"  name="type"  value="3" > URL 디코딩
   <input type="radio"  name="type"  value="4"  checked="checked"> HTML 인코딩
   <input type="radio"  name="type"  value="5" > HTML 디코딩
   <br/>
       </pre>
     </form>
     </div>
     
 <div class="hint"  id="div2">
     <p id="select-test">정규식 테스트</p>
     <hr/>
     <p id="comment">정규식을 이용하여 입력값을 통제할 수 있습니다. <br/>
                                  패스워드나 XSS를 발생시킬 수 있는 입력값을 사용하여 정규식을 테스트 해 봅니다. </p>
     <form id="form2"  action="reg_test.do">
        <pre class="showLabs">

정규식문자열:  <input type="text" name="data"  id="data2"  size="70"> <input type="button"  id="button2" value="실행" >
 <br/>
        </pre>
     </form>
 </div>
 
  <div class="hint"  id="div3"> 
     <p id="select-test">SQL 인젝션 </p>
     <hr/>
     <p id="comment">외부입력값에 SQL문을 조작할 수 있는 입력값이 안전하게 필터링되지 않고 사용되는 경우 공격자가 의도하는 조작된 쿼리가 수행되는 침해사고가 발생할 수 있습니다.  </p>   
     <form action="sql_test.do"  id="form4"> 
        <pre class="showLabs">
(1) MySQL 인젝션(인증우회)<br/>
      ID: <input type="text" name="id"  id="data4-1">  PASSWORD: <input type="password" name="passwd"  id="data4-2"> <input type="button"  id="button4"  value="실행"  >             
         </pre>
     </form>
      <form action="sql_test_b.do"  id="form4"> 
        <pre class="showLabs">
(2) MySQL 인젝션<br/>
      ID: <input type="text" name="id"  id="data4-1" size="60"> <input type="submit"  id="button4"  value="실행"  >
         </pre>
     </form> 
     <form action="sql_test_b2.do"  id="form4"> 
        <pre class="showLabs">
(3) MS-SQL 인젝션<br/>  
      ID: <input type="text" name="id"  id="data4-1" size="60"> <input type="submit"  id="button4"  value="실행"  >
        </pre>
     </form>
  </div>
  <div class="hint" id="div4">
     <p id="select-test">Command 인젝션</p>
     <hr/>
      <p id="comment">명령어삽입 취약점은 외부에서 입력된 값을 충분히 검증하지 않고 서버에서 실행되는 명령어의 일부로 사용될 때 발생됩니다.
      서버로 전송되는 파라미터를 파로스와 같은 프록시툴을 사용해서 추가로 실행될 명령어(ex: &calc)을 삽입하여 전송되도록 조작해서 테스트 합니다. </p>
     <form action="command_test.do"  id="form5">
        <pre>

작업선택:  <select  name="data"  id="data5">
         <option value="type">--- show File1.txt ---</option>
         <option value="dir">--- show Dir ---</option>
      </select> <input type="button"   id="button5" value="실행"  > <br/>
       </pre>
     </form>
  </div> 
  <div class="hint" id="div5">
       <p id="select-test">XPath 인젝션</p>
       <hr/>
       <p id="comment">외부입력값이 XML문서를 조회하기위한 XPATH 생성에 사용되는 경우, 공격자는 ' = [ @ 와 같은 문자를 이용하여 XPATH를 조작하여 원하는 정보를 탈취할 수 있습니다. </p>   
       <form action="xpath_test.do"  id="form6">
        <pre>

이름: <input type="text" name="name"  id="data6" size="50">  <input type="button"   id="button6" value="실행"  >   <br/>        
          </pre>
     </form>
  </div> 
   <div class="hint" id="div6">
        <p id="select-test">XSS</p>
        <hr/>
        <p id="comment">외부입력값에 스크립트요소가 포함되어 있는 경우 이값을 적절하게 필터링하지 않고 사용자에게 응답하도록 서버 프로그램이 작성되어 있으면 해당 서버를 통해 공격자는 악성코드를 배포하게 되고 서버에 접속한 사용자들은 악성 스크립트를 다운로드 받아 실행하는 침해사고가 발생할 수 있습니다. </p>   
        <form action="xss_test.do"  id="form3">
        <pre>
(1) Reflective XSS  <br/>
    <input type="text" name="data"  id="data3" size="50"> <input type="button"   id="button3"  value="실행"  > 
        </pre>
     </form>
     <form action="xss_test_b.do"  id="form20">
        <pre>
(2) Stored XSS  <br/>
    <input type="text" name="data"  id="data20" size="50"> <input type="button"   id="button20"  value="실행"  > 입력값: 1 or 2   
        </pre>
     </form>
     <form action="xss_test_c.do"  id="form21">
        <pre>
(3) DOM XSS  <br/>
    <input type="text" name="data"  id="data21" size="50"> <input type="submit"     value="실행"  >
  <br/>
        </pre>
     </form>
  </div>
   <div class="hint" id="div15">
        <p id="select-test">CSRF</p>
        <hr/>
         <p id="comment">사용자의 요청이 실제 사용자가 의도한 요청인지를 확인하지 않고 요청을 처리하도록 구현된 애플리케이션은 CSRF 취약점을 가질 수 있습니다.</p>
        <form action="csrf_test.do"  id="form15">
        <pre>

수신자ID:    <input type="text" name="id"  id="data15" size="50">  

선물할포인트: <input type="text" name="point"  id="data15" size="50"> <input type="button"   id="button15" value="실행"  >     <br/>     

<font color="indigo"   size="3" >고객님의 포인트를 조회하시려면 <a href="csrf_test.do?id=${userId}"> 여기 </a> 를 클릭해주세요. </font><br/>   
     </pre>
     </form>
  </div> 
   <div class="hint"  id="div7">
         <p id="select-test">암호화</p>
         <hr/>
 <p id="comment">중요정보는 반드시 안전한 암호화 알고리즘을 사용하여 암호화하여 전송하거나 저장해야 합니다.</p>
         
         <form action="encrypt_test.do"  id="form7">
         <pre>
         
암/복호화 요청 데이터: <input type="text" name="data"  id="data7" size="30">  <input type="button" id="button7" value="실행"  > 

   <input type="radio"  name="type" value="0" checked="checked"> SHA-256 암호화  
   <input type="radio"  name="type" value="1"> AES 암호화      
   <input type="radio"  name="type" value="2"> AES 복호화          
   <input type="radio"  name="type" value="3"> RSA 암호화      
   <input type="radio"  name="type" value="4"> RSA 복호화           <br/>

          </pre>
      </form>
  </div>
    <div class="hint"  id="div8">
         <p id="select-test">오픈리다이렉트 </p>
         <hr/>
       <p id="comment">외부 입력값을 이용하여 페이지이동을 수행하는 경우 반드시 이동할 수 있는 페이지 정보는 서버가 관리하도록 구현해야 합니다.</p>       
         <form  name="form8" id="form8">
          <pre>

 사이트선택: <select  name="data"  id="data8">
             <option value="http://www.naver.com">--- 네이버 ---</option>
             <option value="http://www.nate.com">--- 네이트 ---</option>
             <option value="http://www.daum.net">--- 다음 ---</option>
       </select> <input type="button"  value="이동"  onClick="postPopUp('form8')">  <br/>
          </pre>
        </form>
     </div>
      <div class="hint" id="div9">
            <p id="select-test">보안쿠키</p>
            <hr/>
           <p id="comment">중요정보를 쿠키에 담아서 전송해야 하는 경우 반드시 setscure(true)을 적용하여 https 통신에서만 쿠키가 전달될 수 있도록 구현해야 합니다.</p>   
           <form action="secure_cookie_test.do"  id="form9">
           <pre>

전송데이터: <input type="text" name="data"  id="data9" size="30"> <input type="button" id="button9" value="실행"  >
 <br/>
<input type="radio"  name="type" value="0" checked="checked"> 쿠키값 설정 요청 
<input type="radio"  name="type" value="1"> 쿠키값 전송 요청       <br/>
          </pre>
        </form>
      </div>
    <div class="hint" id="div10">
            <p id="select-test">인증</p>
            <hr/>
                  <p id="comment">시스템 보안의 첫번째는 안전하고 강력한 인증입니다. SQL인젝션이나 취약한 로직에 의해 인증이 우회되지 않도록 구현해야 합니다.</p>   
            <form action="authenticator_test.do"  id="form10"> 
            <pre>

ID: <input type="text" name="id"  id="data10-1">  PASSWORD: <input type="password" name="passwd"  id="data10-2">  <input type="button"  id="button10"  value="실행"  >
 <br/>
           </pre>
     </form>
  </div>
    <div class="hint" id="div11">
            <p id="select-test">HTTP응답분할</p>
            <hr/>
            <p id="comment">외부 입력값이 헤더에 포함되는 경우 HTTP응답을 분할할 수 있는 \r \n과 같은 특수문자가 입력값에 포함되지 않도록 필터링 해서 사용해야 합니다.</p>   
            <form action="http_split_test.do"  id="form11"> 
            <pre>

전송메시지: <input type="text" name="data"  id="data11" size="60"> <input type="button"  id="button11"  value="실행"  >
 <br/>
          </pre>
     </form>
  </div>
   <div class="hint"  id="div12">
          <p id="select-test">접근제어</p>
          <hr/>
          <p id="comment">시스템 보안의 핵심중 하나가 인가입니다. 인가는 시스템 리소스에 대해 권한이 있는 사용자만 사용할 수 있도록 하는 정책입니다.</p>   
          <form action="access_control_test.do"  id="form12">
          <pre>
        
작업선택: <select  name="action"  id="data12">
               <option value="view">-- 정보 조회 --</option>
               <option value="modify">-- 연락처 변경 --</option>        
               <c:if test="${userId == 'admin' }">  
                     <option value="edit">-- 고객 정보 등록 --</option>     
                     <option value="delete">-- 고객 정보 삭제 --</option>   
                </c:if>
        </select> 
<c:if test="${userId == 'admin' }">  
고객ID: <input type="text" name="id"  id="data11" size="20" >  고객명: <input type="text" name="name"  id="data11" size="20"> <input type="button" id="button12" value="실행"  >
</c:if>
<c:if test="${userId != 'admin' }">  
고객ID: <input type="text" name="id"  id="data11" size="20"  value="${userId}"  readonly>  연락처: <input type="text" name="name"  id="data11" size="20"> <input type="button" id="button12" value="실행"  >
</c:if>

           </pre>
        </form>
     </div>
     <div class="hint"  id="div13">
           <p id="select-test">예외처리</p>
           <hr/>
           <p id="comment">시스템이 정상적인 동작을 수 없는 예외 사항이 발생되었을때 안전하게 예외처리가 수행될 수 있게 프로그램을 작성해야 합니다. </p>   
           <form action="exception_test.do"  id="form13">
           <pre>
           
테스트입력값:   <input type="text" name="data"  id="data13" size="30">  <input type="button" id="button13" value="실행"  hint="예외처리 테스트 데이터 입력" > 
   
<input type="radio"  name="type" value="0" checked="checked"> 오류메시지를 통한 정보 노출 
<font color=gray   size="3" >    0~100까지 숫자 입력 </font><br/>
<input type="radio"  name="type" value="1"> 오류 상황 대응 부재  
<font color=gray size="3" >    계정명을 입력(관리자: admin) </font><br/>
<input type="radio"  name="type" value="2"> 부적절한 예외처리 
<font color=gray size="3" >    조회하고자 하는 파일명 입력 ex:file1.txt   </font>  <br/>    
         </pre>       
         </form>
     </div>
     <div class="hint"  id="div14">
           <p id="select-test">정수오버플로우</p>
           <hr/>
           <p id="comment">외부에서 입력되거나 연산결과의 정수 값을 사용해야 하는 경우 정수값의 범위를 확인하고 사용할 수 있도록 프로그램이 작성되어야 합니다.</p>   
          <form action=" int_overflow_test.do"  id="form14">
          <pre>

 숫자입력: <input type="text" name="data"  id="data14" size="40"> <input type="button" id="button14" value="실행"  > 
       
 -2147483648 to 2147483647
   <br/>
           </pre>
        </form>
     </div>
     
        <div class="hint"  id="div16">
           <p id="select-test">TOCTOU</p>
           <hr/>
           <form action=" concurrency_test.do"  id="form16">
          <pre>

 숫자입력[0~9]: <input type="text" name="data"  id="data16" size="40"> <input type="button" id="button16" value="실행"  > 

   <br/>
           </pre>
        </form>
     </div>
     
       <div class="hint"  id="div17">
             <p id="select-test">세션간 정보노출</p>
             <hr/>
             <p id="comment">웹 애플리케이션에서 사용자의 요청을 처리하는 Controller는 대부분 스레드로 동작이 됩니다. 
             Controller 클래스를 설계할 때 클래스 멤버변수나 클래스 변수는 스레드 공유 정보가 됩니다.  </p>   
             <form action=" session_data_test.do"  id="form17">
             <pre>

이름: <input type="text" name="name"  id="name" size="40"> 

전화번호: <input type="text" name="phone"  id="phone" size="40">  <input type="button" id="button17" value="실행"  > 

   <br/>
           </pre>
        </form>
     </div>
     
     <div class="hint"  id="div18">
             <p id="select-test">반복문제어 부재</p>
             <hr/>
             <p id="comment">반복문이나 재귀함수를 구현하는 경우 안전하게 제어가 될 수 있도록 프로그램을 작성해야 합니다. 
             제어가 제대로 구현되지 않는 경우 시스템 리소스 고갈과 같은 오류 상황을 만들 수 있습니다.</p>   
             <form action=" loop_test.do"  id="form18">
             <pre>

팩토리얼 구하기: <input type="text" name="data"  id="data" size="40">  <input type="button" id="button18" value="실행"  > 

   <br/>
           </pre>
        </form>
     </div>
   
     <div class="hint"  id="div19">
             <p id="select-test">널포인트 역참조</p>
             <hr/>
             <p id="comment">외부에서 전달된 객체는 사용전에 반드시 null 여부를 확인하고 사용할 수 있도록 프로그램을 작성해야 합니다.</p>   
             <form action=" null_test.do"  id="form19">
             <pre>

작업선택: <select  name="data"  id="data19">
               <option value="0">-- 백업 --</option>
               <option value="1">-- 복구 --</option>     
               <option value="2">-- 초기화  --</option>           
        </select>  <input type="button" id="button19" value="실행"  >
        <input type="hidden" name="userid" value="${userId}">
   <br/>
           </pre>
        </form>
     </div>
         
    <div class="hint"  id="div30">
             <p id="select-test">캡슐화위배</p>
             <hr/>
             <p id="comment">private으로 선언된 데이터는 반드시 해당 클래스 멤버 메소드를 통해 통제 되도록 프로그램이 작성되어야 합니다.
             하지만 배열이나 컬렉션 자료형의 경우 잘못된 코드로 인해 외부 클래스에서 직접 객체 정보를 액세스 할 수 있는 경우가 발생 됩니다.</p>   
             <form action=" encap_test.do"  id="form30" >
             <pre>

작업선택: <select  name="type"  id="data30">
               <option value="0">-- 관리자 목록 조회 --</option>
               <option value="1">-- 관리자 정보 수정 --</option>      
               <option value="2">-- 관리자 정보 초기화 --</option>             
        </select> <input type="text"  name="data"   >  <input type="button" id="button30" value="실행"  >
   <br/>
           </pre>
        </form>
     </div>
     
         <div class="hint"  id="div31">
                <p id="select-test">중요정보노출</p>
                <hr/>
                <p id="comment">중요정보는 반드시 암호화되어 전송되거나 암호화된 통신채널을 사용하여 전송해야 합니다. 만약 http 통신을 사용하는 경우 중요정보는 서버에서 마스킹처리해서 클라이언트로 전송해야 하며, 클라이언트는 해당정보를 확인하기 위해서는 반드시 https를 통해 요청하도록 구현해야 합니다.</p>   
     <br/>
     중요 정보는 안전하게 마스킹되어서 표시됩니다.<br/><br/>
     사용자 등급:  <input type="password"  name="grade" value="${userId }"/> <input type="button"  id="button31"  value="숨겨진값 표시" > <br/><br/>
    <font color=gray   size="3" >  <주의>소스보기를 통해 사용자 등급을 확인합니다 </font>
     <br/>   <br/>   <br/>   
     </div>
     
     
</div>
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
	    	    	
// 	    	    	 var formData={data:Base64.encode(form1.data.value)};
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
    	    		           $('#result').append(data); 
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
	    	        	       var uri_dec = decodeURIComponent(data);
    	    		           $('#result').append(uri_dec); 
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
   
   $('#button15').click( 
 		   function() { 
 		   	    	 var formData = $("#form15").serializeArray();  
 			    	 var URL = $("#form15 ").attr("action");  
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
		    		           window.open(data);
// 	   	    		           $('#result').append(data); 
	   	    		    } 
	    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
	   	    		    	   $('#result').append("요청처리 실패"); 
	   	    	         }); 
	   });
 	
 	$('#button9').click( 
  		   function() { 
  		   	    	 var formData = $("#form9").serializeArray();  
  			    	 var URL = $("#form9").attr("action");  
  			    	 $('#result').empty(); 
  			    	 $.post(URL,formData,   
  			    			function(data, textStatus, jqXHR)     {        	    		             
  		   	    		           $('#result').append(data); 
  		   	    		    } 
  		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
  		   	    		    	   $('#result').append("요청처리 실패"); 
  		   	    	         }); 
  		   });
 	
 	$('#button10').click( 
 		   function() { 
 		   	    	 var formData = $("#form10").serializeArray();  
 			    	 var URL = $("#form10").attr("action");  
 			    	 $('#result').empty(); 
 			    	 $.post(URL,formData,   
 			    			function(data, textStatus, jqXHR)     {        	    		             
 		   	    		           $('#result').append(data); 
 		   	    		    } 
 		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
 		   	    		    	   $('#result').append("요청처리 실패"); 
 		   	    	         }); 
 		   });
 	
 	$('#button11').click( 
  		   function() { 
  		   	    	 var formData = $("#form11").serializeArray();  
  			    	 var URL = $("#form11").attr("action");  
  			    	 $('#result').empty(); 
  			    	 $.post(URL,formData,   
  			    			function(data, textStatus, jqXHR)     {        	    		             
  		   	    		           $('#result').append(data); 
  		   	    		    } 
  		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
  		   	    		    	   $('#result').append("요청처리 실패"); 
  		   	    	         }); 
  		   });
 	
 	$('#button12').click( 
   		   function() { 
   		   	    	 var formData = $("#form12").serializeArray();  
   			    	 var URL = $("#form12").attr("action");  
   			    	 $('#result').empty(); 
   			    	 $.post(URL,formData,   
   			    			function(data, textStatus, jqXHR)     {        	    		             
   		   	    		           $('#result').append(data); 
   		   	    		    } 
   		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
   		   	    		    	   $('#result').append("요청처리 실패"); 
   		   	    	         }); 
   		   });
 	
 	$('#button13').click( 
    		   function() { 
    		   	    	 var formData = $("#form13").serializeArray();  
    			    	 var URL = $("#form13").attr("action");  
    			    	 $('#result').empty(); 
    			    	 $.post(URL,formData,   
    			    			function(data, textStatus, jqXHR)     {        	    		             
    		   	    		           $('#result').append(data); 
    		   	    		    } 
    		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
    		   	    		    	   $('#result').append("요청처리 실패: "+textStatus); 
    		   	    	         }); 
    		   });
 	$('#button14').click( 
 		   function() { 
 		   	    	 var formData = $("#form14").serializeArray();  
 			    	 var URL = $("#form14").attr("action");  
 			    	 $('#result').empty(); 
 			    	 $.post(URL,formData,   
 			    			function(data, textStatus, jqXHR)     {        	    		             
 		   	    		           $('#result').append(data); 
 		   	    		    } 
 		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
 		   	    		    	   $('#result').append("요청처리 실패"); 
 		   	    	         }); 
 		   });
 	$('#button16').click( 
  		   function() { 
  		   	    	 var formData = $("#form16").serializeArray();  
  			    	 var URL = $("#form16").attr("action");  
  			    	 $('#result').empty(); 
  			    	 $.post(URL,formData,   
  			    			function(data, textStatus, jqXHR)     {        	    		             
  		   	    		           $('#result').append(data); 
  		   	    		    } 
  		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
  		   	    		    	   $('#result').append("요청처리 실패"); 
  		   	    	         }); 
  		   });
 	$('#button17').click( 
   		   function() { 
   		   	    	 var formData = $("#form17").serializeArray();  
   			    	 var URL = $("#form17").attr("action");  
   			    	 $('#result').empty(); 
   			    	 $.post(URL,formData,   
   			    			function(data, textStatus, jqXHR)     {        	    		             
   		   	    		           $('#result').append(data); 
   		   	    		    } 
   		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
   		   	    		    	   $('#result').append("요청처리 실패"); 
   		   	    	         }); 
   		   });
 	
	$('#button18').click( 
	   		   function() { 
	   		   	    	 var formData = $("#form18").serializeArray();  
	   			    	 var URL = $("#form18").attr("action");  
	   			    	 $('#result').empty(); 
	   			    	 $.post(URL,formData,   
	   			    			function(data, textStatus, jqXHR)     {        	    		             
	   		   	    		           $('#result').append(data); 
	   		   	    		    } 
	   		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
	   		   	    		    	   $('#result').append("요청처리 실패"); 
	   		   	    	         }); 
	   		   });
	
	$('#button19').click( 
	   		   function() { 
	   		   	    	 var formData = $("#form19").serializeArray();  
	   			    	 var URL = $("#form19").attr("action");  
	   			    	 $('#result').empty(); 
	   			    	 $.post(URL,formData,   
	   			    			function(data, textStatus, jqXHR)     {        	    		             
	   		   	    		           $('#result').append(data); 
	   		   	    		    } 
	   		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
	   		   	    		    	   $('#result').append("요청처리 실패"); 
	   		   	    	         }); 
	   		   });
	
 	$('#button20').click( 
 		   function() { 
 		   	    	 var formData = $("#form20").serializeArray();  
 			    	 var URL = $("#form20").attr("action");  
 			    	 $('#result').empty(); 
 			    	 $.post(URL,formData,   
 			    			function(data, textStatus, jqXHR)     {        	    		             
 		   	    		           $('#result').append(data); 
 		   	    		    } 
 		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
 		   	    		    	   $('#result').append("요청처리 실패"); 
 		   	    	         }); 
 		   });
 	$('#button21').click( 
 		   function() { 
 		   	    	 var formData = $("#form21").serializeArray();  
 			    	 var URL = $("#form21").attr("action");  
 			    	 $('#result').empty(); 
 			    	 $.post(URL,formData,   
 			    			function(data, textStatus, jqXHR)     {     			    	
 		   	    		           document.write(unescape(data));
 		   	    		    } 
 		    	    	   ).fail(function(jqXHR, textStatus, errorThrown) {   
 		   	    		    	   $('#result').append("요청처리 실패"); 
 		   	    	         }); 
 		   });
 	
 	$('#button30').click( 
	   		   function() { 
	   		   	    	 var formData = $("#form30").serializeArray();  
	   			    	 var URL = $("#form30").attr("action");  
	   			    	 $('#result').empty(); 
	   			    	 $.post(URL,formData,   
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
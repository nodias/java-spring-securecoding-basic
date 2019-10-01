<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글 목록 보기</title>
<link href="<%=request.getContextPath()%>/css/board.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js"></script>
<script type="text/javascript">
<!--
	function selectedOptionCheck(){
		$("#type > option[value=<%=request.getParameter("type")%>]").attr("selected", "true");
	}
	
	function moveAction(where){
		switch (where) {
		case 1:
			location.href = "write.do";
			break;
		
		case 2:
			location.href = "list.do";
			break;
		}
	}
//-->
</script>
</head>
<body onload="selectedOptionCheck()">

<div id="container">
	<h2>
			<jsp:include page="header.jsp"/>  
    </h1>
	
	<div id="content-container">
	<div id="content">	       
	       <p id="content-string" >소프트웨어 보안은 보안소프트웨어가 아닙니다. <br/><br/>소프트웨어 보안을 유지한다는 것은 암호화화 같은 다양한 보안기능의 적용을 위함 하는 것보다 소프트웨어 라이프 사이클 전반에 걸쳐 여러가지 안전한 소프트웨어 개발의 모범사례를 적용하는 것을 의미합니다.<br/><br/> 보안문제는 특정 보안기능보다 안전한 시스템을 구성하는 표준의 문제로 인해 발생할 수 있습니다. <br/><br/>그래서 소프트웨어 보안은 전체 개발단계의 라이프 사이클 접근 방식의 일부가 되어야 하는 중요한 이유입니다. </p>
           <p id="content-image">
                <img src="../img/openeg.png" width="260" height="320"   />
           </p>
    </div>
	<div id="aside">
		<fieldset>
			<center>
			   <label>[ ${userName} ]님 환영합니다.</label><br/>
			   <a href="../logout.do">로그아웃</a>&nbsp;&nbsp;&nbsp;
	           <a href="../member/modify.do">정보수정</a>
			</center>
		</fieldset>
	</div>
		<div id="footer">
			 <jsp:include page="footer.jsp"/> 
		</div>
	
</div>
</div>

</body>
</html>
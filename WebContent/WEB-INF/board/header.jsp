<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.log_info {
		float: right;
		color: white;
		size: 8px;		
		margin: 0px;
		padding: 5px;
	}
	
	a {
	  color: white;
	}
</style>
	
<script>
    function confirmInitDB() {
    	if ( confirm("정말 초기화 하시겠습니까?")  ) {
    		return true;
    	} else {
    		return false;
    	}
    }
</script>
</head>

<body>
    <div id="header">
         <img id="header-img" src="../img/lab_head.png" width="100%"  heigth="80px" align="bottom" />
    </div>
	<div id="navigation">
		<ul>
			<li><a href="<%=request.getContextPath()%>/board/main.do">홈으로</a></li>
			<li><a href="<%=request.getContextPath()%>/board/list.do">게시판</a></li>
			<li><a href="<%=request.getContextPath()%>/test/test.do?no=0">시큐어코딩테스트</a></li>
			<li><a href="<%=request.getContextPath()%>/test/esapi_test.do?no=0">ESAPI 테스트</a></li>
<!-- 			<li><a href="http://openeg.co.kr" target="_blank">(주)오픈이지</a></li> -->
<!-- 			<li><a href="http://cafe.naver.com/openeg" target="_blank">커뮤니티</a></li> -->
			<li><a href="<%=request.getContextPath()%>/test/init_db.do?id=${userId}"  onclick="return confirmInitDB();">DB초기화</a></li>
		</ul>
		<c:if test="${userId != null }">
			 <p class="log_info"> [ ${userId } ]님  <a href="<%=request.getContextPath()%>/logout.do">로그아웃</a> </p>
		</c:if> 
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"
	type="text/css">
<c:if test="${errCode == null}">
	<c:set var="errCode" value="\"\""></c:set>
</c:if>
<script type="text/javascript">
	function checkErrCode(){
		var errCode = ${errCode};
		if(errCode != null || errCode != ""){
			switch (errCode) {
			case 1:
				alert("가입된 사용자ID가 아닙니다!");
				break;
			case 2:
				alert("비밀번호가 일치하지 않습니다!");
				break;
			case 4:
				alert("로그인후에 사용가능합니다.");
				break;
			case 3:
				alert("회원가입 처리가 완료되었습니다! 로그인 해 주세요!");
				location.href = 
					"<%=request.getContextPath()%>/login.do";
				break;
			}
		}
	}
</script>
</head>
<body onload="checkErrCode()">
	<div id="container">

		<h2>
			<jsp:include page="before_login_header.jsp" />
		</h2>


		<div id="content-container">
			<div id="content">
              <jsp:include page="main.jsp" />
			</div>
		    <div id="aside">
				<spring:hasBindErrors name="LoginModel" />
				<form:errors path="LoginModel" />
				<form action="login.do" method="post">
					<fieldset>
						<center>
							<label for="userId">사용자명 : </label> <input type="text"
								id="userId" name="userId" class="loginInput" value="${userId}" />
							<span class="error"><form:errors path="LoginModel.userId" /></span><br />
							<label for="userPw">비밀번호 : </label> <input type="password"
								id="userPw" name="userPw" class="loginInput" /> <span
								class="error"><form:errors path="LoginModel.userPw" /></span><br />
							<br /> <input type="submit" value="로그인" class="submitBt" /> <input
								type="button" value="회원가입" class="submitBt"
								onClick='window.open("member/join.do","_blank","width=400,height=400, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no");' />
						</center>
					</fieldset>
				</form>		    </div>
			<div id="footer">
				<jsp:include page="footer.jsp" />
			</div>
		</div>
	</div>

</body>
</html>
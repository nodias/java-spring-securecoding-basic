<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Join Member!</title>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js"></script>
<c:if test="${errCode == null}">
	<c:set var="errCode" value="\"\""></c:set>
</c:if>
<script type="text/javascript">
	function errCodeCheck(){
		var errCode = ${errCode};
		if(errCode != null || errCode != ""){
			switch (errCode) {
			case 1:
				alert("기존 패스워드 검증 실패");
				break;
			case 2:
				alert("회원정보 수정 오류 발생");
				break;
			}
		}
	}
	
	function passwordCheck(){
		if($("#userPw").val() != $("#userPwCheck").val()){
			alert("패스워드 입력이 일치하지 않습니다");
			$("#userPwCheck").focus();
			return false;
		}		
		return true;
	}
</script>
</head>
<body onload="errCodeCheck()">
<div id="container">
	
		<h1>
			<jsp:include page="header.jsp"/>  
		</h1>

	
	<div id="content-container">
		<div id="content">

	<spring:hasBindErrors name="MemberModel" />
	<form:errors path="MemberModel" />
	<form action="modify.do" method="post" onsubmit="return passwordCheck()">
		<fieldset >
		    <legend><b>회원정보수정</b></legend>
		    <table>
		      <tr>
		         <td class="td01"  ><label for="userId"  class="label01">사용자ID  </label></td>
		         <td><input type="text" id="userId" name="userId" class="loginInput" value="${member.userId}"  readonly="readonly"/></td>
		         <td><span class="error"><form:errors path="MemberModel.userId" /></span></td>
		      </tr>
		      <tr>
		         <td class="td01" ><label for="userName" class="label01" >회원이름  </label></td>
		         <td><input type="text" id="userName" name="userName"  value="${member.userName}" class="loginInput"/></td>
		         <td><span class="error"><form:errors path="MemberModel.userName" /></span></td>
		      </tr>
		      <tr>
		         <td class="td01" ><label for="oldUserPw" class="label01">기존비밀번호 </label></td>
		         <td><input type="password" id="oldUserPw" name="oldUserPw" class="loginInput"/></td>
		         <td><span class="error"><form:errors path="MemberModel.userPw" /></span></td>
		      </tr>
		      <tr>
		         <td class="td01" ><label for="userPw" class="label01">신규비밀번호 </label></td>
		         <td><input type="password" id="userPw" name="userPw" class="loginInput"/></td>
		         <td><span class="error"><form:errors path="MemberModel.userPw" /></span></td>
		      </tr>
		      <tr>
		         <td class="td01" ><label for="userPwCheck" class="label01">신규비밀번호확인  </label></td>
		         <td><input type="password" id="userPwCheck" name="userPwCheck" class="loginInput"/></td>
		         <td></td>
		      </tr>
		      <tr>
		         <td colspan="3" align="center">
		              <br/><br/>
		              <input type="submit" value="확인" class="submitBt"/>
			          <input type="reset" value="재작성" class="submitBt" />
			     </td>
		      </tr>
		      <tr>
		         <td colspan="3" align="center"><a href="<%=request.getContextPath()%>/login.do">로그인 페이지로 돌아가기</a></td>
		      </tr>
		    </table>				
		</fieldset>
	  </form>
			
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
<div class="wrapper">

</div>
</body>
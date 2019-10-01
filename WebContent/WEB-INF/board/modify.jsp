<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정: ${board.subject}</title>
<link href="<%=request.getContextPath()%>/css/board.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js"></script>
<script type="text/javascript">
	function writeFormCheck() {
		if($("#subject").val() == null || $("#subject").val() == ""){
			alert("제목을 입력해 주세요!");
			$("#subject").focus();
			return false;
		}
		
		if($("#content").val() == null || $("#content").val() == ""){
			alert("내용을 입력해 주세요!");
			$("#content").focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>

<div class="wrapper">	
	<h3>새 글 쓰기</h3>
	<form action="modify.do" method="post" onsubmit="return writeFormCheck()" enctype="multipart/form-data">	
	<table class="boardWrite">	
		<tr>
			<th>제목</th>
			<td>
				<input type="text" id="subject" name="subject" class="boardSubject" value="${board.subject}"/>
				<input type="hidden" id="writer" name="writer" value="${userName}" />
				<input type="hidden" id="writerId" name="writerId" value="${userId}" />
				<input type="hidden" id="idx" name="idx" value="${board.idx}" />
			</td>			
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea id="content" name="content" class="boardContent">${board.content}</textarea></td>			
		</tr>
		<tr>
			<th><label for="file">파일</label></th>
			<td>
				<input type="file" id="newFile" name="newFile" /><p>업로드된 파일: ${board.fileName}</p>
				<input type="hidden" id="orgFile" name="orgFile" value="${board.fileName}" />
			</td>			
		</tr>				
	</table>
	<br />
	<input type="reset" value="재작성" class="writeBt"/>
	<input type="submit" value="확인" class="writeBt"/>	
	</form>
</div>
</body>
</html>
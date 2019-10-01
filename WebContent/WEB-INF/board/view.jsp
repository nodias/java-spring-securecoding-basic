<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 보기: ${board.subject}</title>
<link href="<%=request.getContextPath()%>/css/board.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function errCodeCheck(){
		var errCode = <%=request.getParameter("errCode")%>;
		if(errCode != null || errCode != ""){
			switch (errCode) {
			case 1:
				alert("잘못된 접근 경로입니다!");
				break;
			case 2:
				alert("댓글이 있어 글을 삭제하실 수 없습니다!");
				break;
			}
		}		
	}
	
	function commentDelete(commentIdx, linkedArticleNum){
		if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
			location.href("commentDelete.do?idx=" + commentIdx + "&linkedArticleNum=" + linkedArticleNum);
		}		
	}
	
	function moveAction(where){
		switch (where) {
		case 1:
			if(confirm("글을 삭제하시겠습니까?")){
				location.href ="delete.do?idx=${board.idx}";
			}
			break;

		case 2:
			if(confirm("글을 수정하시겠습니까?")){
				location.href = "modify.do?idx=${board.idx}";
			}
			break;
			
		case 3:
			location.href = "list.do";			
			break;
		
		case 4:
			if(confirm("글을 추천하시겠습니까?")){
				location.href = "recommend.do?idx=${board.idx}";
			}
			break;
		}
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
	<table class="boardView">
		<tr>
			<td colspan="4"><h3>${board.subject}</h3></td>
		</tr>
		<tr>
			<th>작성자</th>
			<th>조회수</th>
			<th>추천수</th>
			<th>작성일</th>
		</tr>
		<tr>
			<td>${board.writer}</td>
			<td>${board.hitcount}</td>
			<td>${board.recommendcount}</td>
			<td>${board.writeDate}</td>
		</tr>
		<tr>
			<th colspan="4">내용</th>
		</tr>
		<c:if test="${board.fileName != null }">
		<tr>
			<td colspan="4" align="left">
			<span class="date">첨부파일:&nbsp;
			<a href="../files/${board.fileName}" 
			target="_blank">${board.fileName}</a></span></td>
		</tr>
		</c:if>	
		<tr>
			<td colspan="4" align="left"><p>${board.content}</p><br /><br /></td>
		</tr>		
	</table>
	<table class="commentView">
		<tr>
			<th colspan="2">댓글</th>
		</tr>		
		<c:forEach var="comment" items="${commentList}">
		<tr>
			<td class="writer">				
				<p>${comment.writer}
				<c:if test="${comment.writerId == userId}">
					<br /><a onclick="commentDelete(${comment.idx}, ${board.idx})"><small>댓글 삭제</small></a>					
				</c:if>
				</p>
			</td>
			<td class="content" align="left">
				<span class="date">${comment.writeDate}</span>
				<p>${comment.content}</p>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td class="writer2"><strong>댓글 쓰기</strong></td>
			<td class="content2">
				<form action="commentWrite.do" method="post">
					<input type="hidden" id="writer" name="writer" value="${userName}" />
					<input type="hidden" id="writerId" name="writerId" value="${userId}" />
					<input type="hidden" id="linkedArticleNum" name="linkedArticleNum" value="${board.idx}" />
					<textarea id="content" name="content" class="commentForm1"></textarea>
					<input type="submit" value="확인" class="commentBt" />
				</form>
			</td>
		</tr>
	</table>
	<br />
	<center>
	<c:choose>
		<c:when test="${board.writerId == userId}">
			<input type="button" value="삭제" class="writeBt" onclick="moveAction(1)" />
			<input type="button" value="수정" class="writeBt" onclick="moveAction(2)" />
			<input type="button" value="목록" class="writeBt" onclick="moveAction(3)" />
		</c:when>
		<c:otherwise>
			<input type="button" value="추천" class="writeBt" onclick="moveAction(4)" />
			<input type="button" value="목록" class="writeBt" onclick="moveAction(3)" />
		</c:otherwise>
	</c:choose>
	</center>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <script>
       function onClickString() {
          var  a= document.URL;
          a=unescape(a);
          document.write(a.substring(a.indexOf("message=")+8, a.length));
       }
  </script>
  <h1> DOM XSS 테스트</h1>
  <div onClick="onClickString();">
     <h2>전달된 파라메터의 값을 확인하려면 여기를 클릭하세요</h2>
  </div>
</body>
</html>
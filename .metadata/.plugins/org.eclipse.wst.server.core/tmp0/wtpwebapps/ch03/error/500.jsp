<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500</title>
</head>
<body>
	<h3>일시적인 서버 장애가 발생했습니다.</h3>
	
	<p>
		에러종류 : <%= exception.getClass().getName() %><br>
		에러내용 : <%= exception.getMessage() %><br>
	</p>
	
	<a href="../5.exception.jsp">뒤로가기</a>
</body>
</html>
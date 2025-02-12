<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1.Servlet</title>
	<!-- 
		날짜 : 2025/02/12
		이름 : 정진우
		내용 : JSP Servlet 실습하기
	 
	 	서블릿(Servlet)
	 	 - Java를 이용해서 클라이언트 요청을 처리하고 응답하는 객체
	 	 - 서블릿은 HTML 작성이 어렵고 불편하기 때문에 JSP 기술로 대체
	 	 - 서블릿은 MVC 아키텍처에서 Controller 컴포넌트로 활용
	 	 - 서블릿은 등록(web.xml 또는 Annotation)하고 주소맵핑(url-pattern) 
	 -->
</head>
<body>
	<h3>1. Servlet</h3>
	
	<a href="/ch09/hello.do">Hello</a>
	<a href="/ch09/welcome.do">Welcome</a>
	<a href="/ch09/greeting.do">Greeting</a>
	
	<form action="/ch09/hello.do" method="post">
		<input type="submit" value="Hello post 요청">
	</form>
	<form action="/ch09/welcome.do" method="post">
		<input type="submit" value="Welcome post 요청">
	</form>
	<form action="/ch09/greeting.do" method="post">
		<input type="submit" value="Greeting post 요청">
	</form>
</body>
</html>
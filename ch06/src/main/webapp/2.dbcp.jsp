<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2.DBCP</title>
	<!-- 
		날짜 : 2025/02/07
		이름 : 정진우
		내용 : JSP 데이터베이스 커넥션풀 실습하기
		
		커넥션 풀 설정
		- Tomcat(Servers) - context.xml 파일 설정
		
		maxTotal : 풀에 생성되는 최대 커넥션 갯수
		maxIdle : 풀에 유지되는 커넥션 갯수
		maxWaitMillis : 풀에서 커넥션을 기다리는 대기 시간
	-->
</head>
<body>
	<h3>2. DBCP</h3>
	
	<h4>user1</h4>
	<a href="./user1/list.jsp">user1 목록</a>
	
	<h4>Shop</h4>
	<a href="./shop">Shop 목록</a>
</body>
</html>
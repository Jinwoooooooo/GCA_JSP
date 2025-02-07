<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="entity.User1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
 <%
	
	List<User1> users = new ArrayList<>();
	
	try {
		// JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // JNDI 기본 환경 이름
		
		// 커넥션 풀에 있는 커넥션을 가져오기
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM user1");
		
		while(rs.next()) {
			User1 user1 = new User1();
			user1.setUid(rs.getString(1));
			user1.setName(rs.getString(2));
			user1.setHp(rs.getString(3));
			user1.setAge(rs.getInt(4));
			
			users.add(user1);
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user1::list</title>
</head>
<body>
	<h3>user1 목록</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="./register.jsp">등록하기</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		<% for(User1 user1 : users) { %>
		<tr>
			<td><%= user1.getUid() %></td>
			<td><%= user1.getName() %></td>
			<td><%= user1.getHp() %></td>
			<td><%= user1.getAge() %></td>
			<td>
				<a href="./modify.jsp?uid=<%= user1.getUid() %>">수정</a>
				<a href="./proc/delete.jsp?uid=<%= user1.getUid() %>">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
</body>
</html>
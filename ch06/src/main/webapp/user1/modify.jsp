<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="entity.User1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	User1 user1 = null;	//선언
	String uid = request.getParameter("uid");
	
	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
				
		String sql = "SELECT * FROM user1 WHERE uid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			user1 = new User1(); //생성
			user1.setUid(rs.getString(1));
			user1.setName(rs.getString(2));
			user1.setHp(rs.getString(3));
			user1.setAge(rs.getInt(4));
		}
		
		rs.close();
		pstmt.close();
		conn.close();
	
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user1::modify</title>
</head>
<body>
	<h3>user1 수정</h3>
	<a href="../1.jdbc.jsp">처음으로</a>
	<a href="../list.jsp">목록이동</a>
	
	<form action="./proc/modify.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="<%= user1.getUid() %>" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%= user1.getName() %>" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%= user1.getHp() %>" placeholder="휴대폰 번호 입력"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value="<%= user1.getAge() %>" placeholder="나이 입력"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
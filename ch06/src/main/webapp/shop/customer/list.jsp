<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="entity.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	List<Customer> customers = new ArrayList<>();

	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM customer");
		
		while(rs.next()) {
			Customer customer = new Customer();
			customer.setCustId(rs.getString(1));
			customer.setName(rs.getString(2));
			customer.setHp(rs.getString(3));
			customer.setAddr(rs.getString(4));
			customer.setRdate(rs.getString(5));
			
			customers.add(customer);
		}
		rs.close();
		stmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer::list</title>
</head>
<body>
	<h3>고객 목록</h3>
	<a href="/ch06/shop">메인 이동</a>
	<a href="/ch06/shop/customer/register.jsp">고객 등록</a>
	
	<table border="1">
		<tr>
			<th>고객아이디</th>
			<th>고객명</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>가입일</th>
			<th>관리</th>
		</tr>
		<% for(Customer customer : customers) { %>
		<tr>
			<td><%= customer.getCustId() %></td>
			<td><%= customer.getName() %></td>
			<td><%= customer.getHp() %></td>
			<td><%= customer.getAddr() %></td>
			<td><%= customer.getRdate() %></td>
			<td>
				<a href="#">수정</a>
				<a href="#">삭제</a>
			</td>
		</tr>
		<% } %>
	</table>
	
</body>
</html>
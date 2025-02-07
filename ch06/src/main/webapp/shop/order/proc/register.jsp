<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String orderId = request.getParameter("orderId");
	String orderProduct = request.getParameter("orderProduct");
	String orderCount = request.getParameter("orderCount");
	
	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		
		Connection conn = ds.getConnection();
		
		String sql = "INSERT INTO `order` set orderId=?, orderProduct=?, orderCount=?, orderDate=NOW()";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, orderId);
		pstmt.setString(2, orderProduct);
		pstmt.setString(3, orderCount);
		pstmt.executeUpdate();
		
		//재고량 수정
		String updateSql = "UPDATE product SET stock = stock - ? WHERE prodNo=?";
		PreparedStatement pstmt2 = conn.prepareStatement(updateSql);
		pstmt2.setString(1, orderCount);
		pstmt2.setString(2, orderProduct);
		pstmt2.executeUpdate();
		
		pstmt.close();
		pstmt2.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch06/shop/product/list.jsp");
%>
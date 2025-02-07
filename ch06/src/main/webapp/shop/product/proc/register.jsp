<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String prodName = request.getParameter("prodName");
	String stock = request.getParameter("stock");
	String price = request.getParameter("price");
	String company = request.getParameter("company");

	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		String sql = "INSERT INTO product (prodName, stock, price, company) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, prodName);
		pstmt.setString(2, stock);
		pstmt.setString(3, price);
		pstmt.setString(4, company);
		
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch06/shop/product/list.jsp");
%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//데이터 수신
	String custId = request.getParameter("custId");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	
	//데이터베이스 처리
	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		String sql = "INSERT INTO customer VALUES (?,?,?,?,NOW())";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, custId);
		pstmt.setString(2, name);
		pstmt.setString(3, hp);
		pstmt.setString(4, addr);
		
		pstmt.executeUpdate();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	//목록 이동
	response.sendRedirect("/ch06/shop/customer/list.jsp");
%>
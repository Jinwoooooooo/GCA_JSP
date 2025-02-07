<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		//3단계 - SQL 실행 객체 생성
		String sql = "UPDATE user1 SET name=?, hp=?, age=? WHERE uid=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, hp);
		pstmt.setString(3, age);
		pstmt.setString(4, uid);
		
		//4단계 - SQL 실행
		pstmt.executeUpdate();
		
		//5단계 - 결과셋 처리(SELECT 경우)
		
		
		//6단계 - 데이터베이스 종료
		pstmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	//목록 이동
	response.sendRedirect("../list.jsp");
%>
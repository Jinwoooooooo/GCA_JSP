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
	
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	try {
		//1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		//2단계 - 데이터베이스 접속
		Connection conn =  DriverManager.getConnection(host, user, pass);
		
		//3단계 - SQL 실행 객체 생성
		String sql = "INSERT INTO user1 VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, uid);
		pstmt.setString(2, name);
		pstmt.setString(3, hp);
		pstmt.setString(4, age);
		
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
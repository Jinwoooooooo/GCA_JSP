<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="entity.FileEntity"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	String seq = request.getParameter("seq");
	
	//파일 엔티티 선언
	FileEntity file = null;

	//파일 정보 조회
	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		Connection conn = ds.getConnection();
		
		String sql = "SELECT * FROM `file` WHERE seq=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, seq);
		
		String deleteSql = "DELETE FROM `file` WHERE seq=?";
		PreparedStatement pstmtDelete = conn.prepareStatement(deleteSql);
		pstmtDelete.setString(1, seq);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			file = new FileEntity();
			file.setSeq(rs.getInt(1));
			file.setTitle(rs.getString(2));
			file.setName(rs.getString(3));
			file.setoName(rs.getString(4));
			file.setsName(rs.getString(5));	
		}
		
		pstmtDelete.executeUpdate();
		pstmtDelete.close();
		
		rs.close();
		pstmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	//디렉토리 파일 삭제
	String path = application.getRealPath("/uploads");
	File target = new File(path + File.separator + file.getsName()); //경로 + 구분자 + 파일명
	
	target.delete();
	
	//파일 목록 이동
	response.sendRedirect("../2.fileDownload.jsp");
%>
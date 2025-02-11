<%@page import="java.io.File"%>
<%@page import="entity.FileEntity"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItem"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.commons.fileupload2.core.FileItem"%>
<%@page import="org.apache.commons.fileupload2.jakarta.servlet6.JakartaServletFileUpload"%>
<%@page import="org.apache.commons.fileupload2.core.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload2.core.FileItemFactory"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 파일 업로드 디렉토리 경로 설정
	String uploadPath = application.getRealPath("/uploads");

	// 파일 업로드 디렉토리가 존재하지 않으면 디렉토리 생성
	File uploadDir = new File(uploadPath);
	if(!uploadDir.exists()) {
		uploadDir.mkdir();
	}
	
	// 파일 업로드 처리 객체 생성
	DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
	JakartaServletFileUpload<DiskFileItem, DiskFileItemFactory> upload = new JakartaServletFileUpload<>(factory);
	
	// 최대 업로드 파일 크기 설정
	upload.setFileSizeMax(1024 * 1024 * 10); //10MB
	
	//파일 엔티티 생성
	FileEntity file = new FileEntity();
	
	// 파일 업로드 스트림 작업
	try {
		List<DiskFileItem> items = upload.parseRequest(request);
		Iterator<DiskFileItem> iter = items.iterator();
		
		//폼 입력 필드 갯수만큼 반복
		while(iter.hasNext()) {
		DiskFileItem item = iter.next();
	
			if(item.isFormField()) {
				//일반 텍스트 데이터
				String fieldName = item.getFieldName(); //input의 name속성
				String fieldValue = item.getString(Charset.forName("UTF-8"));
				
				System.out.println("fieldName : " + fieldName);
				System.out.println("fieldValue : " + fieldValue);
				
				//엔티티 초기화
				if(fieldName.equals("title")) {
					file.setTitle(fieldValue);
				} else if(fieldName.equals("name")) {
					file.setName(fieldValue);
				}
				
			} else { //첨부파일(파일 입력 필드)
				
				//확장자 추출
				String fileName = item.getName();
				int idx = fileName.lastIndexOf(".");
				String ext = fileName.substring(idx);
				
				//랜덤 파일명 생성
				String savedFileName = UUID.randomUUID().toString() + ext;
		
				//엔티티 초기화
				file.setoName(fileName);
				file.setsName(savedFileName);
				
				// 파일 저장
				item.write(Path.of(uploadPath, savedFileName));
			}
		}
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	System.out.println(file);
	
	//데이터베이스 처리
	try {
		Context initCtx = new InitialContext();
		Context ctx = (Context) initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		
		String sql = "INSERT INTO `file`(`title`,`name`,`oName`,`sName`) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, file.getTitle());
		pstmt.setString(2, file.getName());
		pstmt.setString(3, file.getoName());
		pstmt.setString(4, file.getsName());
		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	response.sendRedirect("../2.fileDownload.jsp");
%>
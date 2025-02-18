<%@page import="org.jdom2.output.Format"%>
<%@page import="org.jdom2.output.XMLOutputter"%>
<%@page import="org.jdom2.Element"%>
<%@page import="org.jdom2.Document"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.User1"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
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
			User1 user = new User1();
			user.setUid(rs.getString(1));
			user.setName(rs.getString(2));
			user.setHp(rs.getString(3));
			user.setAge(rs.getInt(4));
			users.add(user);
		}
		rs.close();
		stmt.close();
		conn.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	//XML 생성
	Document doc = new Document();
	Element elUsers = new Element("users"); //태그명
	
	for(User1 user : users) {
		Element elUser = new Element("user"); //태그명
		Element elUid = new Element("uid"); //태그명
		Element elName = new Element("name");  //태그명
		Element elHp = new Element("hp");  //태그명
		Element elAge = new Element("age");  //태그명
		 
		elUid.setText(user.getUid());
		elName.setText(user.getName());
		elHp.setText(user.getHp());
		elAge.setText("" + user.getAge());
		
		elUser.addContent(elUid);
		elUser.addContent(elName);
		elUser.addContent(elHp);
		elUser.addContent(elAge);
		
		elUsers.addContent(elUser);
	}
	
	doc.setRootElement(elUsers);
	
	//XML 출력 서식 설정
	XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
	String xml = outputter.outputString(doc);
	
	//XML 출력
	out.println(xml);
				
%>
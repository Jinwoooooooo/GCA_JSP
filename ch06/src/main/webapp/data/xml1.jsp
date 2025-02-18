<%@ page language="java" contentType="text/xml; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	//XML 문자열 생성
	String xml = "<user>";
			
		   xml += "<uid>PHAM</uid>";
		   xml += "<name>하니</name>";
		   xml += "<age>21</age>";
		   xml += "<addr>서울</addr>";
		   xml += "</user>";

	out.println(xml);
				
%>
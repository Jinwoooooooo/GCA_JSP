<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//JSON 문자열 생성
	String json = "{\"uid\":\"팜\", \"name\":\"하니\", \"age\":\"21\", \"addr\":\"서울\"}";
	
	//JSON 출력
	out.println(json);

%>
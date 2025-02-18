<%@page import="com.google.gson.Gson"%>
<%@page import="entity.User1"%>
<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//객체 생성
	User1 user1 = new User1();
	user1.setUid("PHAM");
	user1.setName("하니");
	user1.setHp("010-1100-2200");
	user1.setAge(21);
	
	//JSON 문자열 생성
	Gson gson = new Gson();
	String strJson = gson.toJson(user1);
	
	System.out.println(strJson);
	
	//JSON 출력
	out.println();

%>
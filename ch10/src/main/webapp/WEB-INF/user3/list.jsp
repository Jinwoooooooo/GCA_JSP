<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user3::list</title>
</head>
<body>
	<h3>user3 목록</h3>
	<a href="/ch10">처음으로</a>
	<a href="/ch10/user3/register.do">등록하기</a>
	
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>직업</th>
			<th>주소</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${dtos}">
		<tr>
			<td>${dto.uid}</td>
			<td>${dto.name}</td>
			<td>${dto.hp}</td>
			<td>${dto.age}</td>
			<td>${dto.job}</td>
			<td>${dto.addr}</td>
			<td>
				<a href="/ch10/user3/modify.do?uid=${dto.uid}">수정</a>
				<a href="/ch10/user3/remove.do?uid=${dto.uid}">삭제</a>
			</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>
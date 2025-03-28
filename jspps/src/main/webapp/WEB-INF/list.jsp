<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="f" uri="jakarta.tags.functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User1 목록</title>
</head>
<body>
	<h3>User1 목록</h3>
	<a href="/jspps">처음으로</a>
	<a href="/jspps/register.do">등록하기</a>
	
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${dtos}">
		<tr>
			<td>${dto.uid}</td>
			<td>${dto.name}</td>
			<td>${dto.hp}</td>
			<td>${dto.age}</td>
			<td>
				<a href="/jspps/modify.do?uid=${dto.uid}">수정</a>
				<a data-uid="${dto.uid}" id="remove">삭제</a>
			</td>
		</tr>
		</c:forEach>
	</table>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
		    const remove = document.getElementById("remove");
		
		    remove.addEventListener('click', function() {
		        const check = confirm("삭제하시겠습니까?");
		        
		        if(check) {
		            const uid = remove.getAttribute("data-uid");
		            location.href = "/jspps/remove.do?uid=" + uid;   
		        }
		    });
		});
	</script>
</body>
</html>
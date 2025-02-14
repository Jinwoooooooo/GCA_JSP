<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer::list</title>
</head>
<body>
	<h3>고객 목록</h3>
	<a href="/ch06/shop">메인 이동</a>
	<a href="/ch06/shop/customer/register.jsp">고객 등록</a>
	
	<table border="1">
		<tr>
			<th>고객아이디</th>
			<th>고객명</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>가입일</th>
			<th>관리</th>
		</tr>
		<tr>
			<td>123</td>
			<td>woo</td>
			<td>010-123-123</td>
			<td>부산</td>
			<td>2025-02-14</td>
			<td>
				<a href="#">수정</a>
				<a href="#">삭제</a>
			</td>
		</tr>
	</table>
	
</body>
</html>
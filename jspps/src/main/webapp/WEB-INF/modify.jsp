<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User1 수정</title>
</head>
<body>
	<h3>User1 수정</h3>
	<a href="/jspps">처음으로</a>
	<a href="/jspps/list.do">목록이동</a>
	
	<form action="/jspps/modify.do" method="post">
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" value="${dto.uid}" placeholder="아이디 입력" readonly></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${dto.name}" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="${dto.hp}" placeholder="휴대폰 번호 입력"></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" value="${dto.age}" placeholder="나이 입력"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
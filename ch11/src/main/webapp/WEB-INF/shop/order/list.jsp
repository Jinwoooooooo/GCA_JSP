<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order::list</title>
</head>
<body>
	<h3>주문 목록</h3>
	<a href="/ch06/shop">메인이동</a>
	<a href="/ch06/shop/product/list.jsp">상품목록</a>
	
	<table border="1">
		<tr>
			<th>주문번호</th>
			<th>주문상품</th>
			<th>주문수량</th>
			<th>제조사</th>
			<th>주문자</th>
			<th>휴대폰</th>
			<th>주문일자</th>
		</tr>
		<tr>
			<td>1</td>
			<td>123</td>
			<td>331</td>
			<td>오뚜기</td>
			<td>나</td>
			<td>010-123-123</td>
			<td>2025-02-14</td>
		</tr>
	</table>
</body>
</html>
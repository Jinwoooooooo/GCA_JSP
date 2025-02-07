<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product::register</title>
</head>
<body>
	<h3>상품 목록</h3>
	<a href="/ch06/shop">메인 이동</a>
	<a href="/ch06/shop/product/list.jsp">상품 목록</a>
	
	<form action="/ch06/shop/product/proc/register.jsp" method="post">
		<table border="1">
			<tr>
				<td>상품명</td>
				<td><input type="text" name="prodName" placeholder="상품명 입력"></td>
			</tr>
			<tr>
				<td>재고량</td>
				<td><input type="text" name="stock" placeholder="재고량 입력"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" placeholder="가격 입력"></td>
			</tr>
			<tr>
				<td>제조사</td>
				<td><input type="text" name="company" placeholder="제조사 입력"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="상품 등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
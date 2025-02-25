<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty sessUser}">
	<jsp:forward page="./user/login.do"></jsp:forward>
</c:if>
<c:if test="${not empty sessUser}">
	<jsp:forward page="./article/list.do"></jsp:forward>
</c:if>
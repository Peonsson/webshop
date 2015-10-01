<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cart</title>
</head>
<body>
		<div id="menu">
			<a class="menuButton" href="/WebShop/">Shop</a>
			<% if (session.getAttribute("loggedInUser") != null) { %>
			<a class="menuButton" href="/WebShop/cart?userId=<%out.print(session.getAttribute("loggedInUser"));%>">Cart</a>
			<% } %>

			<%
				if (session.getAttribute("loggedInUser") != null) {
			%><a class="logoutButton" href="/WebShop/logout">Logout</a>
			<%
				} else {
			%><a class="logoutButton" href="/WebShop/login">Login</a>
			<%
				}
			%>
		</div>
	<table id="itemList">
		<tr>
			<td>Name</td>
			<td>Quantity</td>
			<td>Price</td>
		</tr>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item.name}</td>
				<td>${item.quantity}</td>
				<td>${item.price}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
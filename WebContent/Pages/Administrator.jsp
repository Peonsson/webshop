<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="menu">
		<a class="menuButton" href="/WebShop/">Shop</a>
		<%
			if (session.getAttribute("loggedInUser") != null) {
		%>
		<a class="menuButton"
			href="/WebShop/cart?userId=<%out.print(session.getAttribute("loggedInUser"));%>">Cart</a>
		<a class="menuButton"
			href="/WebShop/Orders?userId=<%out.print(session.getAttribute("loggedInUser"));%>">Orders</a>
		<%
			}

			if ((session.getAttribute("accessLevel") != null)
				&& ((int) session.getAttribute("accessLevel") > 1)) {
		%>
		<a class="menuButton" href="/WebShop/Administration">Administration</a>
		<%
			}

			if (session.getAttribute("loggedInUser") != null) {
		%>
		<a class="menuButton" href="/WebShop/Settings">Settings</a> <a
			class="menuButton" href="/WebShop/logout">Logout</a>
		<%
			} else {
		%>
		<a class="menuButton" href="/WebShop/login">Login</a>
		<%
			}
		%>
	</div>
	<br>
	Select item to edit
	<table>
		<tr>
			<td>Name</td>
			<td>Quantity</td>
			<td>Price</td>
			<td>Category</td>
		</tr>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item.name}</td>
				<td>${item.quantity}</td>
				<td>${item.price}</td>
				<td>${item.category}</td>
				<td>
					<form method="post" action="ItemEditor">
						<input type="hidden" name="itemId" value="${item.itemId}" />
						<button>Edit</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<%
		if ((int) session.getAttribute("accessLevel") > 2) {
	%>
	<br>
	Select user to edit
	<table>
		<tr>
			<td>User ID</td>
			<td>Name</td>
			<td>Access Level
		</tr>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.userId}</td>
				<td>${user.username}</td>
				<td>${user.accessLevel}</td>
				<td>
					<form method="post" action="UserEditor">
						<input type="hidden" name="userId" value="${user.userId}" />
						<button>Edit</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<br> Add new user:
	<form method="post" action="AddUser">
		Username <input type="text" name="username"><br /> Password <input
			type="password" name="password"><br /> Access level <input
			type="text" name="accessLevel"><br />
		<button>Add</button>
	</form>

	<%
		}
	
		else if ((int) session.getAttribute("accessLevel") == 2) {
	%>
		
	<% } %>
	
	<br> Add new item:
	<form method="post" action="AddItemToShop">
	
		Name <input type="text" name="name"><br/>
		Quantity <input type="text" name="quantity"><br/>
		Price <input type="text" name="price"><br/>
		Category <input type="text" name="category"><br/>
		
		<button>Add</button>
	
	</form>
	
</body>
</html>
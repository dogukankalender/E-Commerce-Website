<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.util.*"%>
    
<%@page import="eticaret.model.*"%>

<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/header.jsp"%>
<title>Doom</title>
</head>
<body>
	<%@include file="/include/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Kullanici Girisi</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Mail Adresi</label> 
						<input type="email" name="login-email" class="form-control" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label>Sifre</label> 
						<input type="password" name="login-password" class="form-control" placeholder="Password">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-dark">Giris</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="/include/footer.jsp"%>
</body>
</html>
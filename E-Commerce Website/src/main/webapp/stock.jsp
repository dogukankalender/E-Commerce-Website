	
<%@page import="eticaret.connection.DBConnection"%>
<%@page import="eticaret.dao.ProductDao"%>
<%@page import="eticaret.model.*"%>
<%@page import="java.util.*"%>
	

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DBConnection.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doom</title>

    <link rel="stylesheet" href="assets/css/style.css">

<%@include file="/include/header.jsp"%>
<title>Doom</title>


</head>
<body>
	<%@include file="/include/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">Tum Urunler</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" width = "150px" height = "300px" src="<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Stok: <%=p.getStock() %></h6>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>

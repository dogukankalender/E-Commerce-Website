<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="eticaret.connection.DBConnection"%>
<%@page import="eticaret.dao.OrderDao"%>
<%@page import="eticaret.dao.ProductDao"%>
<%@page import="eticaret.model.*"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DBConnection.getConnection());
		orders = orderDao.userOrders(auth.getId());
	}else{
		response.sendRedirect("login.jsp");
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
		<div class="card-header my-3">Tum Siparisler</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Tarih</th>
					<th scope="col">Urun Adi</th>
					<th scope="col">Kategori</th>
					<th scope="col">Miktar</th>
					<th scope="col">Fiyat</th>
					<th scope="col">Iptal</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Siparis Iptal</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>
	<%@include file="/include/footer.jsp"%>
</body>
</html>
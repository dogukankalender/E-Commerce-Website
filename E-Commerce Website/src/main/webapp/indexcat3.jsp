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
List<Product> products = pd.getAllCat3();
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
		<div class="card-header my-3">Urunler</div>
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
						<h6 class="price">Fiyat: $<%=p.getPrice() %></h6>
						<h6 class="price">Stok: <%=p.getStock() %></h6>
						<h6 class="category">Kategori: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Sepete Ekle</a> 
							<a class="btn btn-dark" href="order-now?quantity=1&id=<%=p.getId()%>">Satin Al</a>
						</div>
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


 <div class="footer-dark">
        <footer>
            <div class="container">
                <div class="row">

                    <div class="col-sm-6 col-md-4 item">
                        <h3>Grup</h3>
                        <ul>
                            <li> <a> 19060419@stu.omu.edu.tr</a></li>
                            <li> <a> 20060326@stu.omu.edu.tr</a></li>

                            
                        </ul>
                    </div>
                    <div class="col-md-7 item text">
                        <h3>Doom</h3>
                        <p>		Web Programla Projesi Odevidir. </p>
                    </div>
                </div>
                <p class="copyright">Doom © 2023</p>
            </div>
        </footer>
    </div>


	<%@include file="/include/footer.jsp"%>
</body>
</html>
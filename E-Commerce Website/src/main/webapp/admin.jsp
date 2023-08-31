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
<style>
div2 {
  width: 700px;
  padding: 10px;
  margin: 100px;
}
</style>



</head>
<body>
	<%@include file="/include/navbar.jsp"%>
 <div class="container col-lg-6">
  <h1 class="text-center">Urun Kayit </h1>
  <div class="card">
   <div class="card-body">
    <form method="post" class="form-group" action="uploadServlet"
     enctype="multipart/form-data">
     <div class="form-group">
      <label for="first name">Urun Adi: </label> <input type="text"
       class="form-control" name="name" size="50" />
     </div>
          <div class="form-group">
      <label for="first name">Kategori: </label> <input type="text"
       class="form-control" name="category" size="50" />
     </div>
          <div class="form-group">
      <label for="first name">Fiyat: </label> <input type="Number"
       class="form-control" name="price" size="50" />
     </div>
     <div class="form-group">
      <label for="last name">Stok: </label> <input type="Number"
       class="form-control" name="stock" size="50" />
     </div>

     <div class="form-group">
      <label for="Profile Photo">Resim:</label> <input
       type="text" name="image" size="50" />
     </div>
     <input type="submit" value="Kaydet" class="btn btn-success">
    </form>
   </div>
  </div>
 </div>
 
 <div class="container col-lg-6">
  <h1 class="text-center">Stok Guncellemesi </h1>
  <div class="card">
   <div class="card-body">
    <form method="post" class="form-group" action="uploadServlet"
     enctype="multipart/form-data">
     <div class="form-group">
      <label for="first name">Urun Adi: </label> <input type="text"
       class="form-control" name="name" size="50" />
     <div class="form-group">
      <label for="last name">Guncel Stok: </label> <input type="Number"
       class="form-control" name="stock" size="50" />
     </div>
     <input type="submit" value="Kaydet" class="btn btn-success">
    </form>
   </div>
  </div>
 </div>
        
</body>
</html>
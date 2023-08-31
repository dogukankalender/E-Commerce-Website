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
<script> 
function validate()
{ 
     var name = document.form.name.value;
     var email = document.form.email.value;
     var password = document.form.password.value;
     var conpassword= document.form.conpassword.value;
     
     if (name==null || name=="")
     { 
     alert("Full Name can't be blank"); 
     return false; 
     }
     else if (email==null || email=="")
     { 
     alert("Email can't be blank"); 
     return false; 
     }
     else if(password.length<6)
     { 
     alert("Password must be at least 6 characters long."); 
     return false; 
     } 
     else if (password!=conpassword)
     { 
     alert("Confirm Password should match with the Password"); 
     return false; 
     } 
 } 
</script> 
</head>
<body>
	<%@include file="/include/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Registration</div>
			<div class="card-body">
				<form action="RegisterServlet" method="post" onsubmit="return validate()">
					<div class="form-group">
						<label>Isim</label> 
						<input type="text" name="name" class="form-control" placeholder="Full Name">
					</div>
					<div class="form-group">
						<label>Mail Adresi</label> 
						<input type="email" name="email" class="form-control" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label>Sifre</label> 
						<input type="password" name="password" class="form-control" placeholder="Password">
					</div>
					<div class="form-group">
						<label>Sifre Tekrarla </label> 
						<input type="password" name="conpassword" class="form-control" placeholder="Password">
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-dark">Kayit Ol</button>
					</div>
				</form>
				
			</div>
		</div>
	</div>

	<%@include file="/include/footer.jsp"%>


</body>
</html>
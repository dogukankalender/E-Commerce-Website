<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Accordion Menu</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link class="w3-black" rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <style>
    .accordion-content {
      display: none;
    }
  </style>
</head>
<body>

<div class="w3-sidebar w3-bar-block w3-card w3-dark-grey w3-animate-left" style="display:none" id="leftMenu">
  <button onclick="closeLeftMenu()" class="w3-bar-item w3-button w3-large">Kapat &times;</button>
  
  

  <!-- Other menu items -->
  <a href="index.jsp" class="w3-bar-item w3-button"><button class="btn"><i class="fa fa-home"></i> Ana Sayfa</button></a>
  
  <!-- Accordion Menu -->
  <button class="w3-bar-item w3-button w3-block w3-left-align" onclick="toggleAccordion('categories')">
    Urun Kategoriler <i id="arrow-categories" class="fa fa-caret-down"></i>
  </button>
  <div id="categories" class="accordion-content">
    <!-- Add your categories here -->
	<a href="indexcat1.jsp" class="w3-bar-item w3-button">Giyim</a>
	<a href="indexcat2.jsp" class="w3-bar-item w3-button">Figur</a>
	<a href="indexcat3.jsp" class="w3-bar-item w3-button">Aksesuar</a>
  </div>
  
  <a href="cart.jsp" class="w3-bar-item w3-button"> <span class="badge badge-danger">${cart_list.size()}</span> <button class="btn"><i class="fa fa-cart-shopping"></i> Sepet</button></a>
  
  <% if (auth != null) { %>
    <a href="order.jsp" class="w3-bar-item w3-button"><button class="btn"><i class="fa-solid fa-bag-shopping"></i> Siparisler</button></a>
    <a href="admin.jsp" class="w3-bar-item w3-button"><button class="btn"><i class="fa-solid fa-toolbox"></i> Yonetim Paneli</button></a>
    <a href="log-out" class="w3-bar-item w3-button"><button class="btn"><i class="fa-solid fa-right-from-bracket"></i> Cikis</button></a>
  <% } else { %>
    <a href="login.jsp" class="w3-bar-item w3-button"><button class="btn"><i class="fa-solid fa-right-to-bracket"></i> Giris</button></a>
    <a href="register.jsp" class="w3-bar-item w3-button"><button class="btn"><i class="fa-solid fa-address-card"></i> Kayit Ol</button></a>
  <% } %>
</div>

<div class="w3-black">
  <a class="navbar-brand" href="index.jsp">Doom</a>
  <button class="w3-button w3-black w3-xlarge w3-left" onclick="openLeftMenu()">&#9776;</button>
  <div class="w3-container w3-black"></div>
</div>

<script>
function openLeftMenu() {
  document.getElementById("leftMenu").style.display = "block";
}

function closeLeftMenu() {
  document.getElementById("leftMenu").style.display = "none";
}

function toggleAccordion(id) {
  var accordion = document.getElementById(id);
  var arrow = document.getElementById("arrow-" + id);

  if (accordion.style.display === "block") {
    accordion.style.display = "none";
    arrow.classList.remove("fa-caret-up");
    arrow.classList.add("fa-caret-down");
  } else {
    accordion.style.display = "block";
    arrow.classList.remove("fa-caret-down");
    arrow.classList.add("fa-caret-up");
  }
}
</script>

</body>
</html>

package eticaret.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import eticaret.connection.DBConnection;
import eticaret.dao.OrderDao;
import eticaret.dao.ProductDao;
import eticaret.model.Cart;
import eticaret.model.Order;
import eticaret.model.Product;
import eticaret.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
            User auth = (User) request.getSession().getAttribute("auth");
            if (cart_list != null && auth != null) {
                for (Cart c : cart_list) {
                    Order order = new Order();
                    order.setId(c.getId());
                    order.setUid(auth.getId());
                    order.setQunatity(c.getQuantity());
                    order.setDate(formatter.format(date));

                    OrderDao oDao = new OrderDao(DBConnection.getConnection());
                    boolean result = oDao.insertOrder(order);
                    if (!result)
                        break;

                    // Ürün stoğunu güncelle
                    updateProductStock(c.getId(), c.getQuantity());
                }
                cart_list.clear();
                response.sendRedirect("index.jsp");
            } else {
                if (auth == null) {
                    response.sendRedirect("login.jsp");
                }
                response.sendRedirect("cart.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    // Ürün stoğunu güncellemek için metod
    private void updateProductStock(int productId, int quantity) throws SQLException, ClassNotFoundException {
        ProductDao productDao = new ProductDao(DBConnection.getConnection());
        Product product = productDao.getSingleProduct(productId);

        if (product != null) {
            double newStock = product.getStock() - quantity;
            product.setStock(newStock);
            productDao.updateProduct(product);
        }
    }
}

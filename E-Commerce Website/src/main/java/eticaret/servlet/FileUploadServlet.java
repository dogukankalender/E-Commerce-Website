package eticaret.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215) // upload file's size up to 16MB
public class FileUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String dbURL = "jdbc:mysql://localhost:3306/ecommerce_cart";
    private String dbUser = "root";
    private String dbPass = "password";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String price = request.getParameter("price");
        String stock = request.getParameter("stock");
        String image = request.getParameter("image");

        Connection conn = null;
        String message = null;

        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // Check if the product already exists in the database
            String selectQuery = "SELECT * FROM products WHERE name = ?";
            PreparedStatement selectStatement = conn.prepareStatement(selectQuery);
            selectStatement.setString(1, name);
            ResultSet resultSet = selectStatement.executeQuery();

            if (resultSet.next()) {
                // Product exists, update the stock quantity
                String updateQuery = "UPDATE products SET stock = ? WHERE name = ?";
                PreparedStatement updateStatement = conn.prepareStatement(updateQuery);
                updateStatement.setString(1, stock);
                updateStatement.setString(2, name);

                int row = updateStatement.executeUpdate();
                if (row > 0) {
                    message = "Stock quantity updated successfully";
                }
            } else {
                // Product does not exist, insert a new product
                String insertQuery = "INSERT INTO products (name, category, price, stock, image) values (?, ?, ?, ?, ?)";
                PreparedStatement insertStatement = conn.prepareStatement(insertQuery);
                insertStatement.setString(1, name);
                insertStatement.setString(2, category);
                insertStatement.setString(3, price);
                insertStatement.setString(4, stock);
                insertStatement.setString(5, image);

                int row = insertStatement.executeUpdate();
                if (row > 0) {
                    message = "New product added successfully";
                }
            }

        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            request.setAttribute("Message", message);
            getServletContext().getRequestDispatcher("/message.jsp").forward(request, response);
        }
    }
}
package eticaret.dao;


import java.sql.*;
import java.util.*;

import eticaret.connection.DBConnection;
import eticaret.model.Cart;
import eticaret.model.Product;

public class ProductDao {
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    

	public ProductDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	public List<Product> getAllProducts() {
        List<Product> product = new ArrayList<>();
        try {

            query = "select * from products";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setStock(rs.getDouble("stock"));
                row.setImage(rs.getString("image"));

                product.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return product;
    }
	
	public List<Product> getAllCat1() {
        List<Product> product = new ArrayList<>();
        try {

            query = "select * from products where category='Giyim'";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setStock(rs.getDouble("stock"));
                row.setImage(rs.getString("image"));

                product.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return product;
    }
	
	public List<Product> getAllCat2() {
        List<Product> product = new ArrayList<>();
        try {

            query = "select * from products where category='Figur'";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setStock(rs.getDouble("stock"));
                row.setImage(rs.getString("image"));

                product.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return product;
    }
	
	public List<Product> getAllCat3() {
        List<Product> product = new ArrayList<>();
        try {

            query = "select * from products where category='Aksesuar'";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next()) {
            	Product row = new Product();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setCategory(rs.getString("category"));
                row.setPrice(rs.getDouble("price"));
                row.setStock(rs.getDouble("stock"));
                row.setImage(rs.getString("image"));

                product.add(row);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return product;
    }
	
	
	 public Product getSingleProduct(int id) {
		 Product row = null;
	        try {
	            query = "select * from products where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	            	row = new Product();
	                row.setId(rs.getInt("id"));
	                row.setName(rs.getString("name"));
	                row.setCategory(rs.getString("category"));
	                row.setPrice(rs.getDouble("price"));
	                row.setStock(rs.getDouble("stock"));
	                row.setImage(rs.getString("image"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	        }

	        return row;
	    }
	
	public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select price from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        sum+=rs.getDouble("price")*item.getQuantity();
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }
	
	 public void updateProduct(Product product) throws SQLException {
	        String sql = "UPDATE products SET name = ?, category = ?, price = ?, stock = ?, image = ? WHERE id = ?";
	        PreparedStatement statement;
			try {
				statement = DBConnection.getConnection().prepareStatement(sql);
		        statement.setString(1, product.getName());
		        statement.setString(2, product.getCategory());
		        statement.setDouble(3, product.getPrice());
		        statement.setDouble(4, product.getStock());
		        statement.setString(5, product.getImage());
		        statement.setInt(6, product.getId());

		        statement.executeUpdate();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }

    
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> product = new ArrayList<>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    while (rs.next()) {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setName(rs.getString("name"));
                        row.setCategory(rs.getString("category"));
                        row.setPrice(rs.getDouble("price")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        product.add(row);
                    }

                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return product;
    }
}

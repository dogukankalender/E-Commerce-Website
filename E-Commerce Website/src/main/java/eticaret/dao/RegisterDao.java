package eticaret.dao;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import eticaret.model.*;
import eticaret.connection.DBConnection;
 
public class RegisterDao { 
     public String registerUser(RegisterBean registerBean) throws ClassNotFoundException
     {
         String name = registerBean.getName();
         String email = registerBean.getEmail();
         String password = registerBean.getPassword();
         
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.getConnection();
             String query = "insert into users(name,email,password) values (?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
             preparedStatement.setString(1, name);
             preparedStatement.setString(2, email);
             preparedStatement.setString(3, password);
             
             int i= preparedStatement.executeUpdate();
             
             if (i!=0)  //Just to ensure data has been inserted into the database
             return "SUCCESS"; 
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }       
         return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
     }
}
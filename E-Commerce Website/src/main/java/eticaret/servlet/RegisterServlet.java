package eticaret.servlet;

import java.io.IOException;
 
import eticaret.model.*;
import eticaret.dao.RegisterDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
 
public class RegisterServlet extends HttpServlet {
 
     /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
     }
 
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
         String name = request.getParameter("name");
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         
         RegisterBean registerBean = new RegisterBean();
        //Using Java Beans - An easiest way to play with group of related data
         registerBean.setName(name);
         registerBean.setEmail(email);
         registerBean.setPassword(password); 
         
         RegisterDao registerDao = new RegisterDao();
         
        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
         String userRegistered = null;
		try {
			userRegistered = registerDao.registerUser(registerBean);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
         if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
         {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
         }
         else   //On Failure, display a meaningful message to the User.
         {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/register.jsp").forward(request, response);
         }
     }
}
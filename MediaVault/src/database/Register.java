package database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 
 * @author 20155075
 * This servlet works for registering new user.
 * The ajax call this at the login.js file.
 * This servlet only response OK or NOT, means successfully registering or this user name was been used already.
 */
@WebServlet("/Register")
public class Register extends HttpServlet{
    private static final long serialVersionUID = 1L;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{


    	String id=request.getParameter("id");
    	String password=request.getParameter("password");

   
    	String url = "jdbc:derby:library";
		
	    Properties userInfo = new Properties();
	    userInfo.put("user", "root");
	    userInfo.put("password", "password");
	    
	    Connection connection;
		try {
	
		//Get connection with the database.
		connection = DriverManager.getConnection(url, userInfo);
		Statement statement = connection.createStatement();
		String query=String.format("SELECT COUNT(*) FROM users WHERE id='%s'",id);
		int sum = 0;

		
		ResultSet rs=statement.executeQuery(query);
		if(rs.next()){
			sum=rs.getInt(1);    // count how many users uses this id, actually, it will only be 1 or 0
			
		}
		
		//The sum is not 0, so a user has used this ID, response "NOT".
		if(sum!=0) {
			PrintWriter out = response.getWriter();
	        out.print("NOT");
		}
		//sum is 0, so the user can register this ID
		else{
			//Add this user's information into database
			String query2=String.format("INSERT INTO users VALUES ('%s','%s')", id,password);
			Statement statement2=connection.createStatement();
			statement2.executeUpdate(query2);
			
			PrintWriter out = response.getWriter();
			out.print("OK");
		}
			
		connection.close();
    
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
}

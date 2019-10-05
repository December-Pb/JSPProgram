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
 * @author 20155075 This servlet is used to handle the ajax request while trying
 *         log in The servlet will find the user in database. If it can't find
 *         the user id or find out the id but check out the password is wrong,
 *         it will return message "not", then you can't log in If id and
 *         password are both exist and right, it will reply "OK", then you enter
 *         in
 *
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String password = request.getParameter("password");

		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection;
		try {

			// Get the connection with the database
			connection = DriverManager.getConnection(url, userInfo);
			Statement statement = connection.createStatement();
			String query = String.format("SELECT * FROM users WHERE id='%s' AND password='%s'", id, password);

			ResultSet rs = statement.executeQuery(query);
			if (rs.next()) {
				PrintWriter out = response.getWriter();
				out.print("OK");
			} else {
				PrintWriter out = response.getWriter();
				out.print("NOT");
			}

			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
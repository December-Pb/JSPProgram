package database;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 *
 *         This sevlet is invoked by an ajax request. It delete the piece of
 *         data in database.
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String tbn = request.getParameter("table_name");

		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection;
		try {

			connection = DriverManager.getConnection(url, userInfo);
			Statement statement = connection.createStatement();
			String query = String.format("DELETE FROM %s WHERE name='%s'", tbn, name);
			statement.executeUpdate(query);
			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();
		String resMessage = String.format("Delete %s successfully", name);
		out.print(resMessage);
	}
}
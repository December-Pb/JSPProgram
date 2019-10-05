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
 * @author 20155075 This servlet works for judging if the pagenum user input is
 *         reachable, in other word, the medis has enough pages. For example,
 *         the database has only 10 pages, enter more than 10 or less than 1 is
 *         illegal, response is "NOT". Only when the pagenum is in range, it
 *         will set response "OK".
 * 
 */
@WebServlet("/Skip")
public class Skip extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String url = request.getParameter("url");
		String pagenum = request.getParameter("pagenum");

		String table_name, genre;
		// Judge if the page contains all video/music of a media type, or just a
		// genre of a media type.
		if (url.contains("=")) {
			String type = url.split("=")[1];
			genre = type.substring(0, type.length() - 1);
		} else {
			genre = "any";
		}

		// Get the media type of the pages
		if (url.startsWith("tv")) {
			table_name = "tv";
		} else if (url.startsWith("movie")) {
			table_name = "movie";
		} else {
			table_name = "music";
		}

		String dburl = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection;
		int sum = 0;
		try {

			connection = DriverManager.getConnection(dburl, userInfo);
			Statement statement = connection.createStatement();
			String query;

			if (!genre.equals("any"))
				// Select only one genre of the type of the media
				query = String.format("SELECT COUNT(DISTINCT name) FROM %s WHERE genre='%s' ", table_name, genre);
			else
				// Select all of the type of the media, with all genre
				query = String.format("SELECT COUNT(DISTINCT name) FROM %s ", table_name);

			ResultSet r = statement.executeQuery(query);

			if (r.next())
				sum = r.getInt(1);

			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		PrintWriter out = response.getWriter();

		if (sum > Integer.parseInt(pagenum) * 12 - 12 && Integer.parseInt(pagenum) >= 1)
			out.print("OK");
		else
			out.println("NOT");

	}
}

package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class Movie {

	public static void write(String[] details) throws SQLException {

		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection = DriverManager.getConnection(url, userInfo);

		Statement statement = connection.createStatement();
		String query = String.format("INSERT INTO movie VALUES ('%s','%s','%s','%s','%s','%s','%s')", details[0],
				details[1], details[2], details[3], details[4], details[5], details[6]);

		statement.executeUpdate(query);

		connection.close();

	}

	public static String[] getOneMovie(String movie_name) throws SQLException {
		String urls[] = new String[4];
		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection = DriverManager.getConnection(url, userInfo);

		Statement statement = connection.createStatement();
		String query = String.format("SELECT * FROM movie WHERE name='%s'", movie_name);
		ResultSet rs = statement.executeQuery(query);
		if (rs.next()) {
			urls[0] = rs.getString("cover");
			urls[1] = rs.getString("summary");
			urls[2] = rs.getString("url");
			urls[3] = rs.getString("name");
		}

		return urls;

	}

}

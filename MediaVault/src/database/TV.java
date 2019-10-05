package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

/**
 * 
 * @author 20155075
 * 
 *         This class has three functions. Works for tv part. One is used for
 *         write tv show's information into database. The other two are used for
 *         make up the page for playing tv video and get all episodes list.
 *
 */
public class TV {

	/*
	 * This is the writing into database function
	 */
	public static void write(String[] details) throws SQLException {

		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection = DriverManager.getConnection(url, userInfo);

		Statement statement = connection.createStatement();
		String query = String.format("INSERT INTO tv VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s')", details[0],
				details[1], details[2], details[3], details[4], details[5], details[6], details[7], details[8]);

		statement.executeUpdate(query);
		connection.close();

	}

	/*
	 * This function is used to get needed details for making up playing page
	 */
	public static String[] getPlayPage(String movie_name, String episode) throws SQLException {
		String datas[] = new String[3];
		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection = DriverManager.getConnection(url, userInfo);

		Statement statement = connection.createStatement();
		String query = String.format("SELECT * FROM tv WHERE name='%s' AND episode='%s'", movie_name, episode);
		ResultSet rs = statement.executeQuery(query);
		if (rs.next()) {
			datas[0] = rs.getString("cover");
			datas[1] = rs.getString("summary");
			datas[2] = rs.getString("url");
		}

		return datas;

	}

	// This function is used to get all episodes of one tv show to filled the
	// playing page
	public static ArrayList<String> getEpisodesList(String TVname) throws SQLException {
		ArrayList<String> list = new ArrayList<>();

		String datas[] = new String[4];
		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection = DriverManager.getConnection(url, userInfo);

		Statement statement = connection.createStatement();
		String query = String.format("SELECT episode FROM tv WHERE name='%s'", TVname);
		ResultSet rs = statement.executeQuery(query);

		while (rs.next()) {
			list.add(rs.getString("episode"));
		}
		return list;
	}
}

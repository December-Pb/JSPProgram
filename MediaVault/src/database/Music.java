package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * 
 * @author 20155075
 *
 *         This class is used to reply the request from jsp page. The write
 *         method will write the new uploaded music.
 */
public class Music {

	public static void write(String[] details) throws SQLException {

		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection = DriverManager.getConnection(url, userInfo);

		Statement statement = connection.createStatement();
		String query = String.format("INSERT INTO music VALUES ('%s','%s','%s','%s','%s')", details[0], details[1],
				details[2], details[3], details[4]);

		statement.executeUpdate(query);
		connection.close();

	}

}

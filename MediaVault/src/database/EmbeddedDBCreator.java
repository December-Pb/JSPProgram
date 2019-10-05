package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * 
 * @author 20155075 
 *			This class is used to initial the database. For the first
 *         time running this web project, it will create the database and insert
 *         some example data.
 */
public class EmbeddedDBCreator {

	private String driver = "org.apache.derby.jdbc.EmbeddedDriver";
	private String protocol = "jdbc:derby:";
	private String username = "root";
	private String password = "password";
	private String dbName = "library";
	private Properties userInfo;

	public EmbeddedDBCreator() {
		userInfo = new Properties();
		userInfo.put("user", username);
		userInfo.put("password", password);
	}

	public void createDatabase() {

		try {

			Class.forName(driver);
			String dbUrl = protocol + dbName + ";create=true";
			Connection connection = DriverManager.getConnection(dbUrl, userInfo);

			Statement statement = connection.createStatement();
			String tableDescription1 = String
					.format("CREATE TABLE music" + "(name VARCHAR(25), summary VARCHAR(200),genre VARCHAR(10), "
							+ "cover VARCHAR(150),url VARCHAR(150))");
			statement.execute(tableDescription1);
			System.out.println("Creating the database");

			String tableDescription2 = String.format("CREATE TABLE movie"
					+ "(name VARCHAR(25), genre VARCHAR(11),summary VARCHAR(2000),rating VARCHAR(2),duration VARCHAR(50), "
					+ "cover VARCHAR(150),url VARCHAR(150))");
			statement.execute(tableDescription2);

			String tableDescription3 = String.format("CREATE TABLE tv"
					+ "(name VARCHAR(25),episode VARCHAR(10),genre VARCHAR(11),summary VARCHAR(2000),rating VARCHAR(1),duration VARCHAR(30),"
					+ "actor_name VARCHAR(50),cover VARCHAR(100),url VARCHAR(100))");
			statement.execute(tableDescription3);

			String tableDescription4 = String.format("CREATE TABLE users" + "(id VARCHAR(10), password VARCHAR(18))");
			statement.execute(tableDescription4);

			String url = "jdbc:derby:library";

			Statement statement2 = connection.createStatement();
			String query2 = "INSERT INTO users VALUES ('SUN','20155017')";
			statement2.executeUpdate(query2);

			Statement statement3 = connection.createStatement();
			String query3 = "INSERT INTO users VALUES ('Dyen','20155075')";
			statement3.executeUpdate(query3);

			Statement statement4 = connection.createStatement();
			String query4 = "INSERT INTO music VALUES ('secret garden','Nice but sad music','blue','images/black.jpg','test_video/Secret Garden.mp3')";
			statement4.executeUpdate(query4);

			Statement statement5 = connection.createStatement();
			String query5 = "INSERT INTO movie VALUES ('Caribbean1','comedy','Jacks wonderful story','5','120mins','images/pirates.gif','test_video/pirates.mp4')";
			statement5.executeUpdate(query5);


			Statement statement6 = connection.createStatement();
			String query6 = "INSERT INTO tv VALUES('Criminal minds','1','suspense','Detective story','5','60mins','Thomas Gibson','images/Criminal minds.gif','test_video/Criminal minds.mp4')";

			statement6.executeUpdate(query6);

			connection.close();
		} catch (SQLException sqle) {
			sqle.printStackTrace();

		} catch (ClassNotFoundException e) {
			System.out.println("Driver class not found.");
		}
	}

}

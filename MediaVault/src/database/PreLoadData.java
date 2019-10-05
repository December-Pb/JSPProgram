package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

/**
 * 
 * @author 20155075 This class is used to reply the request from jsp page. It
 *         has three function. The three main pages, tv menu, movies menu and
 *         music menu ,will load data at here from database. The details gotten
 *         from here is used to make up the pages, especially the urls.
 *
 */
public class PreLoadData {

	/*
	 * This function is used to reply the details to make up music and movie
	 * menu. The parameters includes the genre of the page.
	 */
	public static String[] getData(String genre, String page, String column, String tableName) throws SQLException {

		String[] data = new String[12];
		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection = DriverManager.getConnection(url, userInfo);
		Statement statement = connection.createStatement();

		String query = null;
		if (genre != null)
			query = String.format("SELECT %s FROM %s WHERE genre='%s' ", column, tableName, genre);
		else
			query = String.format("SELECT %s FROM %s", column, tableName);

		ResultSet resultSet = statement.executeQuery(query);

		int count = 0;
		int pagenum;
		if (page == null)
			pagenum = 1;
		else
			pagenum = Integer.parseInt(page);

		while (resultSet.next()) {
			String music_name = resultSet.getString(column);
			count++;
			if (count > (pagenum * 12 - 12) && count <= pagenum * 12)
				data[count % 12] = music_name;
		}
		connection.close();
		return data;

	}

	/*
	 * This function can tell the browser if the current page is the last page
	 * of the media type and certain genre
	 */
	public static boolean isLastPage(String genre, String page, String tableName) throws SQLException {
		boolean last = true;
		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection = DriverManager.getConnection(url, userInfo);
		Statement statement3 = connection.createStatement();
		String query;
		if (genre != null)
			query = String.format("SELECT DISTINCT COUNT(name) FROM %s WHERE genre='%s'", tableName, genre);
		else
			query = String.format("SELECT DISTINCT COUNT(name) FROM %s", tableName);

		ResultSet rs = statement3.executeQuery(query);

		if (rs.next()) {
			// This IF condition is used to test if this page is the last
			// page(Every page contains 12 video)
			if (page == null)
				page = "1";

			if (rs.getInt(1) > Integer.parseInt(page) * 12)
				last = false;

		}
		connection.close();
		return last;
	}

	/*
	 * Preloading tv shows is different from preloading musics or movies,
	 * because tv shows' episodes are in group So we have to select them out in
	 * group, or troubles may occurs.
	 */
	public static String[][] getTV(String genre, String page) throws SQLException {
		String[][] data = new String[5][12];

		String url = "jdbc:derby:library";

		Properties userInfo = new Properties();
		userInfo.put("user", "root");
		userInfo.put("password", "password");

		Connection connection = DriverManager.getConnection(url, userInfo);
		Statement statement = connection.createStatement();

		String query = null;
		if (genre != null)
			query = String.format("SELECT DISTINCT * FROM tv WHERE genre='%s'", genre);
		else
			query = String.format("SELECT DISTINCT * FROM tv ");

		ResultSet resultSet = statement.executeQuery(query);

		int count = 0;
		int pagenum;
		if (page == null)
			pagenum = 1;
		else
			pagenum = Integer.parseInt(page);

		/*
		 * This part of code may be hard to understand, I just want to get only
		 * one episode for every tv shows. The 'count' is used to test if I have
		 * get the page's certain group of tvshows If a tv shows' one episode is
		 * included in the two-dimensional array "data[][]", we won't put its
		 * another episode in it. Then we will try to find the other tv show's
		 * episode
		 */
		while (resultSet.next()) {
			// We have not get enough tvshows to filled up the page
			if (count >= (pagenum * 12 - 12) && count <= pagenum * 12) {
				boolean exist = false;
				for (int i = 0; i < 12; i++) {
					if (data[1][i] != null)
						if (data[1][i].equals(resultSet.getString("name")))
							exist = true; // So, we find that this tv show's one
											// episode is included in the array
				}

				// We have not add this episode into the arry, so we will do it!
				if (exist == false) {
					data[0][count % 12] = resultSet.getString("url");
					data[1][count % 12] = resultSet.getString("name");
					data[2][count % 12] = resultSet.getString("cover");
					data[3][count % 12] = resultSet.getString("genre");
					data[4][count % 12] = resultSet.getString("episode");
					count++;
				}
			}
		}
		connection.close();
		return data;
	}

}

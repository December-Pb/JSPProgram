package database;

import javax.servlet.*;

/**
 * 
 * @author 20155075
 * 
 *         This class is in web.xml's listener, it makes sure that the database
 *         exists. If the database doesn't exist, this class will call the class
 *         "EmbeddedDBCreator" to create the database and set some example
 *         medias into it.
 *
 */

public class InitializerDatabase implements ServletContextListener {
	public void contextInitialized(ServletContextEvent event) {
		EmbeddedDBCreator creator = new EmbeddedDBCreator();
		creator.createDatabase();
		System.out.println("Start up database");
	}

	public void contextDestroyed(ServletContextEvent event) {
	}
}

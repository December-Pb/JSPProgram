package upload;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.JsonArray;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;

import FileUtil.FileUtil;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;

/**
 * 
 * @author Jackie SUN
 * @time 2017.6.25 This class is used to upload files such as image, movies and
 *       music or fill the message into relative files.
 *
 */
public class upload extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * This method is used to get the request from jsp and handle the message,
	 * then create a file to store the relational message, upload the image or
	 * other file to the server.
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException,
	 *             IOException
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		/** The disk to store template file */
		String path = "D://";
		/** The absolute path of file */
		String absPath = "";
		/** The absolute path of .nfo file */
		String absPathText = "";
		// Set the format of encoding
		request.setCharacterEncoding("UTF-8");
		// repository store area, or path of template file
		factory.setRepository(new File(path));
		// The cache of disk
		factory.setSizeThreshold(1024 * 1024);
		try {
			List<FileItem> items = upload.parseRequest(request);// analysis the
																// upload files
			// Three arraylist to store different items
			List<FileItem> movieItems = new ArrayList<FileItem>();
			List<FileItem> tvItems = new ArrayList<FileItem>();
			List<FileItem> musicItems = new ArrayList<FileItem>();
			Iterator<FileItem> itr = items.iterator();// enumeration
			FileItem item = (FileItem) itr.next();
			boolean flag = false;
			// If the select bar equals to movie, run the following code
			if (item.getString().equals("movie")) {
			
				while (itr.hasNext()) {
					item = itr.next();
					/*
					 * If the field name of item is "movieName", put the
					 * following item into the arraylist until meet an item
					 * whose field name is "movieF"
					 */
					if (item.getFieldName().equals("movieName"))
						flag = true;
					if (flag)
						movieItems.add(item);
					if (item.getFieldName().equals("movieF"))
						flag = false;
				}
				// Iterator the arraylist and retrieve the data, then send the
				// arraylist to other method
				Iterator<FileItem> movieItr = movieItems.iterator();
				while (movieItr.hasNext()) {
					item = movieItr.next();
					if (item.isFormField()) {
						/*
						 * If the field name is "movieName", create a new file
						 * folder whose name is the same as movie title, and
						 * then create a data.json file in the folder named
						 * movie, then create a .nfo file in the folder
						 */
						if (item.getFieldName().equals("movieName")) {
							String movieName = item.getString();
							absPath = this.getServletConfig().getServletContext().getRealPath("/");
							absPath = absPath + "movie" + File.separator + movieName;
						
							FileUtil.createDir(movieName, absPath);
							absPathText = absPath + File.separator + movieName + ".nfo";
							File file = new File(absPathText);
							FileUtil.createFile(file);
						}
					}
					// If the item is a file rather than text, upload it to the
					// target folder
					else {
						FileUtil.uploadFile(absPath, item, request, response);
					}
				}
				// Write the information into the .nfo file
				FileUtil.WriteIntoFile(absPathText, movieItems, absPath);
				String[] details = new String[7];
				String[] movieURL_split = movieItems.get(6).getName().split("\\\\");
				String[] coverURL_split = movieItems.get(5).getName().split("\\\\");
				details[0] = movieItems.get(0).getString();
				details[1] = movieItems.get(1).getString();
				details[2] = movieItems.get(2).getString();
				details[3] = movieItems.get(3).getString();
				details[4] = movieItems.get(4).getString();
				details[5] = "movie/" + movieItems.get(0).getString() + "/" + coverURL_split[coverURL_split.length - 1];// The last element is the relative 
				details[6] = "movie/" + movieItems.get(0).getString() + "/" + movieURL_split[movieURL_split.length - 1];// The last element is the relative 
				
				database.Movie.write(details);
				
			}
			// If the select bar equals to tv, run the following code
			else if (item.getString().equals("tv")) {
			
				while (itr.hasNext()) {
					item = itr.next();
					/*
					 * If the field name of item is "tvName", put the following
					 * item into the arraylist until meet an item whose field
					 * name is "file2"
					 */
					if (item.getFieldName().equals("tvName"))
						flag = true;
					if (flag)
						tvItems.add(item);
					if (item.getFieldName().equals("file3"))
						flag = false;
				}
				// Iterator the arraylist and retrieve the data, then send the
				// arraylist to other method
				Iterator<FileItem> tvItr = tvItems.iterator();
				while (tvItr.hasNext()) {
					item = tvItr.next();
					if (item.isFormField()) {
						/*
						 * If the field name is "tvName", create a new file
						 * folder whose name is the same as movie title, and
						 * then create a data.json file in the folder named tv,
						 * then create a .nfo file in the folder
						 */
						if (item.getFieldName().equals("tvName")) {
							String tvName = item.getString();
							absPath = this.getServletConfig().getServletContext().getRealPath("/");
							absPath = absPath + "tv_show" + File.separator + tvName;
							FileUtil.createDir(tvName, absPath);
						}
						if (item.getFieldName().equals("tvID")) {
							absPath = absPath + File.separator + item.getString();
							FileUtil.createDir(item.getString(), absPath);
							absPathText = absPath + File.separator + item.getString() + ".nfo";
							File file = new File(absPathText);
							FileUtil.createFile(file);
						}

				
					} else {
						// If the item is a file rather than text, upload it to
						// the target folder
						FileUtil.uploadFile(absPath, item, request, response);
					}
				}
				// Write the information into the .nfo file
				FileUtil.WriteIntoFile(absPathText, tvItems, absPath);
				String[] details = new String[9];
				details[0] = tvItems.get(0).getString();    //name
				details[1] = tvItems.get(1).getString();	//episode
				details[2] = tvItems.get(2).getString();	//genre
				details[3] = tvItems.get(3).getString();//summary
				details[4] = tvItems.get(4).getString();//rating
				details[5] = tvItems.get(5).getString();//duration
				details[6] = tvItems.get(8).getString();//actor name
			
				String[] tvName = tvItems.get(14).getName().split("\\\\");
				String[] coverName = tvItems.get(13).getName().split("\\\\");
				details[8] = "tv_show/" + tvItems.get(0).getString() + "/" + tvItems.get(1).getString() + "/"
						+ tvName[tvName.length - 1];
				details[7] = "tv_show/" + tvItems.get(0).getString() + "/" + tvItems.get(1).getString() + "/"
						+ coverName[coverName.length - 1];
		
				database.TV.write(details);
			}
			// If the select bar equals to music, run the following code
			else if (item.getString().equals("music")) {
		
				while (itr.hasNext()) {
					item = itr.next();
					/*
					 * If the field name of item is "musicName", put the
					 * following item into the arraylist until meet an item
					 * whose field name is "musicF"
					 */
					if (item.getFieldName().equals("musicName"))
						flag = true;
					if (flag)
						musicItems.add(item);
					if (item.getFieldName().equals("musicF"))
						flag = false;
				}
				// Iterator the arraylist and retrieve the data, then send the
				// arraylist to other method
				Iterator<FileItem> musicItr = musicItems.iterator();
				while (musicItr.hasNext()) {
					item = musicItr.next();
					if (item.isFormField()) {
						/*
						 * If the field name is "musicName", create a new file
						 * folder whose name is the same as movie title, and
						 * then create a data.json file in the folder named
						 * music, then create a .nfo file in the folder
						 */
						if (item.getFieldName().equals("musicName")) {
							String musicName = item.getString();
							absPath = this.getServletConfig().getServletContext().getRealPath("/");
							absPath = absPath + "music" + File.separator + musicName;
							FileUtil.createDir(musicName, absPath);
							absPathText = absPath + File.separator + musicName + ".nfo";
							File file = new File(absPathText);
							FileUtil.createFile(file);
						}
					} else {
						// If the item is a file rather than text, upload it to
						// the target folder
						FileUtil.uploadFile(absPath, item, request, response);
					}
				}
				// Write the information into the .nfo file
				FileUtil.WriteIntoFile(absPathText, musicItems, absPath);
				String[] details = new String[5];
				details[0] = musicItems.get(0).getString();
				details[1] = musicItems.get(1).getString();
				details[2] = musicItems.get(2).getString();
				
	
				String[] URL1 = musicItems.get(3).getName().split("\\\\");
				details[3] = "music/"+musicItems.get(0).getString()+"/"+URL1[URL1.length - 1];
				
		
				String[] URL2 = musicItems.get(4).getName().split("\\\\");
				details[4] = "music/" + musicItems.get(0).getString() + "/" + URL2[URL2.length - 1];
			
				database.Music.write(details);
				
			} else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("movie_menu.jsp");
	}

	/**
	 * These three functions are used in Assign2, but now we do not use json file, so we don't need it. You can delete it
	 */

	public static void updateMovie(String[] details) {

		/* This list is used for storing all lines of data1 */
		ArrayList<String> data = new ArrayList<>();

		/* Get the json file's path */
		String path = System.getProperty("user.dir").toString();
		path = path.replaceAll("\\\\", "/");
		path += "/Assign2/src/Refresh/data.json";

		JsonParser parser = new JsonParser();
		JsonObject object = null;
		try {
			object = (JsonObject) parser.parse(new FileReader(path));
		} catch (JsonIOException | JsonSyntaxException | FileNotFoundException e2) {

			e2.printStackTrace();
		}
		JsonArray array = object.get("movie").getAsJsonArray();
		int num = array.size();

		// Read out
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(path));
			String tempString = null;

			while ((tempString = reader.readLine()) != null) {
				data.add(tempString);
			}
			// delete the " ]} " at the end of movie.json file
			String lastLine = data.get(data.size() - 2);
			lastLine = lastLine.substring(0, lastLine.length() - 2);
			lastLine += "},";
			data.set(data.size() - 1, lastLine);

			String movieName = "Secret";
			String type = "action";
			String address = "test_video/Pirates2.mp4";
			String coverAddress = "images/Paris.jpg";
			String description = "Nice place";

			// Add a new line to the data list
			String newLine = "\t{";
			newLine = "\t{\"name\":\"" + details[0] + "\",";
			newLine += "\"url\":\"movie.jsp?name=" + details[0] + "\",";
			newLine += "\"type\":\"" + details[1] + "\",";
			newLine += "\"mvURL\":\"" + details[2] + "\",";
			newLine += "\"cover\":\"" + details[3] + "\",";
			newLine += "\"des\":\"" + details[4] + "\"}]}";

			data.add(newLine);
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}

		// Write into json file
		FileWriter fw = null;
		BufferedWriter writer = null;
		try {
			fw = new FileWriter(path);
			writer = new BufferedWriter(fw);

			for (String line : data) {
				writer.write(line);
				writer.newLine();
			}
			writer.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				writer.close();
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	/*
	 * This function is used in Assign2, but now we do not use json file, so we don't need it. You can delete it
	 */
	public static void updateMusic(String[] details) {

		/* This list is used for storing all lines of data1 */
		ArrayList<String> data = new ArrayList<>();

		/* Get path */
		String path = System.getProperty("user.dir").toString();
		path = path.replaceAll("\\\\", "/");
		path += "/Assign2/src/Refresh/music.json";

		JsonParser parser = new JsonParser();
		JsonObject object = null;
		try {
			object = (JsonObject) parser.parse(new FileReader(path));
		} catch (JsonIOException | JsonSyntaxException | FileNotFoundException e2) {
			e2.printStackTrace();
		}
		JsonArray array = object.get("music").getAsJsonArray();
		int num = array.size();

		// Read out
		BufferedReader reader = null;
		try {

			reader = new BufferedReader(new FileReader(path));
			String tempString = null;

			while ((tempString = reader.readLine()) != null) {
				data.add(tempString);
			}
			
		
			// delete the last line to do littel operation, like delete the ","
			// and then write new data in next line
			String lastLine = data.get(data.size() - 1);
			lastLine = lastLine.substring(0, lastLine.length() - 3);
			lastLine += "},";
			data.set(data.size() - 1, lastLine);
			// Add a new line to the json file
			String newLine = "\t{";
			newLine = "\t{\"name\":\"" + details[0] + "\",";
			newLine += "\"type\":\"" + details[1] + "\",";
			newLine += "\"mvURL\":\"" + details[2] + "\"}]}";
			data.add(newLine);
			reader.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
		// Write into json file
		FileWriter fw = null;
		BufferedWriter writer = null;
		try {
			fw = new FileWriter(path);
			writer = new BufferedWriter(fw);

			for (String line : data) {
				writer.write(line);
				writer.newLine();
			}
			writer.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				writer.close();
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/*
	 * This function is used in Assign2, but now we do not use json file, so we don't need it. You can delete it
	 */
	public static void updateTV(String[] details) {

		/* This list is used for storing all lines of data1 */
		ArrayList<String> data = new ArrayList<>();
		/* Get path */
		String path = System.getProperty("user.dir").toString();
		path = path.replaceAll("\\\\", "/");
		path += "/Assign2/src/Refresh/tvshow.json";

		JsonParser parser = new JsonParser();
		JsonObject object = null;
		try {
			object = (JsonObject) parser.parse(new FileReader(path));
		} catch (JsonIOException | JsonSyntaxException | FileNotFoundException e2) {
			e2.printStackTrace();
		}
		JsonArray array = object.get("tvshow").getAsJsonArray();

		boolean exist = false;
		for (int i = 0; i < array.size(); i++) {
			JsonObject subObject = array.get(i).getAsJsonObject();

			// This condition test if the tv show exist
			if (subObject.get("name").getAsString().equals(details[0])) {
				exist = true;
			}
		}
		int num = array.size();
		// Read out
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new FileReader(path));
			String tempString = null;

			while ((tempString = reader.readLine()) != null) {
				data.add(tempString);
			}
			if (exist == false) {
				data.remove(data.size() - 1);
				data.remove(data.size() - 1);
				String lastLine = data.get(data.size() - 1);
				lastLine += ",";
				data.set(data.size() - 1, lastLine);
				// code the new line to be added in the json file, pretty
				// difficult
				String[] new_lines = new String[7];
				new_lines[0] = "\t{\"name\":\"" + details[0] + "\",";
				new_lines[1] = "\t\"type\":\"" + details[1] + "\",";
				new_lines[2] = "\t\"url\":\"tv.jsp?name=" + details[0] + "&episode=1\",";
				new_lines[3] = "\t\"mvURL\":\"" + details[2] + "\",";
				new_lines[4] = "\t\"cover\":\"" + details[3] + "\",";
				new_lines[5] = "\t\"list\":[";
				new_lines[6] = "\t\t{\"episode\":\"1\",\"actor\":\"" + details[4] + "\",\"url\":\"tv.jsp?name="
						+ details[0] + "episode=1\",\"mvURL\":\"";
				new_lines[6] += details[2] + "\",\"des\":\"" + details[5] + "\"}";
				FileWriter fw = null;
				BufferedWriter writer = null;
				try {
					fw = new FileWriter(path);
					writer = new BufferedWriter(fw);

					// write new data(include old data) into file
					for (String line : data) {
						writer.write(line);
						writer.newLine();
					}
					// write the new line into file
					for (int i = 0; i <= 6; i++) {
						writer.write(new_lines[i]);
						writer.newLine();
					}
					// write the tail code
					writer.write("\t\t]");
					writer.newLine();
					writer.write("\t}");
					writer.newLine();
					writer.write("\t]");
					writer.newLine();
					writer.write("}");

					writer.flush();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						writer.close();
						fw.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}

			}
			// This condition is for adding an episode of which tv show existed
			// already.
			else {

				/* Get all tv's start line's location(integer) */
				int target_tv_endline = 0;
				ArrayList<Integer> tops = new ArrayList<>();
				for (int i = 0; i < data.size() - 1; i++) {
					if (data.get(i).contains("name")) {
						tops.add(i);
					}
				}
				/*
				 * Get the end line of a tv, then we can add an episode in its
				 * end line
				 */
				for (int i = 0; i < tops.size(); i++) {
					if (data.get(tops.get(i)).contains(details[0])) {
						target_tv_endline = tops.get(i + 1);
					}
				}
				// code the new line
				String lastLine = data.get(target_tv_endline - 3);
				lastLine += ",";
				data.set(target_tv_endline - 3, lastLine);
				String new_line;
				new_line = "\t\t{\"episode\":\"" + details[6] + "\",\"actor\":\"" + details[4]
						+ "\",\"url\":\"tv.jsp?name=" + details[0] + "&episode=" + details[6];
				new_line += "\",\"mvURL\":\"" + details[2] + "\",\"des\":\"" + details[5] + "\"}";

				FileWriter fw = null;
				BufferedWriter writer = null;
				try {
					fw = new FileWriter(path);
					writer = new BufferedWriter(fw);
					// write into the json file
					for (int i = 0; i < data.size(); i++) {
						writer.write(data.get(i));
						writer.newLine();

						// write in to json file
						if (i == (target_tv_endline - 3)) {
							writer.write(new_line);
							writer.newLine();
						}
					}
					writer.flush();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						writer.close();
						fw.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e1) {
				}
			}
		}
	}

}

package FileUtil;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
/**
 * This class provide varieties of method which can operate something about files
 * @author Jackie SUN
 * @time 2017.6.25
 *
 */
public class FileUtil {
	
	/**The head of an xml file*/
	private final static String tag = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>";
	
	/**
	 * This method is used to upload the files such as images, movies or musics to the server
	 * @param path
	 * @param item
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	public static void uploadFile(String path, FileItem item, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = item.getFieldName();
        //Obtain the path
        String value = item.getName() ;
        //index to the last backslash
        int start = value.lastIndexOf("\\");
        //cut out the name of upload file, the type is string, "+1" means delete backslash
        String filename = value.substring(start+1);
        request.setAttribute(name, filename);
        //Write into the disk
        //The exception is caught by exception
        //Write manually
        OutputStream out = new FileOutputStream(new File(path,filename));
        InputStream in = item.getInputStream();
        int length = 0 ;
        byte [] buf = new byte[1024] ;
        System.out.println("The totle size of upload file£º"+item.getSize());
        while( (length = in.read(buf) ) != -1){
            //Take out the data in the buf array and write it into disk
            out.write(buf, 0, length);
        }
        in.close();
        out.close();
	}
	
	// create the catalog
	public static int createDir(String name, String absPath) throws Exception {
		File dir = new File(absPath);
		if (dir.exists()) {//Judge whether the catalog exists
			System.out.println("Failing creation! The catalog has existed!");
			return 1;
		}
		if (!absPath.endsWith(File.separator)) {//Judge whether the path ends with "/".
			absPath = absPath + File.separator;
		}
		if (dir.mkdirs()) {// Create the catalog
			System.out.println("Create the catalog successfully");
			return 0;
		} else {
			System.out.println("Fail to create the catalog");
			return -1;
		}
	}
	/**
	 * Create a file
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public static boolean createFile(File fileName)throws Exception{  
		boolean flag=false;  
		try{  
			if(!fileName.exists()){  
			fileName.createNewFile();  
			flag=true;  
			}  
		}catch(Exception e){  
			e.printStackTrace();  
		}  
		return flag;  
	} 
	
	/**
	 * This method is used to write the formative information into the file, it is xml format.
	 * @param path
	 * @param item
	 * @param filePath
	 * @throws IOException
	 */
	public static void WriteIntoFile(String path, List<FileItem> item, String filePath) throws IOException {
		FileWriter fileWriter = new FileWriter(path,false);
		BufferedWriter bufferWriter = new BufferedWriter(fileWriter);
		if(item.size()==15) {
			bufferWriter.write(tag + "\r\n");
			bufferWriter.write("<tvshow>" + "\r\n");
			bufferWriter.write("\t" + "<title>" + item.get(0).getString() + "</title>\r\n");
			bufferWriter.write("\t" + "<episode>" + item.get(1).getString() + "</episode>\r\n");
			bufferWriter.write("\t" + "<genre>" + item.get(2).getString() + "</genre>\r\n");
			bufferWriter.write("\t" + "<plot>" + item.get(3).getString() + "</plot>\r\n");
			bufferWriter.write("\t" + "<rating>" + item.get(4).getString() + "</rating>\r\n");
			bufferWriter.write("\t" + "<runtime>" + item.get(5).getString() + "</runtime>\r\n");
			bufferWriter.write("\t" + "<premiered>" + item.get(7).getString() + "</premiered>\r\n");
			bufferWriter.write("\t" + "<studio>" + item.get(6).getString() + "</studio>\r\n");
			bufferWriter.write("\t<actor>\r\n");
			bufferWriter.write("\t\t" + "<name>" + item.get(8).getString() + "</name>\r\n");
			bufferWriter.write("\t\t" + "<role>" + item.get(9).getString() + "</role>\r\n");
			bufferWriter.write("\t\t" + "<thumb>" + filePath + File.separator + item.get(10).getName() + "</thumb>\r\n");
			bufferWriter.write("\t</actor>\r\n");
			bufferWriter.write("\t<actor>\r\n");
			bufferWriter.write("\t\t" + "<name>" + item.get(11).getString() + "</name>\r\n");
			bufferWriter.write("\t\t" + "<role>" + item.get(12).getString() + "</role>\r\n");
			bufferWriter.write("\t\t" + "<thumb>" + filePath + File.separator + item.get(13).getName() + "</thumb>\r\n");
			bufferWriter.write("\t</actor>\r\n");
			bufferWriter.write("\t" + "<cover>" + filePath + File.separator + item.get(14).getName() + "</cover>\r\n");
			bufferWriter.close();
		}
		else if(item.size()==5) {
			bufferWriter.write(tag + "\r\n");
			bufferWriter.write("<music>" + "\r\n");
			bufferWriter.write("\t" + "<title>" + item.get(0).getString() + "</title>\r\n");
			bufferWriter.write("\t" + "<summary>" + item.get(1).getString() + "</summary>\r\n");
			bufferWriter.write("\t" + "<genre>" + item.get(2).getString() + "</genre>\r\n");
			bufferWriter.write("\t" + "<thumb>" + filePath + File.separator  + item.get(3).getName() + "</thumb>\r\n");
			bufferWriter.write("\t" + "<music>" + filePath + File.separator  + item.get(4).getName() + "</music>\r\n");
			bufferWriter.write("</music>" + "\r\n");
			bufferWriter.close();
		}
		else if(item.size()==7) {
			bufferWriter.write(tag + "\r\n");
			bufferWriter.write("<movie>" + "\r\n");
			bufferWriter.write("\t" + "<title>" + item.get(0).getString() + "</title>\r\n");
			bufferWriter.write("\t" + "<genre>" + item.get(1).getString() + "</genre>\r\n");
			bufferWriter.write("\t" + "<plot>" + item.get(2).getString() + "</plot>\r\n");
			bufferWriter.write("\t" + "<rating>" + item.get(3).getString() + "</rating>\r\n");
			bufferWriter.write("\t" + "<duration>" + item.get(4).getString() + "</duration>\r\n");
			bufferWriter.write("\t" + "<cover>" + filePath + File.separator  + item.get(5).getName() + "</cover>\r\n");
			bufferWriter.write("\t" + "<File>" + filePath + File.separator  + item.get(6).getName() + "</File>\r\n");
			bufferWriter.write("</movie>" + "\r\n");
			bufferWriter.close();
		}
	}
}

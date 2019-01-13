package cn.com.topit.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * 文件操作类
 * @author lang
 * @createTime 2015-11-13 
 */
public class FilesUtils {
	
	/**
	 * 文件读取方法
	 * @author lang
	 * @createTime 2015-11-12
	 * @param filePath
	 * @return
	 */
	public static String readFiles(String filePath) {
		try {
			File f = new File(filePath);
			FileInputStream fip = new FileInputStream(f);
			InputStreamReader reader = new InputStreamReader(fip, "UTF-8");
			StringBuilder sb = new StringBuilder();
			while (reader.ready()) {
				sb.append((char) reader.read());
			}
			reader.close();
			fip.close();
			return sb.toString();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * 指定目录下的所有文件转移
	 * @author lang
	 * @createTime 2015-11-14
	 * @param filePath
	 * @param newFilePath
	 */
	public static void moveFiles(String filePath,String newFilePath){
        File file = new File(filePath);  
        File[] files = file.listFiles();  
        for (File f : files) {  
            if(f.isFile()){
                f.renameTo(new File(newFilePath + "\\" + f.getName()));  
            }   
        }
        //指定目录下所有文件转移完,删除原始目录
        file.delete();
	}
	
	/**
	 * 删除指定目录下所有文件
	 * @author lang
	 * @createTime 2015-11-14
	 * @param path
	 */
	public static boolean deleteDirectory(String path){
		//如果path不是以文件分割符结尾,自动添加文件分隔符
		if(!path.endsWith(File.separator)){
			path = path + File.separator;
		}
		File dirFile = new File(path);
		if(!dirFile.exists() || !dirFile.isDirectory())//指定的文件不存在或目录不存在
			return false;
		File [] files = dirFile.listFiles();
		for (File file : files) {
			if(file.isFile()) //删除子文件
				file.delete();
			else //迭代删除子文件目录
				deleteDirectory(file.getAbsolutePath());
		}
		return true;
	}
	
}

package cn.com.topit.common.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
	
	public static String getStringByYMD(){
		Date currentTime = new Date();
	    SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd");
	    String dateString = formatter.format(currentTime);
	    return dateString;
	 }
	
	public static String getStringByHMS() {
	    Date currentTime = new Date();
	    SimpleDateFormat formatter = new SimpleDateFormat("HHmmss");
	    String dateString = formatter.format(currentTime);
	    return dateString;
	}
	
}

package cn.com.topit.common.util;
import org.apache.commons.beanutils.Converter;

public class DoubleConvert implements Converter {
	public Object convert(Class arg0, Object arg1) {
		if(arg1==null||arg1.toString().length()==0)
			return null;		
		return Double.parseDouble(arg1.toString());
	}	
}

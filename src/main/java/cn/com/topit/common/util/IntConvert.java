package cn.com.topit.common.util;
import org.apache.commons.beanutils.Converter;
//解决json自动将空值设为0的问题
public class IntConvert implements Converter {
	public Object convert(Class arg0, Object arg1) {
		if(arg1==null||arg1.toString().length()==0)
			return null;		
		return Integer.parseInt(arg1.toString());
	}	
}

package cn.com.topit.gl.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;

import cn.com.topit.base.AbstractService;
import cn.com.topit.common.util.MD5;
import cn.com.topit.gl.dao.Users;
import cn.com.topit.gl.dao.UsersDao;

public class UsersService extends AbstractService<Users> {
	public List getUsersComboBox(final String whereSql) {
		return ((UsersDao)dao).getUsersComboBox(whereSql);
	}
	public Map getUsersNameCode(final String whereSql,final int page,final int limit,final String order) {
		Map map = new HashMap();
		try {
			map.put("count", dao.getRowsCount(whereSql));
			map.put("records",
					((UsersDao)dao).getUsersNameCode(whereSql+order, page, limit));
			return map;
		} catch (Throwable t) {
			t.printStackTrace();
			return null;
		}		
	}
	@Override
	public Users saveByJSONObject(JSONObject jsonObject) throws Exception {
	    Users t;		
		
		// json含id信息说明是编辑记录，否则为新建记录
		if (jsonObject.getString("id") == null
				|| jsonObject.getString("id").equals(""))
			try {
				t = (Users) getGenericType(0).newInstance();
			} catch (Exception e) {
				log.error("创建新记录出错：" + e.toString());
				e.printStackTrace();				
				throw e;
			}
		else {
			t = (Users) dao.findById(Long.parseLong((jsonObject.getString("id"))));			
			if (t == null) {
				log.error("未找到待保存记录！");
				throw new Exception("未找到待保存记录！");
			}
		}
		try {			
			BeanUtils.copyProperties(t, jsonObject);
			if(jsonObject.containsKey("password"))
			    t.setPassword(MD5.md5Encode(jsonObject.getString("password")));
			return (Users) dao.save(t);
		} catch (Exception e) {
			log.error("拷贝属性出错/保存出错:" + e.toString());	
			dao.clear();
			throw e;
		}
	}
}

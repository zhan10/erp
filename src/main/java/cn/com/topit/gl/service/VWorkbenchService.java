package cn.com.topit.gl.service;
import java.util.HashMap;
import java.util.Map;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.VWorkbench;
import cn.com.topit.gl.dao.VWorkbenchDao;
public class VWorkbenchService extends AbstractService<VWorkbench>{
	public Map getGenre(int ids) {
		Map map = new HashMap();
		map.put("records",((VWorkbenchDao) dao).getGenre(ids));
		return map;
	}
}

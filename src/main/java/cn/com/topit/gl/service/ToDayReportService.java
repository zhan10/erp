package cn.com.topit.gl.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;
import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.ToDayReport;
import cn.com.topit.gl.dao.ToDayReportDao;
public class ToDayReportService extends AbstractService<ToDayReport>{
	public Map getToDayReport(final Date date,String whereSql) {
		Map map = new HashMap();
		map.put("count", ((ToDayReportDao) dao).getRowsCount(whereSql));
		map.put("records",
				((ToDayReportDao) dao).getToDayReport(date,whereSql));
		return map;
	}
}

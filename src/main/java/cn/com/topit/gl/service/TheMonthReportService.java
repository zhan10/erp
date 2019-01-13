package cn.com.topit.gl.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.TheMonthReport;
import cn.com.topit.gl.dao.TheMonthReportDao;
import cn.com.topit.gl.dao.ToDayReportDao;
public class TheMonthReportService extends AbstractService<TheMonthReport>{
	public Map getTheMonthReport(final Date date,String whereSql) {
		Map map = new HashMap();
		map.put("count", ((TheMonthReportDao) dao).getRowsCount(whereSql));
		map.put("records",
				((TheMonthReportDao) dao).getTheMonthReport(date,whereSql));
		return map;
	}
}

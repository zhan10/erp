package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.PrintStatistics;
import cn.com.topit.gl.dao.PrintStatisticsDao;
public class PrintStatisticsService extends AbstractService<PrintStatistics>{
	public List getPrintStatisticssComboBox(final String whereSql) {
		return ((PrintStatisticsDao) dao).getPrintStatisticssComboBox(whereSql);
	}
}

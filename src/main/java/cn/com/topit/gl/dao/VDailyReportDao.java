package cn.com.topit.gl.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VDailyReportDao extends GenericDaoImpl<VDailyReport, Long>{
	private static final Logger log=LoggerFactory.getLogger(VDailyReportDao.class);
	public VDailyReportDao(Class<VDailyReport> type) {
		super(type);
	}
}

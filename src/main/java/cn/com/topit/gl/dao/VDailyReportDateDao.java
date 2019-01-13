package cn.com.topit.gl.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VDailyReportDateDao extends GenericDaoImpl<VDailyReportDate, Long>{
	private static final Logger log=LoggerFactory.getLogger(VDailyReportDateDao.class);
	public VDailyReportDateDao(Class<VDailyReportDate> type) {
		super(type);
	}
}

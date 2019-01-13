package cn.com.topit.gl.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VMonthlyReportDateDao extends GenericDaoImpl<VMonthlyReportDate, Long>{
	private static final Logger log=LoggerFactory.getLogger(VMonthlyReportDateDao.class);
	public VMonthlyReportDateDao(Class<VMonthlyReportDate> type) {
		super(type);
	}
}

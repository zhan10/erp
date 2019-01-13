package cn.com.topit.gl.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VMonthlyReportDao extends GenericDaoImpl<VMonthlyReport, Long>{
	private static final Logger log=LoggerFactory.getLogger(VMonthlyReportDao.class);
	public VMonthlyReportDao(Class<VMonthlyReport> type) {
		super(type);
	}
}

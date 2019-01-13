package cn.com.topit.gl.dao;
import java.util.List;

import cn.com.topit.base.GenericDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VBookingWorkbenchDao extends GenericDaoImpl<VBookingWorkbench, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBookingWorkbenchDao.class);
	public VBookingWorkbenchDao(Class<VBookingWorkbench> type) {
		super(type);
	}
	public List getGenre(int typeId) {
		try {
			String queryString = "SElECT id,typeId,workbenchName,dateFrom,dateTo,workbenchId,workbenchType From VBookingWorkbench where typeId="+typeId;
			return (List) (sessionFactory.getCurrentSession().createQuery(
					queryString).list());
		} catch (Exception e) {
			log.error("getGenre 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}

package cn.com.topit.gl.dao;
import java.util.List;

import cn.com.topit.base.GenericDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VWorkbenchDao extends GenericDaoImpl<VWorkbench, Long>{
	private static final Logger log=LoggerFactory.getLogger(VWorkbenchDao.class);
	public VWorkbenchDao(Class<VWorkbench> type) {
		super(type);
	}
	public List getGenre(int ids) {
		try {
			String queryString = "SElECT name,workbenchType,id From VWorkbench where typeId="+ids;
			return (List) (sessionFactory.getCurrentSession().createQuery(
					queryString).list());
		} catch (Exception e) {
			log.error("getGenre 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}

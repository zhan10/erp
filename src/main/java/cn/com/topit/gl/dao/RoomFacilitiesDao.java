package cn.com.topit.gl.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;

public class RoomFacilitiesDao extends GenericDaoImpl<RoomFacilities, Long> {
	private static final Logger log=LoggerFactory.getLogger(RoomFacilitiesDao.class);
	public RoomFacilitiesDao(Class<RoomFacilities> type) {
		super(type);
	}
	// 选择下拉框数据
				public List getRoomFacilitiesComboBox(final String whereSql) {
					log.info("finding " + type.getClass().getName() + " with whereSql: "
							+ whereSql);
					try {
						String queryString = "select id,facilities from " + tableName
								+ " where 1=1 " + whereSql;
						return (List) (sessionFactory.getCurrentSession().createQuery(
								queryString).list());
					} catch (Exception e) {
						log.error("getRoomFacilitiesComboBox 出错：" + e.toString());
						e.printStackTrace();
					}
					return null;
				}
}

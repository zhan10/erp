package cn.com.topit.gl.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class GenreDao extends GenericDaoImpl<Genre, Long>{
	private static final Logger log=LoggerFactory.getLogger(GenreDao.class);
	public GenreDao(Class<Genre> type) {
		super(type);
	}
	// 选择类型下拉框数据
				public List getGenreComboBox(final String whereSql) {
					log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
					try {System.out.println(whereSql);
						String queryString = "select id,name,price,priceUnit from " + tableName + " where 1=1 " + whereSql;
						return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
					} catch (Exception e) {
						log.error("getGenreComboBox 出错：" + e.toString());
						e.printStackTrace();
					}
					return null;
				}
}

package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class NewsDao extends GenericDaoImpl<News, Long>{
	private static final Logger log=LoggerFactory.getLogger(NewsDao.class);
	public NewsDao(Class<News> type) {
		super(type);
	}
}

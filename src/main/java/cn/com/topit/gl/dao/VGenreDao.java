package cn.com.topit.gl.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VGenreDao extends GenericDaoImpl<VGenre, Long>{
	private static final Logger log=LoggerFactory.getLogger(VGenreDao.class);
	public VGenreDao(Class<VGenre> type) {
		super(type);
	}
}

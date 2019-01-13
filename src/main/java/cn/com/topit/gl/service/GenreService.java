package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Genre;
import cn.com.topit.gl.dao.GenreDao;
public class GenreService extends AbstractService<Genre>{
	public List getGenreComboBox(final String whereSql) {
		return ((GenreDao) dao).getGenreComboBox(whereSql);
	}
}

package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Circle;
import cn.com.topit.gl.dao.CircleDao;
public class CircleService extends AbstractService<Circle>{
	public List getCirclesComboBox(final String whereSql) {
		return ((CircleDao) dao).getCirclesComboBox(whereSql);
	}
}

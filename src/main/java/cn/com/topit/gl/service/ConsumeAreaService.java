package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.ConsumeArea;
import cn.com.topit.gl.dao.ConsumeAreaDao;
public class ConsumeAreaService extends AbstractService<ConsumeArea>{
	public List getConsumeAreaComboBox(final String whereSql) {
		return ((ConsumeAreaDao) dao).getConsumeAreaComboBox(whereSql);
	}
}

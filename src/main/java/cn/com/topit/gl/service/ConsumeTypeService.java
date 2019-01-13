package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.ConsumeType;
import cn.com.topit.gl.dao.ConsumeTypeDao;
public class ConsumeTypeService extends AbstractService<ConsumeType>{
	public List getConsumeTypeComboBox(final String whereSql) {
		return ((ConsumeTypeDao) dao).getConsumeTypeComboBox(whereSql);
	}
}

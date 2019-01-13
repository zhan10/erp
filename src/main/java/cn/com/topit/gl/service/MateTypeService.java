package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.MateType;
import cn.com.topit.gl.dao.MateTypeDao;
public class MateTypeService extends AbstractService<MateType>{
	public List getMateTypeComboBox(final String whereSql) {
		return ((MateTypeDao) dao).getMateTypeComboBox(whereSql);
	}
}

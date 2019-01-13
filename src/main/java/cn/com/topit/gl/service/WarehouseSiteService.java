package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.WarehouseSite;
import cn.com.topit.gl.dao.WarehouseSiteDao;
public class WarehouseSiteService extends AbstractService<WarehouseSite>{
	public List getWarehouseSiteComboBox(final String whereSql) {
		return ((WarehouseSiteDao) dao).getWarehouseSiteComboBox(whereSql);
	}
}

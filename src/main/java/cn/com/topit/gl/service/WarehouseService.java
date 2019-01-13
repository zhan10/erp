package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Warehouse;
import cn.com.topit.gl.dao.WarehouseDao;
public class WarehouseService extends AbstractService<Warehouse>{
	public List getWarehouseComboBox(final String whereSql) {
		return ((WarehouseDao) dao).getWarehouseComboBox(whereSql);
	}
}

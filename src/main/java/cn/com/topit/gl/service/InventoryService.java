package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Inventory;
import cn.com.topit.gl.dao.InventoryDao;
public class InventoryService extends AbstractService<Inventory>{
	public Object getResult(final String materid) {
		return ((InventoryDao) dao).getResult(materid);
	}
}

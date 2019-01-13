package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VInventoryDao extends GenericDaoImpl<VInventory, Long>{
	private static final Logger log=LoggerFactory.getLogger(VInventory.class);
	public VInventoryDao(Class<VInventory> type) {
		super(type);
	}
}

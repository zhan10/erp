package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.AreaDao;
import cn.com.topit.gl.dao.NewWorkbench;
import cn.com.topit.gl.dao.NewWorkbenchDao;
public class NewWorkbenchService extends AbstractService<NewWorkbench>{
	public boolean findByFloorId(final String floorId) {
		return ((NewWorkbenchDao) dao).findByFloorId(floorId);
	}
	public List getWorkbenchComboBox(final String whereSql) {
		return ((NewWorkbenchDao) dao).getWorkbenchComboBox(whereSql);
	}
}

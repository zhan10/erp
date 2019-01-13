package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.WarehouseSite;
import cn.com.topit.gl.service.WarehouseSiteService;


public class WarehouseSiteAction extends GenericActionSupport<WarehouseSite> {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(WarehouseSiteAction.class);
	private WarehouseSiteService service;

	public void setService(WarehouseSiteService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 根据查询条件获取记录集
	public String getWarehouseSiteComboBox() {
		try {
			records.put("records",  service
					.getWarehouseSiteComboBox(baseSql + whereSql+order));
		} catch (Exception e) {
			log.error("getWarehouseSiteComboBox出错："+e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}

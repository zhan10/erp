package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.MateType;
import cn.com.topit.gl.service.MateTypeService;


public class MateTypeAction extends GenericActionSupport<MateType> {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(MateTypeAction.class);
	private MateTypeService service;

	public void setService(MateTypeService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 根据查询条件获取记录集
	public String getMateTypeComboBox() {
		try {
			records.put("records",  service
					.getMateTypeComboBox(baseSql + whereSql+order));
		} catch (Exception e) {
			log.error("getMateTypeComboBox出错："+e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}

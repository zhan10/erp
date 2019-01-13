package cn.com.topit.gl.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.MemberLevelService;

public class MemberLevelAction extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory
			.getLogger(MemberLevelAction.class);
	private MemberLevelService service;
	public void setService(MemberLevelService service) {
		this.service = service;
		super.setAbstractService(service);
	}

	// 根据查询条件获取记录集
	public String getMemberLevelComboBox() {
		try {
			records.put("records",
					service.getMemberLevelComboBox(baseSql + whereSql + order));
		} catch (Exception e) {
			log.error("getMemberLevelComboBox出错：" + e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}

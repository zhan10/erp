package cn.com.topit.gl.action;

import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.PrintRateService;

public class PrintRateAction<PrintRate> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory
			.getLogger(PrintRateAction.class);
	private PrintRateService service;

	public void setService(PrintRateService service) {
		this.service = service;
		super.setAbstractService(service);
	}

	// 根据查询条件获取记录集
	public String getPrintRatesComboBox() {
		try {
			records.put(
					"records",
					service.getPrintRatesComboBox(baseSql + whereSql
							+ order));
		} catch (Exception e) {
			log.error("getPrintRatesComboBox出错：" + e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}

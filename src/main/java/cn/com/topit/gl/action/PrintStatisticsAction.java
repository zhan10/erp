package cn.com.topit.gl.action;

import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.PrintStatisticsService;

public class PrintStatisticsAction<PrintStatistics> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory
			.getLogger(PrintStatisticsAction.class);
	private PrintStatisticsService service;

	public void setService(PrintStatisticsService service) {
		this.service = service;
		super.setAbstractService(service);
	}

	// 根据查询条件获取记录集
	public String getPrintStatisticssComboBox() {
		try {
			records.put(
					"records",
					service.getPrintStatisticssComboBox(baseSql + whereSql
							+ order));
		} catch (Exception e) {
			log.error("getPrintStatisticssComboBox出错：" + e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}

package cn.com.topit.gl.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.PaymentType;
import cn.com.topit.gl.service.PaymentTypeService;


public class PaymentTypeAction extends GenericActionSupport<PaymentType> {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(PaymentTypeAction.class);
	private PaymentTypeService service;

	public void setService(PaymentTypeService service) {
		this.service = service;
		super.setAbstractService(service);
	}

	// 根据查询条件获取记录集
		public String getPaymentTypeComboBox() {
			try {
				records.put("records",  service
						.getPaymentTypeComboBox(baseSql + whereSql+order));
			} catch (Exception e) {
				log.error("getPaymentTypeComboBox出错："+e.toString());
				e.printStackTrace();
			}
			return "managerExt";
		}
}

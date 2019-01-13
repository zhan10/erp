package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.PaymentType;
import cn.com.topit.gl.dao.PaymentTypeDao;
public class PaymentTypeService extends AbstractService<PaymentType>{
	public List getPaymentTypeComboBox(final String whereSql) {
		return ((PaymentTypeDao) dao).getPaymentTypeComboBox(whereSql);
	}
}

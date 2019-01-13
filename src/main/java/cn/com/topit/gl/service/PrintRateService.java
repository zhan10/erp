package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.PrintRate;
import cn.com.topit.gl.dao.PrintRateDao;
public class PrintRateService extends AbstractService<PrintRate>{
	public List getPrintRatesComboBox(final String whereSql) {
		return ((PrintRateDao) dao).getPrintRatesComboBox(whereSql);
	}
}

package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Marketing;
import cn.com.topit.gl.dao.MarketingDao;
public class MarketingService extends AbstractService<Marketing>{
	public List getMarketingComboBox(final String whereSql) {
		return ((MarketingDao) dao).getMarketingComboBox(whereSql);
	}
}

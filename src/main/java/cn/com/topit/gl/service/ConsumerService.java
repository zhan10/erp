package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Consumer;
import cn.com.topit.gl.dao.ConsumerDao;
public class ConsumerService extends AbstractService<Consumer>{
	public List getConsumerComboBox(final String whereSql) {
		return ((ConsumerDao) dao).getConsumerComboBox(whereSql);
	}
}

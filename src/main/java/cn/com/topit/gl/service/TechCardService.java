package cn.com.topit.gl.service;
import java.math.BigDecimal;
import java.util.HashSet;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;

import cn.com.topit.base.AbstractService;
import cn.com.topit.base.GenericDao;
import cn.com.topit.gl.dao.TechCard;
import cn.com.topit.gl.dao.TechCardDao;
import cn.com.topit.gl.dao.TechCardOrders;
public class TechCardService extends AbstractService<TechCard> {
	TechCardDao techDao;
	/*public void setDao(TechCardDao dao) {
		this.dao = dao;
	}*/
	public TechCard saveAll(String json, String others) throws Exception {
		techDao=(TechCardDao)dao;
		TechCard t;
		JSONObject jsonObject = JSONObject.fromObject(json);
		// json含id信息说明是编辑记录，否则为新建记录
		if (jsonObject.getString("id") == null || jsonObject.getString("id").equals(""))
			try {
				t = new TechCard();
			} catch (Exception e) {
				log.error("创建新记录出错：" + e.toString());
				e.printStackTrace();
				throw e;
			}
		else {
			t = (TechCard) dao.findById(Long.parseLong((jsonObject.getString("id"))));
			if (t == null) {
				log.error("未找到待保存记录！");
				throw new Exception("未找到待保存记录！");
			}
		}
		try {
			BeanUtils.copyProperties(t, jsonObject);
			HashSet set=new HashSet();			
			if(others!=null&&!others.equals("")){
				JSONArray list = JSONObject.fromObject(others).getJSONArray("ordersItem");
				for (int i = 0; i <= list.size() - 1; i++) {	
					TechCardOrders techCardOrders=new TechCardOrders();
					techCardOrders.setAllotWeight(new BigDecimal(list.getJSONObject(i).getString("allotWeight")));
					techCardOrders.setOrdersItemId(list.getJSONObject(i).getLong("itemsId"));
					set.add(techCardOrders);
				}
			}
			return (TechCard) techDao.saveAll(t,set);			
		} catch (Exception e) {
			log.error("拷贝属性出错/保存出错:" + e.toString());
			dao.clear();
			throw e;
		}
	}
}

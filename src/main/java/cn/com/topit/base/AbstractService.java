package cn.com.topit.base;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//http://www.ibm.com/developerworks/cn/java/j-genericdao.html
public abstract class AbstractService<T> extends Base {
	protected GenericDao dao;
	protected static final Logger log = LoggerFactory
			.getLogger(AbstractService.class);

	/* protected Class<T> type; */
	public T save(T t) throws Exception {		
		return (T) dao.save(t);
	}
	/** 拷贝json字符串 保存记录 */
	public T saveByJson(String json) throws Exception {		
		//System.out.println(json);
		
		JSONObject jsonObject = JSONObject.fromObject(json);
		return saveByJSONObject(jsonObject);
	}
	public T saveByJSONObject(JSONObject jsonObject) throws Exception {
		T t;		
		
		// json含id信息说明是编辑记录，否则为新建记录
		if (jsonObject.getString("id") == null
				|| jsonObject.getString("id").equals(""))
			try {
				t = (T) getGenericType(0).newInstance();
			} catch (Exception e) {
				log.error("创建新记录出错：" + e.toString());
				e.printStackTrace();				
				throw e;
			}
		else {
			t = (T) dao.findById(Long.parseLong((jsonObject.getString("id"))));			
			if (t == null) {
				log.error("未找到待保存记录！");
				throw new Exception("未找到待保存记录！");
			}
		}
		try {			
			BeanUtils.copyProperties(t, jsonObject);			
			return (T) dao.save(t);
		} catch (Exception e) {
			log.error("拷贝属性出错/保存出错:" + e.toString());	
			dao.clear();
			throw e;
		}
	}
	public Map getRecords(String whereSql, int page, int limit, String orderBy) {
		Map map = new HashMap();
		try {
			map.put("count", dao.getRowsCount(whereSql));
			map.put("records",
					dao.findBySql(whereSql + " " + orderBy, page, limit));
			return map;
		} catch (Throwable t) { 
			t.printStackTrace();
			return null;
		}
	}

	public Map getRecords(String whereSql, int page, int limit) {
		Map map = new HashMap();
		map.put("count", dao.getRowsCount(whereSql));
		map.put("records", dao.findBySql(whereSql, page, limit));
		return map;
	}

	public int deleteByIds(final String ids) throws Exception{
		return dao.deleteByIds(ids);
	}
	public int deleteBySql(final String sql) throws Exception{
		return dao.deleteBySql(sql);
	}
	//根据多选的记录集指修改指定的字段
	/** 批量修改指定字段json格式{name:..,value:...},ids:1,2,3,5... */
	public int updateFields(String json,String ids) throws Exception {		
		JSONObject jsonObject = JSONObject.fromObject(json);	
		return dao.updateFields(jsonObject.getString("name"),jsonObject.getString("value"),ids);
	}
	

	public void setDao(GenericDao dao) {
		this.dao = dao;
	}

	public List<T> findBySql(String whereSql) {
		log.info("finding  with whereSql: " + whereSql);
		return dao.findBySql(whereSql);
	}

	public List<T> findBySql(final String whereSql, final int page,
			final int pageSize) {
		return dao.findBySql(whereSql, page, pageSize);
	}
	public T findById(Long id) {
		log.info("finding  with id: " + id);
		return (T)dao.findById(id);
	}
}
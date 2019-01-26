package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.Mater;
import cn.com.topit.gl.service.MaterService;


public class MaterAction extends GenericActionSupport<Mater> {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(MaterAction.class);
	private MaterService service;
	protected Double atct;
	protected String materid;

	public void setService(MaterService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 根据查询条件获取记录集
	public String getMaterComboBox() {
		try {
			records.put("records",  service
					.getMaterComboBox(baseSql + whereSql+order));
		} catch (Exception e) {
			log.error("getMaterComboBox出错："+e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
	// 修改库存数量
	public int updateAtct() {
		int r=0;
		try {
			 r = service.updateAtct(atct, materid);
		} catch (Exception e) {
			log.error("updateAtct出错："+e.toString());
			e.printStackTrace();
		}
		return r;
	}
}

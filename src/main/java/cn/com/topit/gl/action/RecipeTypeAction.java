package cn.com.topit.gl.action;

import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.RecipeTypeService;

public class RecipeTypeAction<RecipeType> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory
			.getLogger(RecipeTypeAction.class);
	private RecipeTypeService service;

	public void setService(RecipeTypeService service) {
		this.service = service;
		super.setAbstractService(service);
	}

	// 根据查询条件获取记录集
	public String getRecipeTypesComboBox() {
		try {
			records.put("records",
					service.getRecipeTypesComboBox(baseSql + whereSql + order));
		} catch (Exception e) {
			log.error("getBuildingsComboBox出错：" + e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}

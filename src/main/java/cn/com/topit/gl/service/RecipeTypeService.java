package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.RecipeType;
import cn.com.topit.gl.dao.RecipeTypeDao;

public class RecipeTypeService extends AbstractService<RecipeType> {
	public List getRecipeTypesComboBox(final String whereSql) {
		return ((RecipeTypeDao) dao).getRecipeTypesComboBox(whereSql);
	}
}

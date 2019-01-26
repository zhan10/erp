package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Mater;
import cn.com.topit.gl.dao.MaterDao;
public class MaterService extends AbstractService<Mater>{
	public List getMaterComboBox(final String whereSql) {
		return ((MaterDao) dao).getMaterComboBox(whereSql);
	}
	public int updateAtct(Double atct,String materid) {
		return ((MaterDao) dao).updateAtct(atct, materid);
	}
}

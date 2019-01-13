package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.MemberLevel;
import cn.com.topit.gl.dao.MemberLevelDao;

public class MemberLevelService extends AbstractService<MemberLevel> {
	public List getMemberLevelComboBox(final String whereSql) {
		return ((MemberLevelDao) dao).getMemberLevelComboBox(whereSql);
	}
}

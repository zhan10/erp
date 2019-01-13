package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.RoleResource;
import cn.com.topit.gl.dao.RoleResourceDao;

public class RoleResourceService extends AbstractService<RoleResource> {
	// 根据角色名称ID取得资源列表
	public List<String> findResourceUrlsByRoleName(String roleName) {
		return ((RoleResourceDao) dao).findResourceUrlsByRoleName(roleName);
	}
}

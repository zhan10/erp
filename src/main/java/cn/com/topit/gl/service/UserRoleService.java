package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.UserRole;
import cn.com.topit.gl.dao.UserRoleDao;

public class UserRoleService extends AbstractService<UserRole> {
	public List<String> findRolesByUsersId(Long userId){
		return ((UserRoleDao)dao).findRoles(userId);
	}
}

package cn.com.topit.gl.dao;

import java.util.List;

import cn.com.topit.base.GenericDaoImpl;

public class RoleResourceDao extends GenericDaoImpl<RoleResource, Long> {

	public RoleResourceDao(Class<RoleResource> type) {
		super(type);
		// TODO Auto-generated constructor stub
	}

	// 根据角色名称ID取得资源列表
	public List<String> findResourceUrlsByRoleName(String roleName) {
		try {
			String queryString = "select url from v_role_resource where role_name='"
					+ roleName + "'";
			return (List<String>) (sessionFactory.getCurrentSession()
					.createSQLQuery(queryString).list());
		} catch (Exception e) {
			log.error("RoleResource.findResourceUrlsByRoleName failed",
					e.toString());
			e.printStackTrace();
		}
		return null;
	}

}

package cn.com.topit.gl.dao;

import java.util.List;

import cn.com.topit.base.GenericDaoImpl;

public class UserRoleDao extends  GenericDaoImpl<UserRole,Long>{

	public UserRoleDao(Class<UserRole> type) {
		super(type);
		// TODO Auto-generated constructor stub
	}
	//根据用户ID取得角色名称列表
	public List<String> findRoles(Long userId){
		try {
			String queryString = "select name from v_user_role where user_id=" +userId;
			return (List<String>) (sessionFactory.getCurrentSession().createSQLQuery(
					queryString).list());
		} catch (Exception e) {
			log.error("userRole.findRoles failed",
					e.toString());
			e.printStackTrace();
		}
		return null;
	}
	
	
}

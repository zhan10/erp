package cn.com.topit.gl.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Resource;
import cn.com.topit.gl.dao.ResourceDao;
import cn.com.topit.gl.dao.RoleResource;
import cn.com.topit.gl.dao.RoleResourceDao;

public class ResourceService extends AbstractService<Resource> {
	ResourceDao resourceDao;
	RoleResourceDao roleResourceDao;
	// 用户角色保存关联信息
	public void saveRoles(String json, String others) throws Exception {
		resourceDao = (ResourceDao) dao;
		Long id;
		try {
			id = new Long(json);
		} catch (Exception e) {
			log.error("未传递资源ID" + e.toString());
			e.printStackTrace();
			throw e;
		}
		try {
			HashSet set = new HashSet();
			if (others != null && !others.equals("")) {
				JSONArray list = JSONObject.fromObject(others).getJSONArray("rolesItem");
				for (int i = 0; i <= list.size() - 1; i++) {
					RoleResource roleResource = new RoleResource();
					roleResource.setRoleId(list.getJSONObject(i).getLong("id"));
					set.add(roleResource);
				}
			}
			resourceDao.saveRoles(id, set);
		} catch (Exception e) {
			e.printStackTrace();
			log.error("拷贝属性出错/保存出错:" + e.toString());
			dao.clear();
			throw e;
		}
	}
	// 根据角色保存对应的资源
		//传值json:资源id字符串列表（逗号分隔），others:角色id
		public void saveByRoles(String json, String others) throws Exception {
			resourceDao = (ResourceDao) dao;
			Long roleId;
			try {
				roleId = new Long(others);
			} catch (Exception e) {
				log.error("未传递角色ID" + e.toString());
				e.printStackTrace();
				throw e;
			}
			try {
				//删除role_resource表中角色对应的所有记录
				roleResourceDao.deleteBySql(" and roleId=" + roleId);
				//System.out.println(roleId);
				if(json!=null&&json.length()>0){
					String[] ids=json.split(",");
					for(String  resourceId : ids){
						  RoleResource roleResource=new RoleResource();
						  roleResource.setRoleId(roleId);
						  roleResource.setResourceId(new Long(resourceId));
						  roleResourceDao.save(roleResource);
					}
				}				
			} catch (Exception e) {
				e.printStackTrace();
				log.error("保存出错:" + e.toString());
				dao.clear();
				throw e;
			}
		}
	/*
	 * 根据角色id生成resource树
	 * 
	 * @param rolesId 角色ID
	 * 
	 * @param parentId 上级树节点ID
	 * 
	 * @return Map(count,records)
	 */
	public Map getRecordsByRolesId(Long rolesId, Long parentId) {
		Map map = new HashMap();
		List list = dao.findBySql(" and parentId=" + parentId + " order by name", 1, 9999);
		Iterator it = list.iterator();
		boolean checked;
		while (it.hasNext()) {
			checked = true;
			Resource resource = (Resource) (it.next());
			List rrList = roleResourceDao.findBySql(" and roleId=" + rolesId + " and resourceId=" + resource.getId());
			if (rrList == null || rrList.size() == 0)
				checked = false;
			resource.setChecked(checked);
		}		
		map.put("records",list);		
		return map;
	}
	public void setRoleResourceDao(RoleResourceDao roleResourceDao) {
		this.roleResourceDao = roleResourceDao;
	}
}

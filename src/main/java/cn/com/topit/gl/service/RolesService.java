package cn.com.topit.gl.service;

import java.math.BigDecimal;
import java.util.HashSet;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Roles;
import cn.com.topit.gl.dao.RolesDao;
import cn.com.topit.gl.dao.UserRole;

public class RolesService extends AbstractService<Roles> {
	RolesDao rolesDao;
	//保存角色信息及相关人员信息
	public Roles saveUsers(String json, String others) throws Exception {
		rolesDao=(RolesDao)dao;
		Roles t;
		JSONObject jsonObject = JSONObject.fromObject(json);
		// json含id信息说明是编辑记录，否则为新建记录
		if (jsonObject.getString("id") == null || jsonObject.getString("id").equals(""))
			try {
				t = new Roles();
			} catch (Exception e) {
				log.error("创建新记录出错：" + e.toString());
				e.printStackTrace();
				throw e;
			}
		else {
			t = (Roles) dao.findById(Long.parseLong((jsonObject.getString("id"))));
			if (t == null) {
				log.error("未找到待保存记录！");
				throw new Exception("未找到待保存记录！");
			}
		}
		try {
			BeanUtils.copyProperties(t, jsonObject);
			HashSet set=new HashSet();		
			if(others!=null&&!others.equals("")){
				JSONArray list = JSONObject.fromObject(others).getJSONArray("usersItem");
				for (int i = 0; i <= list.size() - 1; i++) {	
					UserRole userRole=new UserRole();
					userRole.setUserId(list.getJSONObject(i).getLong("id"));
					set.add(userRole);
				}
			}
			return (Roles) rolesDao.saveUsers(t,set);			
		} catch (Exception e) {
			log.error("拷贝属性出错/保存出错:" + e.toString());
			dao.clear();
			throw e;
		}
	}
	//用户角色保存关联信息
		public void saveByUsers(String json, String others) throws Exception {
			rolesDao=(RolesDao)dao;
			Long id;
			try{
				id=new Long(json);
			}catch(Exception e){
				log.error("未传递用户ID" + e.toString());
				e.printStackTrace();
				throw e;
			}
			try{
				HashSet set=new HashSet();		
				if(others!=null&&!others.equals("")){
					JSONArray list = JSONObject.fromObject(others).getJSONArray("rolesItem");
					for (int i = 0; i <= list.size() - 1; i++) {	
						UserRole userRole=new UserRole();
						userRole.setRoleId(list.getJSONObject(i).getLong("id"));
						set.add(userRole);
					}
				}
				rolesDao.saveByUsers(id,set);			
			} catch (Exception e) {
				e.printStackTrace();
				log.error("拷贝属性出错/保存出错:" + e.toString());
				dao.clear();
				throw e;
			}
		}
}

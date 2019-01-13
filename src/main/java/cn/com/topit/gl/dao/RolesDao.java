package cn.com.topit.gl.dao;
import java.util.HashSet;
import java.util.Iterator;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class RolesDao extends GenericDaoImpl<Roles, Long>{
	private static final Logger log=LoggerFactory.getLogger(RolesDao.class);
	public RolesDao(Class<Roles> type) {
		super(type);
	}
	/**
	 * 保存相关联的定单信息，并返回原实例
	 * 
	 * 
	 */
	public Roles saveUsers(Roles roles,HashSet set) throws Exception {
		log.info("保存角色－用户信息 ");	
		Session session=sessionFactory.getCurrentSession();
		session.setFlushMode(FlushMode.COMMIT);
		try{
			checkData(roles);			
		}catch(Exception e){			
			throw e;
		}
		try {
			roles = (Roles) (session.merge(roles));
			session.createQuery("delete UserRole where roleId="+roles.getId()).executeUpdate();	
			Iterator it=set.iterator();
			while(it.hasNext()){
				UserRole userRole=(UserRole)it.next();
				userRole.setRoleId(roles.getId());
				session.save(userRole);
			}			
			return roles;
		} catch (Exception e) {			
			log.error("save " + roles.getClass().getName() + " failed"
					+ e.toString());
			e.printStackTrace();
			throw e;
		}		
	}
	public void saveByUsers(Long id,HashSet set) throws Exception {
		log.info("保存角色－用户信息 ");	
		Session session=sessionFactory.getCurrentSession();		
		try {
			session.createQuery("delete UserRole where userId="+id).executeUpdate();			
			Iterator it=set.iterator();
			while(it.hasNext()){
				UserRole userRole=(UserRole)it.next();
				userRole.setUserId(id);
				session.save(userRole);
			}					
		} catch (Exception e) {			
			log.error("saveByUsers failed"
					+ e.toString());
			e.printStackTrace();
			throw e;
		}		
	}
}


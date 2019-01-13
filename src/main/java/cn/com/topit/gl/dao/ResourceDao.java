package cn.com.topit.gl.dao;
import java.util.HashSet;
import java.util.Iterator;

import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class ResourceDao extends GenericDaoImpl<Resource, Long>{
	private static final Logger log=LoggerFactory.getLogger(ResourceDao.class);
	public ResourceDao(Class<Resource> type) {
		super(type);
	}
	public void saveRoles(Long id,HashSet set) throws Exception {
		log.info("保存资源－角色信息 ");	
		Session session=sessionFactory.getCurrentSession();		
		try {
			session.createQuery("delete RoleResource where resourceId="+id).executeUpdate();			
			Iterator it=set.iterator();
			while(it.hasNext()){
				RoleResource roleResource=(RoleResource)it.next();
				roleResource.setResourceId(id);
				session.save(roleResource);
			}					
		} catch (Exception e) {			
			log.error("saveRoles failed"
					+ e.toString());
			e.printStackTrace();
			throw e;
		}	
	}
}


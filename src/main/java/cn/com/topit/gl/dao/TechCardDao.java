package cn.com.topit.gl.dao;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Iterator;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class TechCardDao extends GenericDaoImpl<TechCard, Long>{
	private static final Logger log=LoggerFactory.getLogger(TechCardDao.class);
	public TechCardDao(Class<TechCard> type) {
		super(type);
	}
	/**
	 * 保存相关联的定单信息，并返回原实例
	 * 
	 * 
	 */
	public TechCard saveAll(TechCard techCard,HashSet set) throws Exception {
		log.info("保存工艺卡片－定单关联信息 ");	
		Session session=sessionFactory.getCurrentSession();
		session.setFlushMode(FlushMode.COMMIT);
		try{
			checkData(techCard);			
		}catch(Exception e){			
			throw e;
		}
		try {
			techCard = (TechCard) (session.merge(techCard));
			session.createQuery("delete TechCardOrders where techCardId="+techCard.getId());
			Iterator it=set.iterator();
			while(it.hasNext()){
				TechCardOrders orders=(TechCardOrders)it.next();
				orders.setTechCardId(techCard.getId());
				session.save(orders);
			}			
			return techCard;
		} catch (Exception e) {			
			log.error("save " + techCard.getClass().getName() + " failed"
					+ e.toString());
			e.printStackTrace();
			throw e;
		}
		
	}
}

package cn.com.topit.gl.dao;
import java.util.List;

import cn.com.topit.base.GenericDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VBookingDao extends GenericDaoImpl<VBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBookingDao.class);
	public VBookingDao(Class<VBooking> type) {
		super(type);
	}
	
	public List getTotal(String status,String bookingTime,String buildingName,
			String code,String consumerName) {
		    String st ="";
		    String bt ="";
		    String bn ="";
		    String cd ="";
		    String cn ="";
		try {
			if (status!=""&&!status.equals("-1"))
			st=bn=" and status ="+ Integer.parseInt(status);
			if (bookingTime!=""&&!bookingTime.equals("1970-01-01"))
			bt=" and datediff(day,'"+bookingTime+"',bookingTime)=0";
			if (buildingName != "")
			bn=" and buildingName like '%"+ buildingName+ "%' ";
			if (code != "")
			cd=" and code like '%"+ code+ "%' ";
			if (consumerName != "")
			cn=" and consumerName like '%"+ consumerName+ "%' ";
			String queryString = "SElECT total From VBooking WHERE 1=1"+st+bt+bn+cd+cn;
			return (List) (sessionFactory.getCurrentSession().createQuery(
					queryString).list());
		} catch (Exception e) {
			log.error("getGenre 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}

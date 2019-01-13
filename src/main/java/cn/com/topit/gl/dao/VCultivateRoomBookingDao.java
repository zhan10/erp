package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VCultivateRoomBookingDao extends GenericDaoImpl<VCultivateRoomBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(VCultivateRoomBookingDao.class);
	public VCultivateRoomBookingDao(Class<VCultivateRoomBooking> type) {
		super(type);
	}
}

package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VRentContractDao extends GenericDaoImpl<VRentContract, Long>{
	private static final Logger log=LoggerFactory.getLogger(VRentContractDao.class);
	public VRentContractDao(Class<VRentContract> type) {
		super(type);
	}
}

package cn.com.topit.gl.dao;
import java.util.List;

import cn.com.topit.base.GenericDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class RentContractDao extends GenericDaoImpl<RentContract, Long>{
	private static final Logger log=LoggerFactory.getLogger(RentContractDao.class);
	public RentContractDao(Class<RentContract> type) {
		super(type);
	}
}

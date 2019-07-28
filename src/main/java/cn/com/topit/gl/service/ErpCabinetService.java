package cn.com.topit.gl.service;
import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.ErpCabinet;
import cn.com.topit.gl.dao.ErpCabinetDao;
public class ErpCabinetService extends AbstractService<ErpCabinet>{
	public int decompose(String decompose,Long decomposeId,Long ordersId) {
		return ((ErpCabinetDao) dao).decompose(decompose, decomposeId, ordersId);
	}
}

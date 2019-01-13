package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VRecipeDao extends GenericDaoImpl<VRecipe, Long>{
	private static final Logger log=LoggerFactory.getLogger(VRecipeDao.class);
	public VRecipeDao(Class<VRecipe> type) {
		super(type);
	}
}

package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class RecipeDao extends GenericDaoImpl<Recipe, Long>{
	private static final Logger log=LoggerFactory.getLogger(RecipeDao.class);
	public RecipeDao(Class<Recipe> type) {
		super(type);
	}
}

package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class RecipeTypeDao extends GenericDaoImpl<RecipeType, Long>{
	private static final Logger log=LoggerFactory.getLogger(RecipeTypeDao.class);
	public RecipeTypeDao(Class<RecipeType> type) {
		super(type);
	}
	// 选择下拉框数据
		public List getRecipeTypesComboBox(final String whereSql) {
			log.info("finding " + type.getClass().getName() + " with whereSql: "
					+ whereSql);
			try {
				String queryString = "select id,name from " + tableName
						+ " where 1=1 " + whereSql;
				return (List) (sessionFactory.getCurrentSession().createQuery(
						queryString).list());
			} catch (Exception e) {
				log.error("getRecipeTypesComboBox 出错：" + e.toString());
				e.printStackTrace();
			}
			return null;
		}
}

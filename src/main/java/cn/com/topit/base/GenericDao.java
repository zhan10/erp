package cn.com.topit.base;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

//参考http://www.ibm.com/developerworks/cn/java/j-genericdao.html
public interface GenericDao<T,PK extends Serializable> {
	T save(T newInstance) throws Exception;

	T findById(PK id);

	void delete(T persistentObject) throws Exception;

	List<T> findBySql(String whereSql) ;

	List<T> findBySql(String whereSql, int page, int pageSize);

	int getRowsCount(String whereSql);
	int deleteByIds(String ids) throws Exception;
	int deleteBySql(String sql) throws Exception;
	int deleteByIds(PK[] ids) throws Exception;
	//根据多选的记录集指修改指定的字段
	public int updateFields(final String field,final String fieldValue,final String ids) throws Exception;
	//清session缓存
	public void clear();
}
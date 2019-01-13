package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.GenreService;

public class GenreAction<Genre> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(GenreAction.class);
	private GenreService service;
	public void setService(GenreService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 根据查询条件获取记录集
				public String getGenreComboBox() {
					try {
						records.put("records",  service
								.getGenreComboBox(baseSql + whereSql+order));
					} catch (Exception e) {
						log.error("getGenreComboBox出错："+e.toString());
						e.printStackTrace();
					}
					return "managerExt";
				}
}

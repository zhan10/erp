package cn.com.topit.gl.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.Genre;
import cn.com.topit.gl.service.GenreService;
import cn.com.topit.gl.service.ProductTypeService;
import cn.com.topit.gl.service.ProductsService;

public class ProductTypeAction<ProductType> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory
			.getLogger(ProductTypeAction.class);
	private ProductTypeService service;
	private GenreService genreService;
	private ProductsService productsService;
	private List list;

	public void setService(ProductTypeService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	 public void delete() {
			// 格式为以逗号分隔的id列表，如1,3,6,7...
			HttpServletResponse response = ServletActionContext.getResponse();
			response.reset();
			response.setCharacterEncoding("utf-8");
			try {
			    log.info("删除ids:" + extJson);
			    String[] extJsons = extJson.split(",");
			    int delItems = service.deleteByIds(extJson);
			    for(int i=0;i<extJsons.length;i++){
			    	String a = extJsons[i];
			    	genreService.deleteBySql("and productTypeId="+a);
			    	productsService.deleteBySql("and productId="+a);
			    }
			    response.getWriter().print("success!" + delItems);
			} catch (Exception e) {
			    log.error(e.toString());
			    try {
				response.getWriter().print("删除失败(可能有关联的数据未被删除)！");
			    } catch (Exception ex) {
				log.error(ex.toString());
			    }
			}
		    }

	public void save() {
		HttpServletResponse response = ServletActionContext.getResponse();
		cn.com.topit.gl.dao.ProductType t;
		cn.com.topit.gl.dao.Genre genre;
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		String json = (extJson);
		response.reset();
		response.setCharacterEncoding("utf-8");
		log.info(json);
		try {
			t = (cn.com.topit.gl.dao.ProductType) service.saveByJson(json);
			response.getWriter().print("topit_ext_id!" + t.getId());
			Long id = t.getId();
			if(list!=null){
				for (int i = 0; i < list.size(); i++) {
					String json1 = (String) list.get(i);
					JSONObject jsonObject = JSONObject.fromObject(json1);
					Genre g = (Genre) JSONObject.toBean(jsonObject, Genre.class);// 将建json对象转换为Person对象
					g.setProductTypeId(id);
					genre = (cn.com.topit.gl.dao.Genre) genreService.save(g);
					int a=productsService.updatePrice1(genre.getPrice(), genre.getId());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error("保存出错" + e.getMessage());
			try {
				response.getWriter().print("保存出错！" + e.getMessage());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}

	// 根据查询条件获取记录集
	public String getProductTypesComboBox() {
		try {
			records.put("records",
					service.getProductTypesComboBox(baseSql + whereSql + order));
		} catch (Exception e) {
			log.error("getProductTypesComboBox出错：" + e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}

	public GenreService getGenreService() {
		return genreService;
	}

	public void setGenreService(GenreService genreService) {
		this.genreService = genreService;
		super.setAbstractService(service);
	}

	public ProductsService getProductsService() {
		return productsService;
	}
	public void setProductsService(ProductsService productsService) {
		this.productsService = productsService;
		super.setAbstractService(service);
	}
	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

}

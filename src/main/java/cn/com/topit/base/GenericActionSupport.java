package cn.com.topit.base;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.BigDecimalConverter;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import cn.com.topit.common.util.BooleanConvert;
import cn.com.topit.common.util.ByteConvert;
import cn.com.topit.common.util.DateConvert;
import cn.com.topit.common.util.DoubleConvert;
import cn.com.topit.common.util.IntConvert;
import cn.com.topit.common.util.LongConvert;
import cn.com.topit.common.util.ShortConvert;
import cn.com.topit.common.util.UTF2GBK;

import com.opensymphony.xwork2.ActionSupport;

public class GenericActionSupport<T extends GenericPojo> extends ActionSupport {
    private static final long serialVersionUID = 1109927956688347166L;
    protected int defaultPageSize = 20;// 缺省每页记录数
    protected int start = 0;// 页面传递起始记录
    protected int page = 1;// 页面传递起始页面
    protected int limit = defaultPageSize;// 页面传递的每页记录数
    protected String baseSql = "";// 页面传递的基础查询条件字符串
    protected String order = "";// 排序信息
    protected String whereSql = "";// 页面传递的其它查询条件字符串
    protected String others = "";// 页面传递的其它信息字符串
    protected String extJson = "";// 页面传递的json
    protected String _dc;
    protected Map<String, Object> records = new HashMap<String, Object>();// 返回记录,map.put("records",list),map.put("sum",long)
    protected AbstractService service;
    protected static final Logger log = LoggerFactory
	    .getLogger(GenericActionSupport.class);
    static {
	// 注册BeanUtils.copyProperties
	// 避免空值时自动设值，如int类型会自动设为0
	ConvertUtils.register(new DateConvert(), java.util.Date.class);
	ConvertUtils.register(new DoubleConvert(), java.lang.Double.class);
	ConvertUtils.register(new IntConvert(), java.lang.Integer.class);
	ConvertUtils.register(new ShortConvert(), java.lang.Short.class);
	ConvertUtils.register(new ByteConvert(), java.lang.Byte.class);
	ConvertUtils.register(new LongConvert(), java.lang.Long.class);
	ConvertUtils.register(new BooleanConvert(), java.lang.Boolean.class);
	ConvertUtils.register(new BigDecimalConverter(null),
		java.math.BigDecimal.class);

    }

    public Map<String, Object> getRecords() {
	// public才能生成json
	return records;
    }

    public String getExtJson() {
	return extJson;
    }

    public void setExtJson(String extJson) {
	this.extJson = extJson;
    }

    public int getDefaultPageSize() {
	return defaultPageSize;
    }

    public void setDefaultPageSize(int defaultPageSize) {
	this.defaultPageSize = defaultPageSize;
    }

    public String getBaseSql() {
	return baseSql;
    }

    public void setBaseSql(String baseSql) {
	this.baseSql = baseSql;
    }

    public String getOrder() {
	return order;
    }

    public void setOrder(String order) {
	this.order = order;
    }

    public String getWhereSql() {
	return whereSql;
    }

    public void setWhereSql(String whereSql) {
	this.whereSql = whereSql;
    }

    public String getOthers() {
	return others;
    }

    public void setOthers(String others) {
	this.others = others;
    }

    public int getLimit() {
	return limit;
    }

    public void setLimit(int limit) {
	this.limit = limit;
    }

    public int getPage() {
	return page;
    }

    public void setPage(int page) {
	this.page = page;
    }

    public int getStart() {
	return start;
    }

    public void setStart(int start) {
	this.start = start;
    }

    public String manager() throws Exception {
	return "manager";
    }

    // spring-security中取用户名
    public String getUser() {
	SecurityContext secCtx = SecurityContextHolder.getContext();
	Authentication auth = secCtx.getAuthentication();
	Object principal = auth.getPrincipal();
	String userName = "";
	if (principal instanceof UserDetails) {
	    userName = ((UserDetails) principal).getUsername();
	} else {
	    userName = principal.toString();
	}
	return userName;
    }

    // spring-security中取用户名
    public Long getUserId() {
	Long id=null;
	Object principal = SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
	if (principal instanceof TopitUser) {
	    String username = ((TopitUser) principal).getUsername();
	    id = ((TopitUser) principal).getUserId();	   
	    /*
	     * Iterator it = ((TopitUser)principal).getAuthorities().iterator();
	     * String authority = ""; while(it.hasNext()){ authority =
	     * ((GrantedAuthority)it.next()).getAuthority();
	     * System.out.println("Authority:"+authority); }
	     */
	}
	return id;
    }

    // 根据传递的json字符串删除对应的记录集
    public void delete() {
	// 格式为以逗号分隔的id列表，如1,3,6,7...
	HttpServletResponse response = ServletActionContext.getResponse();
	response.reset();
	response.setCharacterEncoding("utf-8");
	try {
	    log.info("删除ids:" + extJson);
	    int delItems = service.deleteByIds(extJson);
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

    // 根据查询条件获取记录集
    public String managerExt() {
	try {
	   Map map = service
		    .getRecords(baseSql + whereSql, page, limit, order);
	    records.put("sum", map.get("count"));
	    records.put("records", map.get("records"));
	} catch (Exception e) {
	    log.error("managerExt出错：" + e.toString());
	    e.printStackTrace();
	}
	/*
	 * Authentication
	 * authen=SecurityContextHolder.getContext().getAuthentication();
	 * 
	 * for (GrantedAuthority authority : authen.getAuthorities()){
	 * System.out.println(authority.getAuthority()); }
	 */
	return "managerExt";
    }

    public void save() {
    HttpServletResponse response = ServletActionContext.getResponse();
	T t;
	// String json = UTF2GBK.unicodeToUtf8(extJson);//
	// extjs中json.encode编码为unicode，要转换为utf-8
	String json = (extJson);
	response.reset();
	response.setCharacterEncoding("utf-8");
	log.info(json);
	try {
	    t = (T) service.saveByJson(json);
	    response.getWriter().print("topit_ext_id!" + t.getId());
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

    // 批量修改字段
    public void updateFields() {
	// 传递参数extJson格式{name:...,value:...}，others格式为逗号分隔的id列表，如1,3,6,7...
	HttpServletResponse response = ServletActionContext.getResponse();
	response.reset();
	// response.setCharacterEncoding("utf-8");
	try {
	    log.info("批量更新字段:" + extJson + ",ids:" + others);
	    int updateItems = service.updateFields(extJson, others);
	    response.getWriter().print("success!" + updateItems);
	} catch (Exception e) {
	    log.error(e.toString());
	    try {
		response.getWriter().print("更新失败！" + e.toString());
	    } catch (Exception ex) {
		log.error(ex.toString());
	    }
	}
    }

    public void setAbstractService(AbstractService service) {
	this.service = service;
    }

	public String get_dc() {
		return _dc;
	}

	public void set_dc(String _dc) {
		this._dc = _dc;
	}
}

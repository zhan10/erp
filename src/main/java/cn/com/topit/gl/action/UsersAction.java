package cn.com.topit.gl.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.UsersService;

public class UsersAction<Users> extends GenericActionSupport {
    private static final long serialVersionUID = 1L;
    private static final Logger log = LoggerFactory
	    .getLogger(UsersAction.class);
    private UsersService service;

    public void setService(UsersService service) {
	this.service = service;
	super.setAbstractService(service);

    }

    // 根据查询条件获取记录集
    public String getUsersComboBox() {
	try {
	    records.put("records",
		    service.getUsersComboBox(baseSql + whereSql + order));
	} catch (Exception e) {
	    log.error("getUsersComboBox出错：" + e.toString());
	    e.printStackTrace();
	}
	return "managerExt";
    }

    // 只取用户名字、工号
    public String getUsersNameCode() {
	try {
	    Map map = service.getUsersNameCode(baseSql + whereSql, page, limit,
		    order);
	    records.put("sum", map.get("count"));
	    records.put("records", map.get("records"));
	} catch (Exception e) {
	    log.error("getUsersNameCode出错：" + e.toString());
	    e.printStackTrace();
	}
	return "managerExt";
    }
   //修改密码
    public void chgPwd(){
	HttpServletResponse response = ServletActionContext.getResponse();
	Users t;
	// String json = UTF2GBK.unicodeToUtf8(extJson);//
	// extjs中json.encode编码为unicode，要转换为utf-8	
	System.out.println(extJson);
	JSONObject jsonObject = JSONObject.fromObject(extJson);System.out.println(jsonObject);
	jsonObject.put("id",getUserId());System.out.println(jsonObject);
	response.reset();
	response.setCharacterEncoding("utf-8");
	
	try {
	    t = (Users) service.saveByJSONObject(jsonObject);
	    response.getWriter().print("topit_ext_id!" +getUserId());
	} catch (Exception e) {
	    e.printStackTrace();
	    log.error("保存出错" + e.getMessage());
	    try {
		response.getWriter().print("修改密码出错！" + e.getMessage());
	    } catch (IOException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	    }
	}
    }
    
}

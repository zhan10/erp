package cn.com.topit.gl.action;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.MarketingService;
public class MarketingAction<Marketing> extends GenericActionSupport {
	private File uploadFile;
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(MarketingAction.class);
	private MarketingService service;
	private String uploadFileName;
	public void setService(MarketingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	
	// 根据查询条件获取记录集
	public String getMarketingComboBox() {
		try {
			records.put("records",  service
					.getMarketingComboBox(baseSql + whereSql+order));
		} catch (Exception e) {
			log.error("getMarketingComboBox出错："+e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
	@Override
	public void save() {
		HttpServletResponse response = ServletActionContext.getResponse();
		cn.com.topit.gl.dao.Marketing marketing;
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		String json = (extJson);
		JSONObject jsonObject=JSONObject.fromObject(json);	
		response.reset();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		log.info(json);
		try {
			String realpath = ServletActionContext.getServletContext()
					.getRealPath("\\pics\\marketing");
			File savefile = new File(realpath);
			if (!savefile.exists())
				savefile.mkdirs();
			String fileName = uploadFileName;
			boolean delFileFlag=false;			
			if(jsonObject.containsKey("delFileFlag"))
				delFileFlag=true;			
			//删除原文件
			if(delFileFlag|| uploadFile != null){
				if(jsonObject.getString("pic")!=null||!jsonObject.getString("pic").equals("")){
					savefile=new File(realpath+ "\\" + jsonObject.getString("pic"));
					savefile.delete();
					jsonObject.put("pic","");
				}					
			}
			if (uploadFile != null) {
				savefile = new File(realpath + "\\" + fileName);
				while (savefile.exists()) {
					fileName = "c" + fileName;
					savefile = new File(realpath + "\\" + fileName);
				}			
				FileUtils.copyFile(uploadFile, savefile);	
				jsonObject.put("pic", savefile.getName()==null?"":savefile.getName());
			}				
			marketing = service.saveByJSONObject(jsonObject);
			response.getWriter().print(
					"{success:true,topit_ext_id:" + marketing.getId() + "}");
			// System.out.println("topit_ext_id!" + city.getId());
		} catch (Exception e) {
			e.printStackTrace();
			log.error("保存出错" + e.getMessage());
			try {
				response.getWriter().print(
						"{success:false,errMsg:" + e.getMessage() + "}");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public File getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public String manager1() throws Exception {
		return "manager1";
	}
	public String manager2() throws Exception {
		return "manager2";
	}
	public String manager3() throws Exception {
		return "manager3";
	}
	public String manager4() throws Exception {
		return "manager4";
	}
	public String manager5() throws Exception {
		return "manager5";
	}
}

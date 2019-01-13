package cn.com.topit.gl.action;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import cn.com.topit.base.GenericActionSupport;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.gl.service.NewWorkbenchService;
public class NewWorkbenchAction<NewWorkbench> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(NewWorkbenchAction.class);
	private NewWorkbenchService service;
	private String uploadFileName1;
	private File uploadFile1;
	private String uploadFileName2;
	private File uploadFile2;
	private String floorId;
	private String id;
	public void setService(NewWorkbenchService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 根据查询条件获取记录集
	public String getWorkbenchComboBox() {
		try {
			records.put("records",  service
					.getWorkbenchComboBox(baseSql + whereSql+order));
		} catch (Exception e) {
			log.error("getWorkbenchComboBox出错："+e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
	
	public void findByFloorId(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.reset();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		try {
			if(service.findByFloorId(floorId)){
				response.getWriter().print("true");
			}else{
				response.getWriter().print("false");
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			try {
				response.getWriter().print("false");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	public void save() {
		HttpServletResponse response = ServletActionContext.getResponse();
		cn.com.topit.gl.dao.NewWorkbench workbench;
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		String json = (extJson);
		JSONObject jsonObject=JSONObject.fromObject(json);	
		response.reset();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		log.info(json);
		
		String[] names={uploadFileName1,uploadFileName2};
		File[] files={uploadFile1,uploadFile2};
		String[] array={"planePic","coverPic"};
		boolean delFileFlag0=false;	
		boolean delFileFlag1=false;
		boolean[] flags={delFileFlag0,delFileFlag1};
		try {
			for (int i = 0; i < names.length; i++) {			
				String realpath = ServletActionContext.getServletContext()
						.getRealPath("\\pics\\newWorkbench");
				File savefile = new File(realpath);
				if (!savefile.exists())
					savefile.mkdirs();
				String fileName = names[i];		
				if(jsonObject.containsKey("delFileFlag"+i))
					flags[i]=true;		
				//删除原文件
				if(flags[i]|| files[i] != null){
					if(jsonObject.getString(array[i])!=null||!jsonObject.getString(array[i]).equals("")){
						savefile=new File(realpath+ "\\" + jsonObject.getString(array[i]));
						savefile.delete();
						jsonObject.put(array[i],"");
					}					
				}
				if(files[i]==null){
					continue;
				}
				if (files[i] != null) {
					savefile = new File(realpath + "\\" + fileName);
					while (savefile.exists()) {
						fileName = "c" + fileName;
						savefile = new File(realpath + "\\" + fileName);
					}			
					FileUtils.copyFile(files[i], savefile);	
					jsonObject.put(array[i], savefile.getName()==null?"":savefile.getName());
				}				
			}
			
			
			workbench = service.saveByJSONObject(jsonObject);
			response.getWriter().print(
					"{success:true,topit_ext_id:" + workbench.getId() + "}");
			// System.out.println("topit_ext_id!" + workbench.getId());
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
	
		
	public String getFloorId() {
		return floorId;
	}
	public void setFloorId(String floorId) {
		this.floorId = floorId;
	}
	public String getUploadFileName1() {
		return uploadFileName1;
	}
	public void setUploadFileName1(String uploadFileName1) {
		this.uploadFileName1 = uploadFileName1;
	}
	public File getUploadFile1() {
		return uploadFile1;
	}
	public void setUploadFile1(File uploadFile1) {
		this.uploadFile1 = uploadFile1;
	}
	public String getUploadFileName2() {
		return uploadFileName2;
	}
	public void setUploadFileName2(String uploadFileName2) {
		this.uploadFileName2 = uploadFileName2;
	}
	public File getUploadFile2() {
		return uploadFile2;
	}
	public void setUploadFile2(File uploadFile2) {
		this.uploadFile2 = uploadFile2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}

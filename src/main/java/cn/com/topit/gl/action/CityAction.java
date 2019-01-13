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
import cn.com.topit.gl.dao.City;
import cn.com.topit.gl.service.CityService;


public class CityAction extends GenericActionSupport<City> {
	private File uploadFile;
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(CityAction.class);
	private CityService service;
	private String uploadFileName;

	public void setService(CityService service) {
		this.service = service;
		super.setAbstractService(service);
	}

	/*@Override
	public void save() {
		HttpServletResponse response = ServletActionContext.getResponse();
		cn.com.topit.gl.dao.City city;
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
					.getRealPath("\\pics\\city");
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
			city = service.saveByJSONObject(jsonObject);
			response.getWriter().print(
					"{success:true,topit_ext_id:" + city.getId() + "}");
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
	}*/
/*
	// 有附件的保存
	public void saveFile() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		cn.com.topit.gl.dao.City city;
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		String json = (extJson);
		String realpath = ServletActionContext.getServletContext().getRealPath(
				"/pics/city");
		File savefile = new File(realpath);
		if (!savefile.exists())
			savefile.mkdirs();
		String fileName = uploadFileName;
		if (pic != null) {
			savefile = new File(savefile + "\\" + fileName);
			while (savefile.exists()) {
				fileName = "c" + fileName;
				savefile = new File(savefile + "\\" + fileName);
			}

			*
			 * File savefile = new File(new File(realpath), pic.getName());
			 * while (uploadPath.exists()) { fileName = "c" + fileName;
			 * uploadPath = new File(baseUrl + fileUrl + fileName); }
			 *
			*
			 * if (!savefile.getParentFile().exists())
			 * savefile.getParentFile().mkdirs();
			 *
			FileUtils.copyFile(pic, savefile);
			// ActionContext.getContext().put("message", "文件上传成功");
			*
			 * BufferedInputStream bis = new BufferedInputStream( new
			 * FileInputStream(pic)); BufferedOutputStream bos = null; try { bos
			 * = new BufferedOutputStream(new FileOutputStream(realPath));//
			 * 为以防万一，以后写文件的路径尽量写成正双斜杠的 // 从源文件中取数据，写到目标文件中 byte[] buff = new
			 * byte[8192]; for (int len = -1; (len = bis.read(buff)) != -1;) {
			 * bos.write(buff, 0, len); } bos.flush(); } catch (IOException ie)
			 * { ie.printStackTrace(); // msg="文件上传失败"; response =
			 * ServletActionContext.getResponse();
			 * response.setContentType("text/html;charset=UTF-8"); // return
			 * "none"; } finally { if (bis != null) { try { bis.close(); } catch
			 * (IOException ie) { ie.printStackTrace(); } } if (bos != null) {
			 * try { bos.close(); } catch (IOException ie) {
			 * ie.printStackTrace(); } } }
			 *
		}
		// msg="文件上传成功";
		response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// return "none";
		// //////////////

	}
*/
	// 根据查询条件获取记录集
		public String getCitiesComboBox() {
			try {
				records.put("records",  service
						.getCitiesComboBox(baseSql + whereSql+order));
			} catch (Exception e) {
				log.error("getCitiesComboBox出错："+e.toString());
				e.printStackTrace();
			}
			return "managerExt";
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
}

package cn.com.topit.gl.action;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import cn.com.topit.base.GenericActionSupport;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.gl.service.OfficeService;
public class OfficeAction<Office> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(OfficeAction.class);
	private OfficeService service;
	private String uploadFileName;
	private File uploadFile;
	private String uploadFileName1;
	private File uploadFile1;
	private String uploadFileName2;
	private File uploadFile2;
	private String uploadFileName3;
	private File uploadFile3;
	private String uploadFileName4;
	private File uploadFile4;
	private String uploadFileName5;
	private File uploadFile5;
	public void setService(OfficeService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	@Override
	public void save() {
		HttpServletResponse response = ServletActionContext.getResponse();
		cn.com.topit.gl.dao.Office office;
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		//System.out.println("11111111111111111111111111111111111111111111111");
		String json = (extJson);
		JSONObject jsonObject=JSONObject.fromObject(json);	
		String str=jsonObject.getString("equipment");
		if(str.contains("[")){
			str=str.substring(1,str.length()-1);
		};
		jsonObject.put("equipment",str);
		response.reset();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		log.info(json);
		String[] names={uploadFileName,uploadFileName1,uploadFileName2,uploadFileName3,uploadFileName4,uploadFileName5};
		   File[] files={uploadFile,uploadFile1,uploadFile2,uploadFile3,uploadFile4,uploadFile5};
			String[] array={"pic","bigPic","leftPic","midPic","rightPic","planePic"};
			boolean delFileFlag0=false;	
			boolean delFileFlag1=false;	
			boolean delFileFlag2=false;	
			boolean delFileFlag3=false;	
			boolean delFileFlag4=false;	
			boolean delFileFlag5=false;	
			boolean[] flags={delFileFlag0,delFileFlag1,delFileFlag2,delFileFlag3,delFileFlag4,delFileFlag5};
			try {
				for (int i = 0; i < names.length; i++) {			
					String realpath = ServletActionContext.getServletContext()
							.getRealPath("\\pics\\office");
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
					//生成缩略图
					BufferedImage bufferedImage = ImageIO.read(savefile); //读取目标文件
					 int originalWidth = bufferedImage.getWidth();        //获取目标文件宽
				     int originalHeight = bufferedImage.getHeight();      //获取目标文件高
				     int tagWidth=(int)(originalWidth/2);                 //设置新图宽
				     int tagHeight=(int)(originalHeight/2);               //设置新图高
				     BufferedImage newImage = new BufferedImage(tagWidth, tagHeight, bufferedImage.getType());
			         Graphics g = newImage.getGraphics();
			         g.drawImage(bufferedImage, 0, 0, tagWidth, tagHeight, null);
			         g.dispose();
			         StringBuilder sb = new StringBuilder(fileName);//构造一个StringBuilder对象
				     sb.insert(fileName.length()-4, "_small");//在指定的位置，插入指定的字符串
				     fileName = sb.toString();
			         ImageIO.write(newImage, "jpg", new File(realpath + "\\" + fileName));
				} 
				
				
				office = service.saveByJSONObject(jsonObject);
				response.getWriter().print(
						"{success:true,topit_ext_id:" + office.getId() + "}");
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

	// 根据查询条件获取记录集
			public String getOfficesComboBox() {
				try {
					records.put("records",  service
							.getOfficesComboBox(baseSql + whereSql+order));
				} catch (Exception e) {
					log.error("getOfficesComboBox出错："+e.toString());
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
	public String getUploadFileName3() {
		return uploadFileName3;
	}
	public void setUploadFileName3(String uploadFileName3) {
		this.uploadFileName3 = uploadFileName3;
	}
	public File getUploadFile3() {
		return uploadFile3;
	}
	public void setUploadFile3(File uploadFile3) {
		this.uploadFile3 = uploadFile3;
	}
	public String getUploadFileName4() {
		return uploadFileName4;
	}
	public void setUploadFileName4(String uploadFileName4) {
		this.uploadFileName4 = uploadFileName4;
	}
	public File getUploadFile4() {
		return uploadFile4;
	}
	public void setUploadFile4(File uploadFile4) {
		this.uploadFile4 = uploadFile4;
	}
	public String getUploadFileName5() {
		return uploadFileName5;
	}
	public void setUploadFileName5(String uploadFileName5) {
		this.uploadFileName5 = uploadFileName5;
	}
	public File getUploadFile5() {
		return uploadFile5;
	}
	public void setUploadFile5(File uploadFile5) {
		this.uploadFile5 = uploadFile5;
	}
	
}

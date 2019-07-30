package cn.com.topit.gl.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.common.util.SMS;
import cn.com.topit.gl.service.ErpOrdersService;
import net.sf.json.JSONObject;
public class ErpOrdersAction<ErpOrders> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ErpOrdersAction.class);
	private ErpOrdersService service;
	public void setService(ErpOrdersService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	private File uploadFile;
	private String uploadFileName;

	public void save() {
	    HttpServletResponse response = ServletActionContext.getResponse();
	    cn.com.topit.gl.dao.ErpOrders erp = null;
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		String json = (extJson);
		JSONObject jsonObject=JSONObject.fromObject(json);	
		response.reset();
		response.setCharacterEncoding("utf-8");
		log.info(json);
		try {
		    erp = service.saveByJson(json);
		    if(jsonObject.containsKey("data")){
				JSONObject pam = new JSONObject();
				JSONObject data = jsonObject.getJSONObject("data");
				String code = "";
				if(jsonObject.getInt("status")==2) {
					code = "SMS_158491632";
					pam.put("customerName", data.getString("name"));
					pam.put("designerName", data.getString("userName"));
					pam.put("designer", data.getString("code"));
					SMS.sendSms(data.getString("mobile"), code, pam.toString());
				}else if(jsonObject.getInt("status")==4) {
					code = "SMS_158491630";
					pam.put("customerName", data.getString("name"));
					SMS.sendSms(data.getString("mobile"), code, pam.toString());
				}
			};
		    response.getWriter().print("topit_ext_id!" + erp.getId());
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
	public void materialSave() {
		HttpServletResponse response = ServletActionContext.getResponse();
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
			savefile = new File(realpath + "\\" + fileName);
			FileUtils.copyFile(uploadFile, savefile);	
			
            Workbook workBook = getWorkbok(savefile);
            //获取所有页
            int sheetsNumber = workBook.getNumberOfSheets();
            for(int i=0;i<sheetsNumber;i++) {
            	//选择页
            	Sheet sheet = workBook.getSheetAt(i);
            	 // 第一行从0开始算
            	int rowNumber = sheet.getLastRowNum();
            	for (int j = 5; j <= rowNumber; j++) {
            		//获取行数据
                    Row row = sheet.getRow(j);
                    //获取列数据
                    Cell cell = row.getCell(0);
                }
            }
			response.getWriter().print(
					"{success:true,topit_ext_id:1}");
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
	/**
     * 判断Excel的版本,获取Workbook
     * @param in
     * @param filename
     * @return
     * @throws IOException
     */
    public static Workbook getWorkbok(File file) throws IOException{
        Workbook wb = null;
        FileInputStream in = new FileInputStream(file);
        if(file.getName().endsWith("xls")){     //Excel&nbsp;2003
            wb = new HSSFWorkbook(in);
        }else if(file.getName().endsWith("xlsx")){    // Excel 2007/2010
            wb = new XSSFWorkbook(in);
        }
        return wb;
    }
	public File getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
    
}

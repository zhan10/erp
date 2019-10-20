package cn.com.topit.gl.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.common.util.SMS;
import cn.com.topit.gl.service.ErpCabinetsService;
import cn.com.topit.gl.service.ErpMetalsService;
import cn.com.topit.gl.service.ErpOrdersService;
import cn.com.topit.gl.service.ErpTypeService;
import cn.com.topit.gl.service.InventoryService;
import cn.com.topit.gl.service.MaterService;
import net.sf.json.JSONObject;
public class ErpOrdersAction<ErpOrders> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ErpOrdersAction.class);
	private ErpOrdersService service;
	private ErpCabinetsService cabinetsService;
	private ErpMetalsService metalsService;
	private ErpTypeService typeService;
	private MaterService materService;
	public void setService(ErpOrdersService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	public void setCabinetsService(ErpCabinetsService cabinetsService) {
		this.cabinetsService = cabinetsService;
		super.setAbstractService(cabinetsService);
	}
	public void setMetalsService(ErpMetalsService metalsService) {
		this.metalsService = metalsService;
		super.setAbstractService(metalsService);
	}
	public void setTypeService(ErpTypeService typeService) {
		this.typeService = typeService;
		super.setAbstractService(typeService);
	}
	public void setMaterService(MaterService materService) {
		this.materService = materService;
		super.setAbstractService(materService);
	}



	private File uploadFile;
	private String uploadFileName;
	private double atct;
	private String materid;
	public void updateAtct() {
		materService.updateAtct(atct, materid);
	}
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
		String type = "推台锯单,玻璃单,外协门板单,吸塑面板单";
		cn.com.topit.gl.dao.ErpType erpType = null;
		try {
			Long ymId = null;
			Long id = jsonObject.getLong("id");
			String ordersCode = jsonObject.getString("ordersCode");
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
            Sheet sheet1 = workBook.getSheetAt(0);
            Row row1 = sheet1.getRow(1);
            //String code = row1.getCell(1).toString();
            
            Cell cell = row1.getCell(1);
            cell.setCellType(CellType.STRING);
        	String code = row1.getCell(1).getStringCellValue();
            if(!code.equals(ordersCode)) {
            	throw new Exception("订单号不正确，请核实");
//            	response.getWriter().print(
//						"{success:false,errMsg:"+"订单号不正确，请核实。"+ "}");
//            	return;
            }
            typeService.deleteBySql(" and ordersId="+id);
			cabinetsService.deleteBySql(" and ordersId="+id);
			metalsService.deleteBySql(" and ordersId="+id);
            for(int i=0;i<sheetsNumber;i++) {
            	//选择页
            	Sheet sheet = workBook.getSheetAt(i);
            	//获取页的名称
            	String name = sheet.getSheetName();
            	if(type.indexOf(name) >= 0 || name.indexOf("柜身单")>=0 || name.indexOf("移门单")>=0) {
            		if(ymId==null || name.indexOf("移门单")<0) {
            			JSONObject jsonType = new JSONObject();
                		jsonType.put("id", "");
                		jsonType.put("ordersId", id);
                		jsonType.put("name", name.indexOf("移门单")>=0?"移门单":name);
                		erpType = typeService.saveByJSONObject(jsonType);
                		if(name.indexOf("移门单")>=0) {
                			ymId = erpType.getId();
                		}
            		}	
	            	 // 第一行从0开始算
	            	int rowNumber = sheet.getLastRowNum();
	            	for (int j = 5; j <= rowNumber; j++) {
	            		//获取行数据
	                    Row row = sheet.getRow(j);
	                    //获取序号
	                    String numbering = row.getCell(0).toString();
	                    if(numbering.length() <= 0) {
	                    	break;
	                    }
	                    //获取名称
	                    Cell n = row.getCell(1);
	                    //获取长
	                    Cell width = row.getCell(2);
	                    //获取宽
	                    Cell height = row.getCell(3);
	                    //获取厚
	                    Cell deepth = row.getCell(4);
	                    //获取数量
	                    Cell number = row.getCell(5);
	                    //获取颜色
	                    Cell color = row.getCell(6);
	                    //获取面积
	                    Cell acreage = row.getCell(7);
	                    //获取erpTypeid
	                    Long typeId = ymId==null || name.indexOf("移门单")<0?erpType.getId():ymId;
	                
	                    JSONObject json1 = new JSONObject();
	                	json1.put("id", "");
	                	json1.put("numbering", numbering);
	                	json1.put("name", n.toString());
	                	Double width1 = Double.valueOf(width.toString());
	                	json1.put("width", width1);
	                	Double height1 = Double.valueOf(height.toString());
	                	json1.put("height", height1);
	                	json1.put("deepth", Double.valueOf(deepth.toString()));
	                	Long number1 = Math.round(Double.valueOf(number.toString()));
	                	json1.put("number", number1);
	                	json1.put("color", color.toString());
	                	
	                	BigDecimal big1 = new BigDecimal(width1*height1*number1);
	                    BigDecimal big2 = new BigDecimal(1000000);
	                    Double acreage1 = big1.divide(big2,2,BigDecimal.ROUND_HALF_UP).doubleValue();
	                	
	                	//Double acreage1 = (width1*height1*number1)/1000000.00;
	                	json1.put("acreage", acreage1);
	                	
	                	json1.put("typeId", erpType.getId());
	                	json1.put("ordersId", id);
	            		if(name.indexOf("柜身单")>=0 || name.indexOf("推台锯单")>=0) {
	            			//获取封边要求
		                    Cell require = row.getCell(8);
		                    //获取说明
		                    Cell explain = row.getCell(9);
	            			json1.put("require", require.toString());
	            			json1.put("explain", explain.toString());
	            			cabinetsService.saveByJSONObject(json1);
	                    }else if(name.indexOf("玻璃单")>=0){
		                    //获取说明
		                    Cell explain = row.getCell(8);
	            			json1.put("explain", explain.toString());
	                    	cabinetsService.saveByJSONObject(json1);
	                    }else if(name.indexOf("移门单")>=0 || name.indexOf("外协门板单")>=0 || name.indexOf("吸塑面板单")>=0) {
	                    	//获取门方向
		                    Cell doorDirection = row.getCell(8);
		                    //获取门型
		                    Cell doorForm = row.getCell(9);
		                    //获取说明
		                    Cell explain = row.getCell(10);
		                    json1.put("doorDirection", doorDirection.toString());
	            			json1.put("doorForm", doorForm.toString());
	            			json1.put("explain", explain.toString());
	                    	cabinetsService.saveByJSONObject(json1);
	                    }
	                }
            	}
            	if(name.indexOf("物料与配件单")>=0) {
            		 // 第一行从0开始算
	            	int rowNumber = sheet.getLastRowNum();
                    for (int j = 4; j <= rowNumber; j++) {
                    	//获取行数据
                    	Row row = sheet.getRow(j);
                    	String wName = row.getCell(0).toString();
                    	if(wName.length() <= 0 || wName.equals("制单:")) {
	                    	break;
	                    }
                    	String wModel = row.getCell(2).toString();
                    	Cell wNumber = row.getCell(4);
                    	Double wNumber1 = Double.valueOf(wNumber.toString());             	
                    	String wUnit = row.getCell(5).toString();            
                    	Cell cMaterid = row.getCell(6);
                    	cMaterid.setCellType(CellType.STRING);
                    	String wMaterid = row.getCell(6).getStringCellValue();
                    	String wRemark = row.getCell(7).toString();
                    	Long wOrdersId = id;
                    	//物料配件单
                    	JSONObject json2 = new JSONObject();
                    	json2.put("id", "");
                    	json2.put("name", wName);
                    	json2.put("model", wModel);
                    	json2.put("number", wNumber1);
                    	json2.put("unit", wUnit);
                    	json2.put("materid", wMaterid);
                    	json2.put("remark", wRemark);
                    	json2.put("ordersId", wOrdersId);
                    	metalsService.saveByJSONObject(json2);
                    }
            		
            	}
            }
			response.getWriter().print(
					"{success:true,topit_ext_id:1}");
		} catch (Exception e) {
			e.printStackTrace();
			log.error("保存出错" + e.getMessage());
			try {
				response.getWriter().print(
						"{'success':false,'errMsg':'" + e.getMessage() + "'}");
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
	public double getAtct() {
		return atct;
	}
	public void setAtct(double atct) {
		this.atct = atct;
	}
	public String getMaterid() {
		return materid;
	}
	public void setMaterid(String materid) {
		this.materid = materid;
	}
	
}

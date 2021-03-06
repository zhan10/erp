package cn.com.topit.gl.action;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.Inventory;
import cn.com.topit.gl.service.InventoryService;
import cn.com.topit.gl.service.MaterService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class InventoryAction extends GenericActionSupport<Inventory> {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(InventoryAction.class);
	private InventoryService service;
	private MaterService materService;
	protected String materid = "";
	
	public String getMaterid() {
		return materid;
	}
	public void setMaterid(String materid) {
		this.materid = materid;
	}
	public void setService(InventoryService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	public void setMaterService(MaterService service) {
		this.materService = service;
		super.setAbstractService(service);
	}
	public String getResult() {
		try {
			records.put("records",  service
					.getResult(materid));
		} catch (Exception e) {
			log.error("getResult出错："+e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
	public void save() {
		HttpServletResponse response = ServletActionContext.getResponse();
		cn.com.topit.gl.dao.Inventory inventory = null;
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		String json = (extJson);
		JSONArray jsonArray=JSONArray.fromObject(json);	
		
		response.reset();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		log.info(json);
		try {
				for(int i=0;i<jsonArray.size();i++) {
					JSONObject jsonObject = jsonArray.getJSONObject(i);
					//原材料id
					String materid = jsonObject.getString("materid");
					//出入库数量
					double quantities = jsonObject.getDouble("quantities");
					//库存数量
					double atct = jsonObject.getDouble("atct");
					if(jsonObject.getInt("type")==2) {
						int r = materService.updateAtct(atct-quantities, materid);
						if(r>0) {
							inventory = service.saveByJSONObject(jsonObject);
						}
					}else {
						int r = materService.updateAtct(atct+quantities, materid);
						if(r>0) {
							inventory = service.saveByJSONObject(jsonObject);
						}
						//inventory = service.saveByJSONObject(jsonObject);
					}
				}
				response.getWriter().print(
						"topit_ext_id!" + inventory.getId());
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
}

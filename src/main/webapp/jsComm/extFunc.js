//消息提示框
var msg = function(title, msg) {
        Ext.Msg.show({
            title: title,
            msg: msg,
            minWidth: 200,
            modal: true,
            icon: Ext.Msg.INFO,
            buttons: Ext.Msg.OK
        });
    };
//生成textfield，主要用于tbar中的查询栏
function getTextField(id, width, fieldLabel, labelWidth, emptyText, labelAlign) {
	emptyText = typeof (emptyText) == "undefined" ? '' : emptyText;
	labelAlign = typeof (labelAlign) == "right" ? '' : labelAlign;
	var retField = Ext.create('Ext.form.field.Text', {
		width : width,
		labelWidth : labelWidth,
		fieldLabel : fieldLabel,
		labelAlign : labelAlign,
		itemId : id,
		emptyText : emptyText
	});
	return retField;
}
function getGrid(itemId, title, ds, columns, sm, tbar, bbar) {
	var retGrid = Ext.create('Ext.grid.Panel', {
		itemId : itemId,
		store : ds,flex:1,
		margin : "5",
		tbar : tbar,
		bbar : bbar,
		columns : columns,
		title : title,
		selModel : sm,
		columnLines : true,
		viewConfig : {
			enableTextSelection : true
		}
	});
	//retGrid.on("show",function(){alert("asdfasfasfd")});
	return retGrid;
}

function getGrids(itemId, title, ds, columns, sm, tbar, bbar) {
	var retGrid = Ext.create('Ext.grid.Panel', {
		itemId : itemId,
		store : ds,flex:1,
		margin : "5",
		tbar : tbar,
		bbar : bbar,
		title : title,
		selModel : sm,
		columnLines : true,
		viewConfig : {
			enableTextSelection : true
		},
         features: [{
             ftype: 'summary'
         }],
         store: ds,
         columns: columns
	});
	//retGrid.on("show",function(){alert("asdfasfasfd")});
	return retGrid;
}
//订单管理中的小订单专用（tabs）
function getDs1(fields, dsUrl, baseSql, order,int) {
	var retDs = Ext.create('Ext.data.Store', {
		autoLoad : false,
		fields : fields,
		pageSize : 20,
		proxy : {
			type : 'ajax',
			actionMethods : {
				read : 'POST' // post方法解决中文参数乱码问题
			},
			url : dsUrl,
			extraParams : {
				baseSql : baseSql,
				order : order
			},
			reader : {
				type : 'json',
				root : 'records',
				totalProperty : 'sum'
			}
		},
		listeners:
		{
			"load":function(store,records,optins)
		    {
		        var count=records.length;  // 等于var
			   	var a=0;						   // count=grid.getStore().getCount()
		        if(count<1)                // count==0
		        {
		        	if(int==0){
		        	    workbench_grid.hide();
		        	    tabs.tabBar.items.items[0].hide();
		        	}else if(int==1){
		        		office_grid.hide();
			        	tabs.tabBar.items.items[1].hide();
		        	}else if(int==2){
		        		meetingRoom_grid.hide();
			        	tabs.tabBar.items.items[2].hide();
		        	}else if(int==3){
		        		exhibitionRoom_grid.hide();
			        	tabs.tabBar.items.items[3].hide();
		        	}else if(int==4){
		        		telRoom_grid.hide();
			        	tabs.tabBar.items.items[4].hide();
		        	}else if(int==5){
		        		vipRoom_grid.hide();
			        	tabs.tabBar.items.items[5].hide();
		        	}	
		        }
		        else
		        {   
		        	if(int==0){
						workbench_grid.show();
						tabs.tabBar.items.items[0].show();
						a=1;
		        	}else if(int==1){
		        		office_grid.show();
			        	tabs.tabBar.items.items[1].show();
			        	a=2;
		        	}else if(int==2){
		        		meetingRoom_grid.show();
			        	tabs.tabBar.items.items[2].show();
			        	a=3;
		        	}else if(int==3){
		        		exhibitionRoom_grid.show();
			        	tabs.tabBar.items.items[3].show();
			        	a=4;
		        	}else if(int==4){
		        		telRoom_grid.show();
			        	tabs.tabBar.items.items[4].show();
			        	a=5;
		        	}else if(int==5){
		        		vipRoom_grid.show();
			        	tabs.tabBar.items.items[5].show();
			        	a=6;
		        	}
		        }
		        if(a==1){tabs.setActiveTab(int);}
		        else if(a==2){tabs.setActiveTab(int);}
		        else if(a==3){tabs.setActiveTab(int);}
		        else if(a==4){tabs.setActiveTab(int);}
		        else if(a==5){tabs.setActiveTab(int);}
		        else if(a==6){tabs.setActiveTab(int);};
	}}
	});
	return retDs;
}
function getDs(fields, dsUrl, baseSql, order) {
	var retDs = Ext.create('Ext.data.Store', {
		autoLoad : false,
		fields : fields,
		pageSize : 20,
		proxy : {
			type : 'ajax',
			actionMethods : {
				read : 'POST' // post方法解决中文参数乱码问题
			},
			url : dsUrl,
			extraParams : {
				baseSql : baseSql,
				order : order
			},
			reader : {
				type : 'json',
				root : 'records',
				totalProperty : 'sum'
			}
		}
	});
	return retDs;
}
function getBbar(ds) {
	var bbar = Ext.create('Ext.PagingToolbar', {
		store : ds,
		displayInfo : true,
		displayMsg : '当前记录 {0} - {1} 共 {2}条',
		emptyMsg : "未找到相应记录",
		items : [ '-', '每页显示', {
			xtype : 'combo',
			width : 50,
			value : 20,
			store : [ 20, 50, 100, 200, 500, 1000, 2000 ],
			listeners : {
				select : function() {
					ds.pageSize = isNaN(this.value) ? 20 : this.value;
					ds.loadPage(1);
				}
			}
		}, '条' ]
	});
	return bbar;
}
function getWindow(winTitle, winWidth, winHeight, minWidth, minHeight, items) {
	var win = Ext.create('Ext.window.Window', {
		title : winTitle,
		closeAction : 'hide',
		modal : true,
		tools : [ {
			type : 'restore',
			handler : function(event, toolEl, panelHeader) {
				win.setSize(winWidth, winHeight);
			}
		} ],
		width : winWidth,
		height : winHeight,
		minWidth : minWidth,
		minHeight : minHeight,
		layout : 'fit',
		plain : true,
		frame : false,
		items : items
	});
	return win;
}

function showWinByRec(paramWin, paramTitle, record) {
	paramWin.show();
	paramWin.setTitle(paramTitle);
	var form = paramWin.down('form');
	form.loadRecord(record);
	var fields = form.query('*');
	for (i = 0; i < fields.length; i++) {
		try {
			fields[i].setReadOnly(true);
		} catch (e) {
		}
	}
	if(form.down('#btnSave'))
		form.down('#btnSave').hide();
}
function showWin(paramWin, paramTitle, paramSm) {
	if (paramSm.getCount() == 1) {
		showWinByRec(paramWin, paramTitle, (paramSm.getSelection())[0]);
	} else {
		Ext.MessageBox.alert('提示', '请选择一条记录！');
	}
}
// 新增记录
function addWin(paramWin, paramTitle) {
	paramWin.show();
	var form = paramWin.down('form');
	paramWin.setTitle(paramTitle);
	form.form.reset();
	var fields = form.query('*');
	for (i = 0; i < fields.length; i++) {		
		try {
			if(fields[i].xtype!='filefield')
				fields[i].setReadOnly(false);
		} catch (e) {
		}
	}
	form.down('#btnSave').show();
}
// 拷贝添加，自动加载sm选中的记录，或未选中记录则加载上一次的添加信息
function copyAddWin(paramWin, paramTitle, paramSm) {
	paramWin.show();
	var form = paramWin.down('form');
	paramWin.setTitle(paramTitle);
	if (paramSm.getCount() >= 1)
		form.loadRecord((paramSm.getSelection())[0]);
	form.down('#id').setValue('');
	var fields = form.query('*');
	for (i = 0; i < fields.length; i++) {
		try {
			if(fields[i].xtype!='filefield')
				fields[i].setReadOnly(false);
		} catch (e) {
		}
	}
	form.down('#btnSave').show();
}
// grid行内编辑操作
function editWinByRec(paramWin, paramTitle, rec) {
	paramWin.show();
	paramWin.setTitle(paramTitle);
	// paramForm.getForm().loadRecord(rec);
	var form = paramWin.down('form');
	form.loadRecord(rec);
	// 如果上一次打开form是只读状态则修改readonly属性
	// if (!editForm) {
	// var fields = Ext.ComponentQuery.query('#form *');
	var fields = form.query('*');
	for (i = 0; i < fields.length; i++) {
		try {
			if(fields[i].xtype!='filefield')
				fields[i].setReadOnly(false);
		} catch (e) {
		}
	}
	form.down('#btnSave').show();
	// 解决按钮错位问题，无其它作用
	// paramWin.setWidth();
	// }
}
// tbar上编辑按钮
function editWin(paramWin, paramTitle, paramSm) {
	if (paramSm.getCount() == 1) {
		editWinByRec(paramWin, paramTitle, (paramSm.getSelection())[0]);
	} else {
		Ext.MessageBox.alert('提示', '请选择一条记录！');
	}
}

// 从ext form中保存记录（单条数据）,更新对应的grid,func:保存成功后的回调函数，用参数传入
function saveFormToDB(paramForm, url, paramGrid, func) {
	var saveFormJson = Ext.JSON.encode(paramForm.getForm().getValues());
	Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");
	Ext.Ajax.request({
		url : url,
		timeout : 60000,
		params : {
			extJson : saveFormJson
		},
		method : 'post',
		success : function(response) {
			var responseText = response.responseText;
			if (responseText.indexOf('topit_ext_id!') != 0) {
				//Ext.Msg.alert('错误', (response.responseText));
				if(response.responseText.indexOf("PK_mater" !== -1)){
					Ext.Msg.alert('错误', "原材料编码重复！");	
				}else{
					Ext.Msg.alert('错误', (response.responseText));
				}
			} else {
				Ext.Msg.alert('恭喜', "数据保存成功!", function() {
					if (paramForm.down('#id').getValue() == '') {
						// 新增记录
						paramForm.down('#id')
								.setValue(
										responseText.substring(13,
												responseText.length));						
						paramGrid.getStore().insert(0, paramForm.getValues());
						//paramGrid.getStore().load();
					} else {
						paramForm.updateRecord();
						//paramGrid.getStore().load();
					}
					paramForm.up('window').hide();
					paramGrid.getStore().load();
					if (typeof (func) != 'undefined')
						func();
				});
			}
		},

		failure : function(response) {
			Ext.Msg.alert('错误', (response.responseText));
		}
	});
}
// 批量修改记录集某个属性值 ,func:保存成功后的回调函数，用参数传入
function updateFieldsToDB(paramForm, paramSm, url, func) {
	if (paramSm.getCount() < 1) {
		Ext.MessageBox.alert('提示', '请选择待修改的记录！');
		return;
	}
	Ext.MessageBox.confirm('修改记录', '您是否确认批量修改已选中的这' + paramSm.getCount()
			+ '条记录，此操作无法还原，请仔细核对要修改的记录！', function(btn) {
		if (btn == 'yes') {
			var saveFormJson = Ext.JSON.encode(paramForm.getValues());
			Ext.Msg.wait("请等候", "更新数据", "更新数据进行中...");
			var ids = "";
			var r = paramSm.getSelection();
			for ( var i = 0; i < r.length; i++) {
				ids += r[i].data["id"] + ",";
			}
			ids = ids.substr(0, ids.length - 1);
			Ext.Ajax.request({
				url : url,
				timeout : 60000,
				params : {
					extJson : saveFormJson,
					others : ids
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('success!') != 0) {
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "成功更新"
								+ responseText
										.substring(8, responseText.length)
								+ '条记录!', function() {
							var r = paramSm.getSelection();
							var t_name = paramForm.getForm().findField('name')
									.getValue();
							for ( var i = 0; i < r.length; i++) {
								// r[i].set(t_name,paramForm.getForm().findField('value').getValue());
								// alert(Ext.JSON.decode(saveFormJson));
								// alert(saveFormJson.name);
								// alert(saveFormJson.get('name'));
								// alert(paramForm.getValues());
								// var obj=paramForm.getValues().name;
								r[i].set(paramForm.getValues().name, paramForm
										.getValues().value);
							}
							paramForm.up('window').hide();
							func();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});
}
function delFromDB(paramds, paramSm, url, func) {
	if (paramSm.getCount() < 1) {
		Ext.MessageBox.alert('提示', '请选择待删除的记录！');
	} else {
		Ext.MessageBox.confirm('删除记录', '您是否确认删除已选中的这' + paramSm.getCount()
				+ '条记录，此操作无法还原，请仔细核对要删除的记录！', function(btn) {
			if (btn == 'yes') {
				var delJsonStr = "";
				var r = paramSm.getSelection();
				for ( var i = 0; i < r.length; i++) {
					delJsonStr += r[i].data["id"] + ",";
				}
				delJsonStr = delJsonStr.substr(0, delJsonStr.length - 1);
				Ext.Ajax.request({
					url : url,
					timeout : 60000,
					params : {
						extJson : delJsonStr
					},
					method : 'post',
					success : function(response) {
						var responseText = response.responseText;
						if (responseText.indexOf('success!') != 0) {
							Ext.Msg.alert('错误', (response.responseText));
						} else {
							Ext.Msg.alert('恭喜', "成功删除"
									+ responseText.substring(8,
											responseText.length) + '条记录!',
									function() {
										for ( var i = 0; i < r.length; i++)
											paramds.remove(r[i]);
										if (typeof (func) != 'undefined')
											func();
									});
						}
					},
					failure : function(response) {
						Ext.Msg.alert('错误', (response.responseText));
					}
				});
			}
		});
	}
}

// tbar添加按钮,btnText为空时只显示图标不显示按钮名称
function getAddButton(paramWin, paramTitle, btnText, func) {
	btnText = typeof (btnText) == "undefined" ? '' : btnText;
	var btn = Ext.create('Ext.Button', {
		text : btnText,
		tooltip : '添加',
		iconCls : 'add',
		itemId : 'tbar_btn_add',
		handler : function() {
			addWin(paramWin, paramTitle);
			if (typeof (func) != 'undefined')
				func();
		}
	});
	return btn;
}
// tbar拷贝添加按钮
function getCopyAddButton(paramWin, paramTitle, paramSm, btnText, func) {
	btnText = typeof (btnText) == "undefined" ? '' : btnText;
	var btn = Ext.create('Ext.Button', {
		text : btnText,
		tooltip : '拷贝添加',
		iconCls : 'copy',
		handler : function() {
			copyAddWin(paramWin, paramTitle, paramSm);
			if (typeof (func) != 'undefined') {
				func();
			}
		}
	});
	return btn;
}
// tbar修改按钮
function getEditButton(paramWin, paramTitle, paramSm, btnText, func) {
	btnText = typeof (btnText) == "undefined" ? '' : btnText;
	var btn = Ext.create('Ext.Button', {
		text : btnText,
		tooltip : '修改',
		iconCls : 'edit',
		itemId : 'tbar_btn_edit',
		disabled : true,
		handler : function() {
			editWin(paramWin, paramTitle, paramSm);
			if (typeof (func) != 'undefined') {
				func();
			}
		}
	});
	return btn;
}
// tbar删除按钮
function getDelButton(ds, sm, delUrl, btnText, func) {
	btnText = typeof (btnText) == "undefined" ? '' : btnText;
	var btn = Ext.create('Ext.Button', {
		text : btnText,
		tooltip : '删除',
		iconCls : 'delete',
		itemId : 'tbar_btn_delete',
		disabled : true,
		handler : function() {
			delFromDB(ds, sm, delUrl, function() {
				if (typeof (func) != 'undefined') {
					func();
				}
			});
		}
	});
	return btn;
}
// tbar综合查询按钮
function getComSearchButton(paramWin, btnText) {
	btnText = typeof (btnText) == "undefined" ? '' : btnText;
	var btn = Ext.create('Ext.Button', {
		text : btnText,
		tooltip : '综合查询',
		iconCls : 'comSearch',
		handler : function() {
			paramWin.show();
		}
	});
	return btn;
}
// tbar批量修改按钮
function getBatchButton(batchWin, sm, btnText) {
	btnText = typeof (btnText) == "undefined" ? '' : btnText;
	var btn = Ext.create('Ext.Button', {
		text : btnText,
		tooltip : '批量修改',
		iconCls : 'batch',
		itemId : 'tbar_btn_batch',
		disabled : true,
		handler : function() {
			batchWin.show();
		}
	});
	return btn;
}

function convertDate(v, record) {
	if (v == null ||v=='') {
		return null;
	}	
	var date=new Date(v);
	return Ext.Date.format(date,'Y-m-d');
}

function convertDateTime(v, record) {
	if (v == null ||v=='') {
		return null;
	}	
	var date=new Date(v);
	return Ext.Date.format(date,'Y-m-d H:i:s');
}
//grid列头中文排序问题
Ext.data.Store.prototype.createComparator = function(sorters){ 
	    return function(r1, r2){  				
	        var s = sorters[0], f=s.property;  				
	        var v1 = r1.data[f], v2 = r2.data[f]; 
	        var result = 0;  
	        if(typeof(v1) == "string"){  				
	            result = v1.localeCompare(v2);				
	            if(s.direction == 'DESC'){ 				
	                result *=-1;  				
	            }  				
	        } else {  				
	            result =sorters[0].sort(r1, r2);				
	        }  
	        var length = sorters.length; 
	        for(var i = 1; i<length; i ++){  				
	            s = sorters[i];  				
	            f = s.property;  				
	            v1 = r1.data[f];  				
	            v2 = r2.data[f]; 
	            if(typeof(v1) == "string"){ 				
	                result = result || v1.localeCompare(v2); 
	                if(s.direction == 'DESC'){  				
	                    result *=-1;  				
	                }  				
	            } else {  				
	                result = result || s.sort.call(this, r1, r2);  				
	            }  				
	        }  
				 return result;  	
	    };  	
	};  

	function saveFile(paramForm, fieldName,fileTypes,url, paramGrid, func) {
		//判断上传格式
		var fileName=paramForm.form.findField(fieldName).getValue();		
		if(fileName.length>0&&fileTypes.length>0){			
			var type=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
			type=type.toLocaleLowerCase();
				if(fileTypes.indexOf(type)<0){
					Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
					return;
				}
		}
		//主表json字符串
		var saveFormJson = Ext.JSON.encode(paramForm.getForm().getValues());	
		Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");
		var realFileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
		realFileName=realFileName.substring(realFileName.lastIndexOf("/")+1,realFileName.length);
		paramForm.form.submit({
			url : url,
			method : 'post',
			params : {
				extJson : saveFormJson,
				uploadFileName:realFileName
			},
			success : function(form, action)  {
					Ext.Msg.alert('恭喜', "数据保存成功!", function() {
						if (paramForm.down('#id').getValue() == '') {
							// 新增记录
							paramForm.down('#id')
									.setValue(action.result.topit_ext_id);						
							paramGrid.getStore().insert(0, paramForm.getValues());
							paramGrid.getStore().load();
						} else {
							paramForm.updateRecord();
							paramGrid.getStore().load();
						}
						paramForm.up('window').hide();
						paramGrid.getStore().load();
						if (typeof (func) != 'undefined')
							func();
					});
				
			},
			failure : function(form, result) {			
				        Ext.Msg.alert('保存出错', result.errMsg);
				    }
		});

	}
	function saveFileA(paramForm, fieldName,fieldName1,fieldName2,fieldName3,fieldName4,fieldName5,fileTypes,url, paramGrid, func) {
		//判断上传格式
		var fileName=paramForm.form.findField(fieldName).getValue();
		var fileName1=paramForm.form.findField(fieldName1).getValue();
		var fileName2=paramForm.form.findField(fieldName2).getValue();
		var fileName3=paramForm.form.findField(fieldName3).getValue();
		var fileName4=paramForm.form.findField(fieldName4).getValue();
		var fileName5=paramForm.form.findField(fieldName5).getValue();
		if(fileName.length>0&&fileTypes.length>0){			
			var type=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
			type=type.toLocaleLowerCase();
				if(fileTypes.indexOf(type)<0){
					Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
					return;
				}
		}
		if(fileName1.length>0&&fileTypes.length>0){			
			var type=fileName1.substring(fileName1.lastIndexOf(".")+1,fileName1.length);
			type=type.toLocaleLowerCase();
				if(fileTypes.indexOf(type)<0){
					Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
					return;
				}
		}
		if(fileName2.length>0&&fileTypes.length>0){			
			var type=fileName2.substring(fileName2.lastIndexOf(".")+1,fileName2.length);
			type=type.toLocaleLowerCase();
				if(fileTypes.indexOf(type)<0){
					Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
					return;
				}
		}
		if(fileName3.length>0&&fileTypes.length>0){			
			var type=fileName3.substring(fileName3.lastIndexOf(".")+1,fileName3.length);
			type=type.toLocaleLowerCase();
				if(fileTypes.indexOf(type)<0){
					Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
					return;
				}
		}
		if(fileName4.length>0&&fileTypes.length>0){			
			var type=fileName4.substring(fileName4.lastIndexOf(".")+1,fileName4.length);
			type=type.toLocaleLowerCase();
				if(fileTypes.indexOf(type)<0){
					Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
					return;
				}
		}
		if(fileName5.length>0&&fileTypes.length>0){			
			var type=fileName5.substring(fileName5.lastIndexOf(".")+1,fileName5.length);
			type=type.toLocaleLowerCase();
				if(fileTypes.indexOf(type)<0){
					Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
					return;
				}
		}
		//主表json字符串
		var saveFormJson = Ext.JSON.encode(paramForm.getForm().getValues());	
		Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");
		var realFileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
		realFileName=realFileName.substring(realFileName.lastIndexOf("/")+1,realFileName.length);
		var realFileName1=fileName1.substring(fileName1.lastIndexOf("\\")+1,fileName1.length);
		realFileName1=realFileName1.substring(realFileName1.lastIndexOf("/")+1,realFileName1.length);
		var realFileName2=fileName2.substring(fileName2.lastIndexOf("\\")+1,fileName2.length);
		realFileName2=realFileName2.substring(realFileName2.lastIndexOf("/")+1,realFileName2.length);
		var realFileName3=fileName3.substring(fileName3.lastIndexOf("\\")+1,fileName3.length);
		realFileName3=realFileName3.substring(realFileName3.lastIndexOf("/")+1,realFileName3.length);
		var realFileName4=fileName4.substring(fileName4.lastIndexOf("\\")+1,fileName4.length);
		realFileName4=realFileName4.substring(realFileName4.lastIndexOf("/")+1,realFileName4.length);
		var realFileName5=fileName5.substring(fileName5.lastIndexOf("\\")+1,fileName5.length);
		realFileName5=realFileName5.substring(realFileName5.lastIndexOf("/")+1,realFileName5.length);
		paramForm.form.submit({
			url : url,
			method : 'post',
			params : {
				extJson : saveFormJson,
				uploadFileName:realFileName,
				uploadFileName1:realFileName1,
				uploadFileName2:realFileName2,
				uploadFileName3:realFileName3,
				uploadFileName4:realFileName4,
				uploadFileName5:realFileName5
			},
			success : function(form, action)  {
					Ext.Msg.alert('恭喜', "数据保存成功!", function() {
						if (paramForm.down('#id').getValue() == '') {
							// 新增记录
							paramForm.down('#id')
									.setValue(action.result.topit_ext_id);						
							paramGrid.getStore().insert(0, paramForm.getValues());
							paramGrid.getStore().load();
						} else {
							paramForm.updateRecord();
							paramGrid.getStore().load();
						}
						paramForm.up('window').hide();
						paramGrid.getStore().load();
						if (typeof (func) != 'undefined')
							func();
					});
				
			},
			failure : function(form, result) {			
				        Ext.Msg.alert('保存出错', result.errMsg);
				    }
		});

	}
	function newSaveFile(paramForm, fieldName,fieldName1,fileTypes,url, paramGrid, func) {
		//判断上传格式
		var fileName=paramForm.form.findField(fieldName).getValue();
		var fileName1=paramForm.form.findField(fieldName1).getValue();
		if(fileName.length>0&&fileTypes.length>0){			
			var type=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
			type=type.toLocaleLowerCase();
				if(fileTypes.indexOf(type)<0){
					Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
					return;
				}
		}
		if(fileName1.length>0&&fileTypes.length>0){			
			var type=fileName1.substring(fileName1.lastIndexOf(".")+1,fileName1.length);
			type=type.toLocaleLowerCase();
				if(fileTypes.indexOf(type)<0){
					Ext.Msg.alert('提示',"上传附件格式有误，上传的格式包括："+fileTypes);
					return;
				}
		}
		//主表json字符串
		var saveFormJson = Ext.JSON.encode(paramForm.getForm().getValues());	
		Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");
		var realFileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
		realFileName=realFileName.substring(realFileName.lastIndexOf("/")+1,realFileName.length);
		var realFileName1=fileName1.substring(fileName1.lastIndexOf("\\")+1,fileName1.length);
		realFileName1=realFileName1.substring(realFileName1.lastIndexOf("/")+1,realFileName1.length);
		paramForm.form.submit({
			url : url,
			method : 'post',
			params : {
				extJson : saveFormJson,
				uploadFileName1:realFileName,
				uploadFileName2:realFileName1,
			},
			success : function(form, action)  {
					Ext.Msg.alert('恭喜', "数据保存成功!", function() {
						if (paramForm.down('#id').getValue() == '') {
							// 新增记录
							paramForm.down('#id')
									.setValue(action.result.topit_ext_id);						
							paramGrid.getStore().insert(0, paramForm.getValues());
							paramGrid.getStore().load();
						} else {
							paramForm.updateRecord();
							paramGrid.getStore().load();
						}
						paramForm.up('window').hide();
						paramGrid.getStore().load();
						if (typeof (func) != 'undefined')
							func();
					});
				
			},
			failure : function(form, result) {			
				        Ext.Msg.alert('保存出错', result.errMsg);
				    }
		});

	}
	// tbar改价按钮
	function getEditPriceButton(paramWin, paramTitle, paramSm, btnText, func) {
		btnText = typeof (btnText) == "undefined" ? '' : btnText;
		var btn = Ext.create('Ext.Button', {
			text : btnText,
			tooltip : '改价',
			itemId:'editPrice',
			iconCls : 'edit',
			disabled : true,
			handler : function() {
				editWin(paramWin, paramTitle, paramSm);
				if (typeof (func) != 'undefined') {
					func();
				}
			}
		});
		return btn;
	}
	// grid行内编辑操作
	function sendWinByRec(paramWin, paramTitle, rec) {
		paramWin.show();
		paramWin.setTitle(paramTitle);
		var form = paramWin.down('form');
		form.loadRecord(rec);
		var fields = form.query('*');
		for (i = 0; i < fields.length; i++) {
			try {
				if(fields[i].xtype!='filefield')
					fields[i].setReadOnly(true);
			} catch (e) {
			}
		}
		//form.down('#smsContext').setReadOnly(false);
	}
	function sendSms(paramForm, url, paramGrid, func) {
		var FormJson = Ext.JSON.encode(paramForm.getForm().getValues());
		Ext.Msg.wait("请等候", "短信发送", "短信发送进行中...");
		Ext.Ajax.request({
			url : url,
			timeout : 60000,
			params : {
				extJson : FormJson
			},
			method : 'post',
			success : function(response) {
				var responseText = response.responseText;
				if (responseText.indexOf('status!') != 0) {
					Ext.Msg.alert('错误', "短信发送失败!");
				} else {
					Ext.Msg.alert('恭喜', "短信发送成功!", function() {
						paramForm.up('window').hide();
						if (typeof (func) != 'undefined')
							func();
					});
				}
			},
			failure : function(response) {
				Ext.Msg.alert('错误', (response.responseText));
			}
		});
	}
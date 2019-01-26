<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	form = Ext.widget('form', {
		fileUpload : true,
		enctype : 'multipart/form-data',
		itemId : 'form',
		autoScroll : true,
		overflowX : 'scroll',
		overflowY : 'scroll',
		frame : true,
		layout : {
			type : 'vbox',
			align : 'stretch'
		},
		border : false,
		bodyPadding : 10,
		defaultType : 'textfield',
		fieldDefaults : {
			labelAlign : 'right',
			labelWidth : 100
		},
		defaults : {
			margins : '0 0 10 0'
		},
		items : [
			{
				itemId : 'type',
				name : 'type',
				hidden : true
			},
			/* {
				itemId : 'id',
				name : 'id',
				hidden : true
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						itemId : 'records',
						name: 'records',
						fieldLabel : '剩余库存'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						allowBlank : false,
						name : 'matetypeid',
						itemId : 'matetypeid',
						xtype : 'combo',
						displayField : 'name',forceSelection:false,
						valueField : 'id',
						store : cb_mateType_ds,
						fieldLabel : '<s:text name="vInventory.matetypeid" />',
						listeners : {
							select : function() {
								this.up('form').getForm().findField('equipment').setValue("");
								Ext.apply(cb_mater_ds.proxy.extraParams,{whereSql : ' and matetypeid='+this.getValue()});
								cb_mater_ds.loadPage(1);
							}
						}
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,//allowBlank:false,
						name : 'materid',
						itemId : 'materid',
						fieldLabel : '<s:text name="vInventory.materid"/>',
						xtype : 'combo',
						value : '',
						displayField : 'name',
						valueField : 'id',
						editable : false,
						multiSelect : true, 
						store : cb_mater_ds,
						queryMode: 'local',
						listeners : {
							focus : function(){
								cb_mater_ds.loadPage(1);
								this.setEditable(true);
								this.setEditable(false);
							}
						} ,
						listConfig : { 
					    	itemTpl : Ext.create('Ext.XTemplate','<input type=checkbox>{[values.name]}'),  
					    	onItemSelect : function(record) {
					        	 var node = this.getNode(record);
					        		 if (node) {
						             	var checkboxs = node.getElementsByTagName("input");
						                if (checkboxs != null)  
						                var checkbox = checkboxs[0];  
						                checkbox.checked = true;  
						             } 
					    	},
					        listeners : {
					        	itemclick : function(view, record, item, index, e, eOpts) {  
					        		var isSelected = view.isSelected(item);  
					                var checkboxs = item.getElementsByTagName("input");
					                    if (checkboxs != null) {  
					                        var checkbox = checkboxs[0];  
					                        if (!isSelected) {  
					                            checkbox.checked = true;  
					                        } else {  
					                            checkbox.checked = false;  
					                        }  
					                    }  
					             }  
					        }   
					  }
				}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'numberfield',
				items : [
					{
						flex : 1,
						allowBlank : false,
						itemId : 'quantities',
						name : 'quantities',
						minValue:1,
						hideTrigger:true,//隐藏微调按钮
						allowDecimals:false,//不允许输入小数
						nanText:'请输入有效的整数',//无效数字提示
						fieldLabel : '<s:text name="vInventory.quantities"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						allowBlank : false,
						itemId : 'updateTime',
						name : 'updateTime',
						fieldLabel : '<s:text name="vInventory.updateTime"/>'
					},
					{
						flex : 1,
						allowBlank : false,
						itemId : 'principal',
						name : 'principal',
						fieldLabel : '<s:text name="vInventory.principal"/>'
					}
				]
			}, */vInventory_grid
		],
		buttons : [
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var bl = true; 
						var jsonArray = new Array();
						var time=Ext.Date.format(new Date(),'Y-m-d H:i:s');
						var saveForm = this.up('form');
						//类型
						var type = saveForm.down('#type').getValue();
						//var principal = saveForm.down('#principal').getValue();
						for(var i=0;i<store.getCount();i++){
							var storeData = store.getAt(i).data;
							storeData["id"]="";
							storeData["type"]=type;
							storeData["principal"]=userName;
							storeData["updateTime"]=time;
							jsonArray.push(storeData);
						}
						if(type==2){
							for(var i=0;i<jsonArray.length;i++){
								//原材料库存数量
								var atct = jsonArray[i].atct;
								//出入库数量
								var quantities = jsonArray[i].quantities;
								//原材料名称
								var matername = jsonArray[i].matername;
								if(quantities>atct){
									Ext.Msg.alert('错误', matername+'，超出库存');
									bl = false;
									return;
								}
							}
						}
						if(bl){
							saveDB(jsonArray, saveForm,'inventory/inventory!save',grid);
						}
						/* if (saveForm.getForm().isValid()) {
							saveFormToDB(saveForm, 'inventory/inventory!save',grid);
						} */
					}
				}, {
					text : '关闭',
					itemId : 'btnClose',
					handler : function() {
						this.up('window').hide();
					}
				} ]
	});
	var mateTypeDs = gatData(" and 1=1"); 
	batchForm = Ext.widget('form',{
		itemId : 'batchForm',
		autoScroll : true,
		frame : true,
		border : false,
		layout : {
			type : 'vbox',
			align : 'stretch'
		},
		bodyPadding : 10,
		defaultType : 'textfield',
		fieldDefaults : {
			labelAlign : 'right',
			labelWidth : 100
		},
		defaults : {
			margins : '0 0 10 0'
		},
		items :[
			mater_grid
		],
		buttons:[
			{
				text : '确定',
				handler : function() {
					var data = mater_sm.getSelection();
					for(var index in data) { 
						var name = mateTypeDs.findRecord('id', data[index].data.matetypeid).get('name'); 
						data[index].data["matetypename"]=name;
						data[index].data["quantities"]=10;
					};
					store.insert(0,data);
					this.up('window').hide();
				}
			},{
				text : '取消',
				handler : function() {
					this.up('window').hide();
				}
			}]
		});
	function saveDB(json,paramForm, url, paramGrid, func) {
		var saveFormJson = Ext.JSON.encode(json);
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
					Ext.Msg.alert('错误', (response.responseText));
				} else {
					Ext.Msg.alert('恭喜', "数据保存成功!", function() {
						/* if (paramForm.down('#id').getValue() == '') {
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
						} */
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
</script>

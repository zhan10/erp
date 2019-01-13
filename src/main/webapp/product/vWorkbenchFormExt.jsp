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
					itemId : 'id',
					name : 'id',
					hidden : true
				}, 
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [							
							{
								flex : 1,allowBlank:false,
								name : 'buildingId',
								fieldLabel : '<s:text name="vWorkbench.buildingName"/>',
								xtype : 'combo',
								value : '',
								selectOnFocus : true,
								displayField : 'name',
								valueField : 'id',
								editable : true,
								store : cb_buildings_ds,
								listeners : {
									select : function() {
										this.up('form').getForm().findField(
												'buildingName').setValue(
												this.getRawValue());												
										Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+this.getValue(),order : order});
										cb_floors_ds.loadPage(1);											
									}
								}
							}, {
								flex : 1,
								name : 'buildingName',
								hidden : true
							}, {
								flex : 1,
								name : 'floorId',allowBlank:false,
								fieldLabel : '<s:text name="vWorkbench.floorName"/>',
								xtype : 'combo',
								value : '',
								selectOnFocus : true,
								displayField : 'name',
								valueField : 'id',
								editable : true,
								store : cb_floors_ds,
								listeners : {
									select : function() {
										this.up('form').getForm().findField(
												'floorName').setValue(
												this.getRawValue());
									}
								}
							}, {
								flex : 1,
								name : 'floorName',
								hidden : true
							}

					]
				},

				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [
						{
							flex:1,
							allowBlank:false,
							itemId:'price',
							name:'price',
							fieldLabel:'<s:text name="officeType.price"/>'
						},
						{
							flex:1,
							allowBlank:false,
							itemId:'deposit',
							name:'deposit',
							fieldLabel:'<s:text name="workbenchType.deposit"/>'
						},
						]
				},
{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
								flex : 1,allowBlank:false,
								name : 'typeId',
								fieldLabel : '<s:text name="vWorkbench.workbenchType"/>',
								xtype : 'combo',
								value : '',
								selectOnFocus : true,
								displayField : 'name',
								valueField : 'id',
								editable : true,
								store : cb_workbenchTypes_ds,
								listeners : {
									select : function() {
										this.up('form').getForm().findField(
												'workbenchType').setValue(
												this.getRawValue());											
																				
									}
								}
							}, {
								flex : 1,
								name : 'workbenchType',
								hidden : true
							},{			
				flex : 1,
				allowBlank : false,
								name : 'name',
								fieldLabel : '<s:text name="vWorkbench.name"/>'
			} ]
		},
		{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'combo',
			items : [{
						flex : 1,//allowBlank:false,
						name : 'equipment',
						itemId : 'equipment',
						fieldLabel : '<s:text name="vWorkbench.equipment"/>',
						xtype : 'combo',
						value : '',
						displayField : 'facilities',
						valueField : 'id',
						editable : false,
						multiSelect : true, 
						store : cb_roomFacilities_ds,
						queryMode: 'local',
						listeners : {
							focus : function(){
								cb_roomFacilities_ds.loadPage(1);
								this.setEditable(true);
								this.setEditable(false);
							}
						} ,
						listConfig : { 
					    	itemTpl : Ext.create('Ext.XTemplate','<input type=checkbox>{[values.facilities]}'),  
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
				}]
		},
		/* {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [
				{
					flex:1,
					allowBlank:false,
					name:'orientation',
					fieldLabel:'<s:text name="vWorkbench.orientation"/>'
				},
				{
					flex:1,
					allowBlank:false,
					name:'area',
					fieldLabel:'<s:text name="vWorkbench.area"/>',
					xtype : 'numberfield', minValue: 1, maxValue: 10000,decimalPrecision:2,  
						 allowDecimals:true, hideTrigger: true
				}
			]
		}, */
				
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [ {
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile1',
					  itemId : 'uploadFile1',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="vWorkbench.bigPic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="vWorkbench.bigPic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow1',
						name : 'fileShow1',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						hidden : true,
						itemId : 'bigPic',
						name : 'bigPic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag1',
						itemId : 'delFileFlag1',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					} ]
				},
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					hidden:true,
					items : [ {
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile2',
					  itemId : 'uploadFile2',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="vWorkbench.leftPic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="vWorkbench.leftPic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow2',
						name : 'fileShow2',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						hidden : true,
						itemId : 'leftPic',
						name : 'leftPic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag2',
						itemId : 'delFileFlag2',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					} ]
				},
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					hidden:true,
					items : [ {
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile3',
					  itemId : 'uploadFile3',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="vWorkbench.midPic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="vWorkbench.midPic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow3',
						name : 'fileShow3',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						hidden : true,
						itemId : 'midPic',
						name : 'midPic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag3',
						itemId : 'delFileFlag3',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					} ]
				},
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					hidden:true,
					items : [ {
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile4',
					  itemId : 'uploadFile4',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="vWorkbench.rightPic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="vWorkbench.rightPic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow4',
						name : 'fileShow4',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						hidden : true,
						itemId : 'rightPic',
						name : 'rightPic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag4',
						itemId : 'delFileFlag4',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					} ]
				},
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [ {
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile5',
					  itemId : 'uploadFile5',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="vWorkbench.planePic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="vWorkbench.planePic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow5',
						name : 'fileShow5',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						hidden : true,
						itemId : 'planePic',
						name : 'planePic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag5',
						itemId : 'delFileFlag5',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					} ]
				},
				{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					hidden:true,
					items : [ {
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile',
					  itemId : 'uploadFile',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="workbench.pic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="workbench.pic"/>',
						xtype : 'displayfield',
						itemId : 'fileShow',
						name : 'fileShow',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						hidden : true,
						itemId : 'pic',
						name : 'pic',
						itemCls : 'left-float',
						clearCls : 'allow-float'
					}, {
						xtype : 'checkbox',
						boxLabel : '删除附件',
						value : 1,
						name : 'delFileFlag0',
						itemId : 'delFileFlag0',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					} ]
				},
				{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [ {
			 xtype: 'textarea',
				flex : 1,
				name : 'intro',
				height:300,
				fieldLabel : '<s:text name="workbench.intro"/>'
			} ]
		}
			],
		buttons : [
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var saveForm = this.up('form');
						if (saveForm.getForm().isValid()) {
							saveFileA(saveForm, 'uploadFile', 'uploadFile1','uploadFile2','uploadFile3','uploadFile4','uploadFile5',fileTypes,
									'product/workbench!save', grid);
						}
					}
				}, {
					text : '关闭',
					itemId : 'btnClose',
					handler : function() {
						this.up('window').hide();
					}
				} ]
	});
</script>

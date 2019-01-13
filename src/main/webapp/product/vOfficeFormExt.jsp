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
								fieldLabel : '<s:text name="vOffice.buildingName"/>',
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
								fieldLabel : '<s:text name="vOffice.floorName"/>',
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
			                    items : [ {
								flex : 1,allowBlank:false,
								name : 'typeId',
								fieldLabel : '<s:text name="vOffice.officeType"/>',
								xtype : 'combo',
								value : '',
								selectOnFocus : true,
								displayField : 'name',
								valueField : 'id',
								editable : true,
								store : cb_officeTypes_ds,
								listeners : {
									select : function() {
										this.up('form').getForm().findField(
												'officeType').setValue(
												this.getRawValue());
										form.down('#priceOne').show();
										form.down('#unitOne').show();
										form.down('#AllPrice').show();
										var priceOne = this.findRecord('id',this.getValue()).get('price');
										var acreage = form.down('#acreage').getValue();
										var unitOne = this.findRecord('id',this.getValue()).get('unit'); 
										if(acreage!=null && priceOne!=null){
											form.down('#AllPrice').setValue(priceOne*acreage);
										}
										if(unitOne==2){
											form.down('#unitOne').setValue('天');
										}else{
											form.down('#unitOne').setValue('月');
										}
										form.down('#priceOne').setValue(priceOne);
									},
								}
							}, {
								flex : 1,
								name : 'officeType',
								hidden : true
							},{			
								flex : 1,
								allowBlank : false,
												xtype : 'numberfield', minValue: 1, maxValue: 20,allowDecimals:false ,
												name : 'persons',
												fieldLabel : '<s:text name="vOffice.persons"/>'
							}]
		},
	
		/*{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [
				{
					flex:1,
					allowBlank:false,
					name:'orientation',
					fieldLabel:'<s:text name="vOffice.orientation"/>'
				},
				{
					flex:1,
					allowBlank:false,
					name:'area',
					fieldLabel:'<s:text name="vOffice.area"/>',
					xtype : 'numberfield', minValue: 1, maxValue: 10000,decimalPrecision:2,  
						 allowDecimals:true, hideTrigger: true
				}
			]
		},
		*/
		/* {
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [{			
			flex : 1,
			allowBlank : false,
			disabled:true,
						name : 'price',
						fieldLabel : '<s:text name="officeType.price"/>'
	},{			
		flex : 1,
		allowBlank : false,
		disabled:true,
					name : 'unit',
					fieldLabel : '<s:text name="officeType.unit"/>'
}]} , */

	/* 	{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [{
				flex : 0.5,allowBlank:false,
				name : 'typeId',
				fieldLabel : '<s:text name="officeType.price"/>',
				xtype : 'combo',
				value : '',
				selectOnFocus : true,
				displayField : 'price',
				valueField : 'id',
				editable : true,
				store : cb_officePrice_ds,
				listeners : {
					select : function() {
						this.up('form').getForm().findField(
								'officePrice').setValue(
						this.getRawValue());											
					},
				}
			}, {
				flex : 0.5,
				name : 'officePrice',
				hidden : true
			},{
				flex : 0.5,allowBlank:false,
				name : 'typeId',
				fieldLabel : '<s:text name="officeType.unit"/>',
				xtype : 'combo',
				value : '',
				selectOnFocus : true,
				displayField : 'unit',
				valueField : 'id',
				editable : true,
				store : cb_officeUnit_ds,
				listeners : {
					select : function() {
						this.up('form').getForm().findField(
								'officeUnit').setValue(
								this.getRawValue());											
																
					},
				}
			}, {
				flex : 0.5,
				name : 'officeUnit',
				hidden : true
			} , 
			{			
			flex : 1,
			allowBlank : false,
			name : 'proportion',
			fieldLabel : '<s:text name="vOffice.proportion"/>'
						
	},{			
		flex : 1,
		allowBlank : false,
		disabled:true,
		name : 'priceAll',
		fieldLabel : '<s:text name="vOffice.priceAll"/>'
}]} , */
{
	xtype : 'container',
	layout : 'hbox',
	defaultType : 'textfield',
	items : [
		{
			flex:1,
			allowBlank:false,
			disabled:true,
			//readOnly : true,
			//style:'background:#E6E6E6',
			itemId:'priceOne',
			name:'priceOne',
			fieldLabel:'价格'
		},
		{
			flex:1,
			allowBlank:false,
			disabled:true,
			//readOnly : true,
			//style:'background:#E6E6E6',
			itemId:'unitOne',
			name:'unitOne',
			fieldLabel:'单位'
		}]
},
{
	xtype : 'container',
	layout : 'hbox',
	defaultType : 'textfield',
	items : [
		{
			flex:1,
			allowBlank:false,
			itemId:'acreage',
			name:'acreage',
			xtype:'numberfield',
			minValue:1,
			blankTest:'请输入数字',
			allowDecimals:true, //只能输入正数
			allowNegative: true, //允许小数点
			fieldLabel:'<s:text name="vOffice.acreage"/>',
			 listeners:{
	                blur:function(){
	                       var priceOne = form.down('#priceOne').getValue();
	                       var acreage = form.down('#acreage').getValue();
	                       if(acreage!=null && priceOne!=null)
	                    	form.down('#AllPrice').setValue(priceOne*acreage);
	                     }
	            }
			},
		{
			flex:1,
			itemId:'AllPrice',
			name:'AllPrice',
			disabled:true,
			fieldLabel:'总价'
		}]
},
		{
					xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [{			
					flex : 1,
					allowBlank : false,
								name : 'name',
								fieldLabel : '<s:text name="vOffice.name"/>'
			},
			{
				flex:1,
				allowBlank:false,
				name:'orientation',
				fieldLabel:'<s:text name="vWorkbench.orientation"/>'
			}
			]} ,

			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'combo',
				items : [{
							flex : 1,//allowBlank:false,
							name : 'equipment',
							itemId : 'equipment',
							fieldLabel : '<s:text name="vOffice.equipment"/>',
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
					fieldLabel : '<s:text name="vWorkbench.pic"/>',
					buttonText : '',
					buttonConfig : {
						iconCls : 'uploadPic'
					}

				}, {
					fieldLabel : '<s:text name="vWorkbench.pic"/>',
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
			items : [{
				 xtype: 'textarea',
					flex : 1,
					name : 'intro',
					height:200,
					fieldLabel : '<s:text name="office.intro"/>'
			}  ]
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
									'product/office!save', grid);
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

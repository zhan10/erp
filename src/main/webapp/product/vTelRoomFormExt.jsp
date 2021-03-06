<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	form = Ext.widget('form', {
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
			{itemId:'id',name:'id',hidden:true},
			{name:'areaId',hidden:true},{name:'cityId',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
				{
								flex : 1,allowBlank:false,
								name : 'buildingId',
								fieldLabel : '<s:text name="vTelRoom.buildingName"/>',
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
																name : 'buildingName',
								hidden : true
							},  {
								flex : 1,
								name : 'floorId',allowBlank:false,
								fieldLabel : '<s:text name="vTelRoom.floorName"/>',
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
						name:'name',
						fieldLabel:'<s:text name="vTelRoom.name"/>'
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
						allowBlank : false,
						xtype : 'numberfield', minValue: 3, maxValue: 2000,allowDecimals:false ,
						name:'galleryful',
						fieldLabel:'<s:text name="vTelRoom.galleryful"/>'
					}
					,{
						flex:1,
						xtype : 'container',
						layout : 'hbox',
						defaultType : 'textfield',
						items : [{
								flex:2,
								allowBlank:false,
								name:'price',
								itemId:'price',
								fieldLabel:'<s:text name="officeType.price"/>',
								xtype : 'numberfield', 
								minValue: 1, 
								maxValue: 10000,
								decimalPrecision:2,  
						   		allowDecimals:true, 
						   		hideTrigger: true
							 },
							  {
								flex : 1,
								labelWidth : 50,
								xtype : 'combo',
								displayField : 'text',
								valueField : 'value',
							    allowBlank : false,
								store : dateDs,
							    itemId : 'unit',
								name : 'unit',
								fieldLabel : '<s:text name="officeType.unit"/>'
							 }
							 ]
				}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'combo',
				items : [{
							flex : 1,//allowBlank:false,
							name : 'equipment',
							itemId : 'equipment',
							fieldLabel : '<s:text name="vTelRoom.equipment"/>',
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
				items : [
					{
						flex:1,
						name:'intro',
						fieldLabel:'<s:text name="vTelRoom.intro"/>'
						 ,height:250,xtype: 'textarea',	flex : 1	
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						xtype : 'filefield',
						flex : 1,
						name : 'uploadFile',
					  itemId : 'uploadFile',
						emptyText : '请选择上传文件...',
						fieldLabel : '<s:text name="telRoom.pic"/>',
						buttonText : '',
						buttonConfig : {
							iconCls : 'uploadPic'
						}

					}, {
						fieldLabel : '<s:text name="telRoom.pic"/>',
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
						name : 'delFileFlag',
						itemId : 'delFileFlag',
						style : "margin-left:70px",
						hideLabel : true,
						width : 150,
						itemCls : 'left-float',
						clearCls : 'allow-float'
					} 
				]
			}
		],
		buttons : [
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var saveForm = this.up('form');
						if (saveForm.getForm().isValid()) {
							saveFile(saveForm, 'uploadFile', fileTypes,
									'product/telRoom!save', grid);
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
	formEditPrice = Ext.widget('form', {
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
			{itemId:'id',name:'id',hidden:true},
			{name:'areaId',hidden:true},
			{name:'cityId',hidden:true},
			{name:'buildingId',hidden:true},
			{name:'buildingName',hidden:true},
			{name:'floorId',hidden:true},
			{name:'floorName',hidden:true},
			{name:'galleryful',hidden:true},
			{name:'intro',hidden:true},
			{name:'equipment',itemId:'equipment',hidden:true},
			{xtype : 'filefield',name : 'uploadFile',itemId : 'uploadFile',hidden:true},
			{xtype : 'displayfield',itemId : 'fileShow',name : 'fileShow',hidden:true},
			{hidden : true,itemId : 'pic',name : 'pic'},
			{xtype : 'checkbox',value : 1,name : 'delFileFlag',itemId : 'delFileFlag',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						itemId:'name',					
						name:'name',
						fieldLabel:'<s:text name="vTelRoom.name"/>'
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
						name:'price',
						itemId:'price',
						fieldLabel:'<s:text name="officeType.price"/>',
						xtype : 'numberfield', 
						minValue: 1, 
						maxValue: 10000,
						decimalPrecision:2,  
				   		allowDecimals:true, 
				   		hideTrigger: true
					 }
				]	
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					 {
						flex : 1,
						xtype : 'combo',
						displayField : 'text',
						valueField : 'value',
					    allowBlank : false,
						store : dateDs,
					    itemId : 'unit',
						name : 'unit',
						fieldLabel : '<s:text name="officeType.unit"/>'
					}
				]	
			}
		],
		buttons : [
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var saveForm = this.up('form');
						if (saveForm.getForm().isValid()) {
							saveFile(saveForm, 'uploadFile', fileTypes,
									'product/telRoom!save', grid);
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

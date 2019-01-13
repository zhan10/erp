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
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'contractNumber',
						fieldLabel:'<s:text name="vRentContract.contractNumber"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'customerName',
						fieldLabel:'<s:text name="vRentContract.customerName"/>'
					},
					{
						flex : 1,
						allowBlank : false,
						name : 'state',
						xtype : 'combo',
						displayField : 'text',forceSelection:true,
						valueField : 'value',
						store : [ [ 0, '未完成' ], [ 1, '完成' ] ],
						fieldLabel : '<s:text name="vRentContract.state" />'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'contractDate',
						fieldLabel:'<s:text name="vRentContract.contractDate"/>',
						itemId:'contractDate',
						xtype:'datetimefield',
						format: 'Y-m-d'
					},
					{
						flex:1,
						allowBlank:false,
						name:'usefulLife',
						fieldLabel:'<s:text name="vRentContract.usefulLife"/>',
						itemId:'usefulLife',
						xtype:'datetimefield',
						format: 'Y-m-d'
					},
					{
						flex:1,
						allowBlank:false,
						name:'validDate',
						itemId:'validDate',
						fieldLabel:'<s:text name="vRentContract.validDate"/>',
						xtype:'datetimefield',
						format: 'Y-m-d'
					}
				]
			}, {
				xtype : 'container',
					layout : 'hbox',
					defaultType : 'textfield',
					items : [							
							{
								flex : 1,allowBlank:false,
								name : 'buildingId',
								itemId : 'buildingNames',
								fieldLabel : '<s:text name="vRentContract.buildingName"/>',
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
								fieldLabel : '<s:text name="vRentContract.floorName"/>',
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
							},
				   {
						flex : 1,
						allowBlank:false,
						name : 'roomNumber',
						itemId : 'roomNumber',
						fieldLabel : '<s:text name="vRentContract.roomNumber"/>',
						xtype : 'combo',
						value : '',
						displayField : 'name',
						valueField : 'id',
						editable : false,
						multiSelect : true, 
						store : cb_workbenchTypes_ds,
						queryMode: 'local',
						listeners : {
							focus : function(){
								cb_workbenchTypes_ds.loadPage(1);
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
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
					    flex:1,
						allowBlank : true,
						name : 'acreage',
						fieldLabel : '<s:text name="vRentContract.acreage" />'
					},
					{
					    flex:1,
						allowBlank:true,
						name:'population',
						fieldLabel:'<s:text name="vRentContract.population"/>'
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
						name:'monthRent',
						fieldLabel:'<s:text name="vRentContract.monthRent"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'downPayment',
						fieldLabel:'<s:text name="vRentContract.downPayment"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'margin',
						fieldLabel:'<s:text name="vRentContract.margin"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [

				{
					xtype : 'filefield',
					flex : 1,
					name : 'uploadFile',
					id:'uploadFile',
					emptyText : '请选择上传文件...',
					fieldLabel : '<s:text name="vRentContract.pic"/>',
					buttonText : '',
					buttonConfig : {
						iconCls : 'uploadPic'
					}

				}, {
					fieldLabel : '<s:text name="vRentContract.pic"/>',
					xtype : 'displayfield',
					itemId : 'fileShow',
					name : 'pic',
					hiedden: true,
					itemCls : 'left-float',
					clearCls : 'allow-float'
				}, {
					hidden:true,
					itemId : 'pic',
					name : 'pic',
					itemCls : 'left-float',
					clearCls : 'allow-float'
				}, {
					xtype : 'checkbox',
					boxLabel : '删除附件',
					value:1,
					name : 'delFileFlag',
					itemId : 'delFileFlag',
					style : "margin-left:70px",
					hideLabel : true,
					width : 150,
					itemCls : 'left-float',
					clearCls : 'allow-float'
				} ]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						    xtype: 'textarea',
							flex : 1,
							allowBlank:true,
							name : 'comment',
							id : 'comment',
							height:70,
						    fieldLabel:'<s:text name="vRentContract.comment"/>'
					}
				]
			}
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					if (saveForm.getForm().isValid()) {
						saveFile(saveForm, 'uploadFile', fileTypes,
								'finance/rentContract!save', grid);
					}
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

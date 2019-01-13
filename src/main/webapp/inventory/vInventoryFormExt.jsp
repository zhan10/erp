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
			},{
				itemId : 'type',
				name : 'type',
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
			}
		],
		buttons : [
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var saveForm = this.up('form');
						//类型
						var type = saveForm.down('#type').getValue();
						//数量
						var quantities = saveForm.down('#quantities').getValue();
						//剩余库存量
						var records = saveForm.down('#records').getValue();
						if(type=2){
							if((records-quantities)>=0){
								if (saveForm.getForm().isValid()) {
									saveFormToDB(saveForm, 'inventory/inventory!save',grid);
								}
							}else{
								alert("超出剩余库存量。")
							} 
						}else{
							if (saveForm.getForm().isValid()) {
								saveFormToDB(saveForm, 'inventory/inventory!save',grid);
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
		items :[{
			flex : 1,
			value:'quantities',
			name : 'name',
			itemId:'selectName',
			fieldLabel : '修改数量',
			allowBlank : false,
			xtype : 'combo',
			forceSelection: true,
			store : [
				['quantities','<s:text name="vInventory.quantities"/>']
			],
			listeners : {
				select : function() {
					var nodes = this.up('form').query('[name=value]');
					for (i = 0; i < nodes.length; i++) {
						if (nodes[i].getItemId() == (this.value)) {
							nodes[i].setDisabled(false);
							nodes[i].setVisible(true);
						} else {
							nodes[i].setDisabled(true);
							nodes[i].setVisible(false);
						}
					}
				}
			}
		}
		,{
			flex : 1,
			name : 'value',
			fieldLabel : '设置新值',
			itemId:'quantities'
		}
		],
		buttons:[
			{
				text : '更新',
				handler : function() {
					var saveForm = this.up('form');
					if (saveForm.getForm().isValid()) {
						updateFieldsToDB(saveForm,sm,'inventory/inventory!updateFields',function() {});
					}
				}
			},{
				text : '取消',
				handler : function() {
					this.up('window').hide();
				}
			}]
		});
</script>

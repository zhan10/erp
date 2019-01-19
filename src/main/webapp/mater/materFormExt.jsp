<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var number = 0;
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
				itemId : 'matetypeid',
				name : 'matetypeid',
				hidden : true
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						allowBlank : false,
						name : 'materid',
						fieldLabel : '<s:text name="mater.materid"/>'
					},
					{
						flex : 1,
						allowBlank : false,
						name : 'matername',
						fieldLabel : '<s:text name="mater.matername"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				id:'mateTypeCombos',
				defaultType : 'textfield',
				items : [
					 {
						flex : 1,
						allowBlank : false,
						itemId : 'matetypeid'+number,
						xtype : 'combo',
						displayField : 'name',forceSelection:false,
						valueField : 'id',
						store : cb_mateType_ds,
						fieldLabel : '<s:text name="mater.matetypeid" />',
						listeners : {
							expand : function() {
								Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' and grade=1'});
								cb_mateType_ds.loadPage(1);
							},
							select : function() {
								form.down('#matetypeid').setValue(this.getValue())
								var items=Ext.getCmp('mateTypeCombos');
								if(number!=0){
									for(var i=0;i<number;i++){
										items.remove("matetypeid"+(i+1));
									}
									number = 0;
								}
								Ext.apply(cb_mateType_ds.proxy.extraParams,{whereSql : ' and grade=1'});
								cb_mateType_ds.loadPage(1);
								addItem(items,this.getValue());
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
						flex : 1,
						allowBlank : false,
						itemId:'stand',
						name : 'stand',
						fieldLabel : '<s:text name="mater.stand"/>'
					},
					{
						flex : 1,
						allowBlank : false,
						name : 'unit',
						fieldLabel : '<s:text name="mater.unit"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				hidden : false,
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						name : 'mwidth',
						itemId : 'mwidth',
						fieldLabel : '<s:text name="mater.mwidth"/>'
					},
					{
						flex : 1,
						name : 'mheighth',
						itemId : 'mheighth',
						fieldLabel : '<s:text name="mater.mheighth"/>'
					},
					{
						flex : 1,
						name : 'mdeepth',
						itemId : 'mdeepth',
						fieldLabel : '<s:text name="mater.mdeepth"/>'
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
						name : 'ckid',
						itemId : 'ckid',
						xtype : 'combo',
						displayField : 'name',forceSelection:false,
						valueField : 'id',
						store : cb_warehouse_ds,
						fieldLabel : '<s:text name="mater.ckid" />',
						listeners : {
							select : function() {											
								Ext.apply(cb_warehouseSite_ds.proxy.extraParams,{whereSql : ' and wid='+this.getValue()});
								cb_warehouseSite_ds.loadPage(1);
								this.up('form').getForm().findField('warelocaid').setValue("");		
							}
						}
					},
					{
						flex : 1,
						allowBlank : false,
						name : 'warelocaid',
						itemId : 'warelocaid',
						xtype : 'combo',
						displayField : 'name',forceSelection:true,
						valueField : 'id',
						store : cb_warehouseSite_ds,
						fieldLabel : '<s:text name="mater.warelocaid" />'
					}
					/* {
						flex : 1,
						allowBlank : false,
						name : 'ckid',
						fieldLabel : '<s:text name="mater.ckid"/>'
					},
					{
						flex : 1,
						allowBlank : false,
						name : 'warelocaid',
						fieldLabel : '<s:text name="mater.warelocaid"/>'
					} */
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						allowBlank : false,
						itemId : 'lastmoddate',
						name : 'lastmoddate',
						fieldLabel : '<s:text name="mater.lastmoddate"/>'
					},
					{
						flex : 1,
						allowBlank : false,
						itemId : 'lastmodmaker',
						name : 'lastmodmaker',
						fieldLabel : '<s:text name="mater.lastmodmaker"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				hidden : false,
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						name : 'mwidth',
						itemId : 'mwidth',
						fieldLabel : '<s:text name="mater.mwidth"/>'
					},
					{
						flex : 1,
						name : 'mheighth',
						itemId : 'mheighth',
						fieldLabel : '<s:text name="mater.mheighth"/>'
					},
					{
						flex : 1,
						name : 'mdeepth',
						itemId : 'mdeepth',
						fieldLabel : '<s:text name="mater.mdeepth"/>'
					}
				]
			}, {
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [ {
					xtype: 'textarea',
					flex : 1,
					name : 'description',
					height:100,
					fieldLabel : '<s:text name="mater.description"/>'
				} ]
			}
		],
		buttons : [
				{
					text : '保存',
					itemId : 'btnSave',
					handler : function() {
						var saveForm = this.up('form');
						debugger;
						//规格
						var stand = saveForm.down('#stand').getValue();
						var stands = stand.split("*");
						//设置长度
						saveForm.down('#mwidth').setValue(stands[0]);
						//设置宽度
						saveForm.down('#mheighth').setValue(stands[1]);
						//设置厚度
						saveForm.down('#mdeepth').setValue(stands[2]);
						//alert(Ext.JSON.encode(saveForm.getForm().getValues()));
						if (saveForm.getForm().isValid()) {
							saveFormToDB(saveForm, 'mater/mater!save',grid);
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

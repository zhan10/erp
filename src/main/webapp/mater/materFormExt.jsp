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
						fieldLabel : '<s:text name="mater.matetypeid" />'
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
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						allowBlank : false,
						name : 'mwidth',
						fieldLabel : '<s:text name="mater.mwidth"/>'
					},
					{
						flex : 1,
						allowBlank : false,
						name : 'mheighth',
						fieldLabel : '<s:text name="mater.mheighth"/>'
					},
					{
						flex : 1,
						allowBlank : false,
						name : 'mdeepth',
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

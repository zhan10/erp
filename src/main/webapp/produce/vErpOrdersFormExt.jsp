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
			{itemId:'ordersCode',name:'ordersCode',hidden:true},
			{itemId:'status',name:'status',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'name',
						fieldLabel:'<s:text name="vErpOrders.name"/>'
					},{
						flex:1,
						allowBlank:false,
						name:'mobile',
						fieldLabel:'<s:text name="vErpOrders.mobile"/>'
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
						name:'address',
						fieldLabel:'<s:text name="vErpOrders.address"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						xtype : 'combo',
						displayField : 'name',
						valueField : 'id',
					    allowBlank : false,
						store : cb_users_ds,
						name : 'uid',
						fieldLabel : '<s:text name="vErpOrders.userName"/>',
						listeners : {
							select : function() {
								form.down('#code').setValue(this.findRecord('id',this.getValue()).get('code'));
							}
						}
					},{
						flex:1,
						allowBlank:false,
						itemId : 'code',
						name:'code',
						fieldLabel:'<s:text name="vErpOrders.code"/>'
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
						name:'ordersMoney',
						fieldLabel:'<s:text name="vErpOrders.ordersMoney"/>'
					},{
						flex:1,
						allowBlank:false,
						name:'cabinetQuantity',
						regex: /^[1-9]\d*$/,
						regexText : '请输数字',
						anchor: '92%',
						fieldLabel:'<s:text name="vErpOrders.cabinetQuantity"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						xtype: 'textarea',
						flex : 1,
						name : 'memo',
						height:200,
						fieldLabel:'<s:text name="vErpOrders.memo"/>'
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
					saveFormToDB(saveForm, 'produce/erpOrders!save',grid);
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

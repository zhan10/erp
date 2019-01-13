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
						name:'buildingId',
						fieldLabel:'<s:text name="orders.buildingId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'bookingId',
						fieldLabel:'<s:text name="orders.bookingId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'ordersTime',
						fieldLabel:'<s:text name="orders.ordersTime"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'status',
						fieldLabel:'<s:text name="orders.status"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'consumerId',
						fieldLabel:'<s:text name="orders.consumerId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'total',
						fieldLabel:'<s:text name="orders.total"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'address',
						fieldLabel:'<s:text name="orders.address"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'arrTime',
						fieldLabel:'<s:text name="orders.arrTime"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						name:'memo',
						fieldLabel:'<s:text name="orders.memo"/>'
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
					saveFormToDB(saveForm, 'restaurant/orders!save',grid);
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

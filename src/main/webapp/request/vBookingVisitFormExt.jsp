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
					name : 'state',
					xtype : 'combo',
					displayField : 'text',
					valueField : 'value',
					allowBlank:false,
					id:'state',
					store : orderVisitDs,
					fieldLabel:'<s:text name="vOrders.status"/>'
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
					name:'consumerName',
					id:'consumerName',
					fieldLabel:'<s:text name="orderVisitConsumer.name"/>'
				},
				{
					flex:1,
					allowBlank:false,
					name:'productType',
					id:'productType',
					fieldLabel:'<s:text name="orderVisitProduct.type"/>'
				}
			]
		}
		,
		{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [
				{
					flex:1,
					allowBlank:false,
					name:'city',
					id:'city',
					fieldLabel:'<s:text name="orderVisit.city"/>'
				},
				{
					flex:1,
					allowBlank:false,
					name:'area',
					id:'area',
					fieldLabel:'<s:text name="orderVisit.area"/>'
				}
			]
		}
		,
		{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [
				{
					flex:1,
					allowBlank:false,
					name:'buildingName',
					id:'buildingName',
					fieldLabel:'<s:text name="orderVisitProduct.name"/>'
				},
				{
					flex:1,
					allowBlank:false,
					name:'floorName',
					id:'floorName',
					fieldLabel:'<s:text name="orderVisitFloor.name"/>'
				}
			]
		}
		,
		{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [
				{
					flex:1,
					allowBlank:false,
					name:'productName',
					id:'productName',
					fieldLabel:'<s:text name="orderVisitProduct.name"/>'
				},
				{
					flex:1,
					allowBlank:false,
					name:'createTime',
					id:'createTime',
					fieldLabel:'<s:text name="orderVisitCreate.time"/>',	
				}
			]
		}
		,
		{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [
				{
					flex:1,
					allowBlank:false,
					name:'appointTime',
					id:'appointTime',
					fieldLabel:'<s:text name="orderVisitAppoint.time"/>',
				},
				{
					flex:1,
					name:'visitTime',
					itemId:'visitTime',
					fieldLabel:'<s:text name="orderVisit.time"/>',
					xtype:'datetimefield',
					format: 'Y-m-d'
				}
			]
		},{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [
				{
					 xtype: 'textarea',
						flex : 1,
						name : 'remark',
						itemId :'remark',
						height:100,
					fieldLabel:'<s:text name="orderVisit.remark"/>'
				}
			]
		},{
			xtype : 'container',
			layout : 'hbox',
			defaultType : 'textfield',
			items : [
				{
					 xtype: 'textarea',
						flex : 1,
						name : 'opinion',
						itemId :'opinion',
						height:90,
					fieldLabel:'<s:text name="orderVisit.opinion"/>'
				}
			]
		}
	],
	buttons : [ {
		text : '确定时间',
		itemId : 'btnConfirm',
		handler : formConfirm
	},{
		text : '参观完成',
		itemId : 'btnAccomplish',
		handler : formAccomplish
	},{
		text : '保存',
		itemId : 'btnSave',
		handler : function() {
			var saveForm = this.up('form');
			if (saveForm.getForm().isValid()) {
				saveFormToDB(saveForm, 'order/vBookingVisit!save',grid);
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

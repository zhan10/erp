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
			{itemId:'floorId',name:'floorId',hidden:true},
			{itemId:'buildingId',name:'buildingId',hidden:true},
			{itemId:'cityId',name:'cityId',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'cityName',
						fieldLabel:'<s:text name="vVisit.cityName"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'visitType',
						fieldLabel:'<s:text name="vVisit.visitType"/>'
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
						name:'buildingName',
						fieldLabel:'<s:text name="vVisit.buildingName"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'floorName',
						fieldLabel:'<s:text name="vVisit.floorName"/>'
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
						name:'custom',
						fieldLabel:'<s:text name="vVisit.custom"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'phone',
						fieldLabel:'<s:text name="vVisit.phone"/>'
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
						name:'visitNumber',
						fieldLabel:'<s:text name="vVisit.visitNumber"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'ordertime',
						fieldLabel:'<s:text name="vVisit.ordertime"/>',
						//xtype:'datefield',
						//format: 'Y-m-d'				
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
					saveFormToDB(saveForm, 'visit/visit!save',grid);
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
	sendSmsForm = Ext.widget('form', {
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
			{itemId:'floorId',name:'floorId',hidden:true},
			{itemId:'buildingId',name:'buildingId',hidden:true},
			{itemId:'cityId',name:'cityId',hidden:true},
			{itemId:'address',name:'address',hidden:true},
			{itemId:'information',name:'information',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'cityName',
						itemId:'cityName',
						fieldLabel:'<s:text name="vVisit.cityName"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'visitType',
						itemId:'visitType',
						fieldLabel:'<s:text name="vVisit.visitType"/>'
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
						name:'buildingName',
						itemId:'buildingName',
						fieldLabel:'<s:text name="vVisit.buildingName"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'floorName',
						itemId:'floorName',
						fieldLabel:'<s:text name="vVisit.floorName"/>'
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
						name:'custom',
						fieldLabel:'<s:text name="vVisit.custom"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'phone',
						fieldLabel:'<s:text name="vVisit.phone"/>'
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
						name:'visitNumber',
						fieldLabel:'<s:text name="vVisit.visitNumber"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'ordertime',
						itemId:'ordertime',
						fieldLabel:'<s:text name="vVisit.ordertime"/>',
						//xtype:'datefield',
						//format: 'Y-m-d'				
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
						name:'serviceName',
						//value:visitServiceName,
						itemId:'serviceName',
						fieldLabel:'<s:text name="vVisit.serviceName"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'serviceTel',
						//value:visitTel,
						itemId:'serviceTel',
						fieldLabel:'<s:text name="vVisit.serviceTel"/>'
					}
				]
			},
			{
				xtype: 'textarea',
				flex:1,
				allowBlank:false,
				name:'smsContext',
				itemId:'smsContext',
				height:90,
				fieldLabel:'<s:text name="vVisit.smsContext"/>'
			}	
		],
		buttons : [ {
			text : '发送',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					sendSms(saveForm, 'visit/vVisit!sendSms',grid);
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

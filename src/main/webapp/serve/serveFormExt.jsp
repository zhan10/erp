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
						name:'state',
						id:'state',
						fieldLabel:'<s:text name="serve.state"/>',
						xtype:'combobox',
						displayField : 'text',
						valueField : 'value',
						store: serveStateDs
					},
					{
						flex:1,
						allowBlank:false,
						name:'serviceType',
						id:'serviceType',
						fieldLabel:'<s:text name="serve.serviceType"/>',
						xtype:'combobox',
						store:[[1,'办公'],[2,'参观'],[3,'考察'],[4,'预览']]
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
							allowBlank:false,
							name : 'name',
							id:'name',
						    fieldLabel:'<s:text name="serve.name"/>'
					},
					{
						flex : 1,
						allowBlank:false,
						name : 'phone',
						id:'phone',
					    fieldLabel:'<s:text name="serve.phone"/>'
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
							allowBlank:true,
							name : 'eMail',
							id:'eMail',
						    fieldLabel:'<s:text name="serve.eMail"/>'
					},
					{
						flex : 1,
						allowBlank:false,
						name : 'data',
						itemId:'data',
					    fieldLabel:'<s:text name="serve.data"/>'
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
					name : 'amender',
					itemId:'amender',
					fieldLabel : '<s:text name="serve.handleUser"/>'
					} ,
				{
					name : 'amenderId',
					itemId:'amenderId',
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
						    xtype: 'textarea',
							flex : 1,
							allowBlank:true,
							name : 'demandDescription',
							id : 'demandDescription',
							height:70,
						    fieldLabel:'<s:text name="serve.demandDescription"/>'
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
							allowBlank:true,
							name : 'memo',
							id : 'memo',
							disabled:true,
							height:70,
						    fieldLabel:'<span style="color:red"><s:text name="serve.memo"/></span>'
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
							allowBlank:true,
							name : 'result',
							id : 'result',
							disabled:true,
							height:70,
						    fieldLabel:'<span style="color:red"><s:text name="serve.result"/></span>'
					}
				]
			}
			
		],
		buttons : [ {
			text : '提交处理',
			itemId : 'btnDispose',
			hidden:true,
			handler : formDispose
		},{
			text : '处理完成',
			itemId : 'btnFinish',
			hidden:true,
			handler : formFinish
		},{
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'serve/serve!save',grid);
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

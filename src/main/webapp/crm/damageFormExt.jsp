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
						name:'bookingId',
						fieldLabel:'<s:text name="damage.bookingId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'consumerId',
						fieldLabel:'<s:text name="damage.consumerId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'payTime',
						fieldLabel:'<s:text name="damage.payTime"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'digest',
						fieldLabel:'<s:text name="damage.digest"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'payment',
						fieldLabel:'<s:text name="damage.payment"/>'
					}
					,
					{
						flex:1,
						name:'memo',
						fieldLabel:'<s:text name="damage.memo"/>'
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
					saveFormToDB(saveForm, 'crm/damage!save',grid);
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

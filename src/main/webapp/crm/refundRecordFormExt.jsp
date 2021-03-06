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
						name:'consumerId',
						fieldLabel:'<s:text name="refundRecord.consumerId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'refundTime',
						fieldLabel:'<s:text name="refundRecord.refundTime"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'amount',
						fieldLabel:'<s:text name="refundRecord.amount"/>'
					}
					,
					{
						flex:1,
						name:'bookingId',
						fieldLabel:'<s:text name="refundRecord.bookingId"/>'
					}
					,
					{
						flex:1,
						name:'memo',
						fieldLabel:'<s:text name="refundRecord.memo"/>'
					}
					,
					{
						flex:1,
						name:'relatedId',
						fieldLabel:'<s:text name="refundRecord.relatedId"/>'
					}
					,
					{
						flex:1,
						name:'relatedType',
						fieldLabel:'<s:text name="refundRecord.relatedType"/>'
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
					saveFormToDB(saveForm, 'crm/refundRecord!save',grid);
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

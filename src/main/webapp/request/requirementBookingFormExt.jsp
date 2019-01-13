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
						flex : 1,
						xtype : 'combo',
						displayField : 'text',
						valueField : 'value',
						allowBlank : false,
						//value:'',
						store :requirementBookingStatusDs,
						itemId : 'status',
						name : 'status',
						fieldLabel : '<s:text name="orderRequestCreate.status"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'consumerName',
						itemId : 'consumerName',
						fieldLabel:'<s:text name="orderRequestConsumer.name"/>'
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
						name:'tel',
						itemId :'tel',
						fieldLabel:'<s:text name="orderRequest.tel"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'createTime',
						itemId:'createTime',
						fieldLabel:'<s:text name="orderRequestCreate.time"/>',
						xtype : 'datefield',
						format : 'Y-m-d'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						name:'content',
						itemId:'content',
						fieldLabel:'<s:text name="orderRequest.content"/>'
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
						name : 'remark',
						itemId : 'remark',
						height:300,
						fieldLabel:'<s:text name="orderRequest.remark"/>'
					}
				]
			}
		],
		buttons : [ {
			text : '处理',
			itemId : 'btnDispose',
			handler : formDispose
		},{
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'requirement/requirementBooking!save',grid);
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

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
						name:'vipRoomId',
						fieldLabel:'<s:text name="vipRoomBooking.vipRoomId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'bookingId',
						fieldLabel:'<s:text name="vipRoomBooking.bookingId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'dateFrom',
						fieldLabel:'<s:text name="vipRoomBooking.dateFrom"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'dateTo',
						fieldLabel:'<s:text name="vipRoomBooking.dateTo"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'price',
						fieldLabel:'<s:text name="vipRoomBooking.price"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'total',
						fieldLabel:'<s:text name="vipRoomBooking.total"/>'
					}
					,
					{
						flex:1,
						name:'consumerId',
						fieldLabel:'<s:text name="vipRoomBooking.consumerId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'balance',
						fieldLabel:'<s:text name="vipRoomBooking.balance"/>'
					}
					,
					{
						flex:1,
						name:'balanceTime',
						fieldLabel:'<s:text name="vipRoomBooking.balanceTime"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						name:'balancePrice',
						fieldLabel:'<s:text name="vipRoomBooking.balancePrice"/>'
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
					saveFormToDB(saveForm, 'produce/vipRoomBooking!save',grid);
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

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
						name:'exhibitionRoomId',
						fieldLabel:'<s:text name="exhibitionRoomBooking.exhibitionRoomId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'bookingId',
						fieldLabel:'<s:text name="exhibitionRoomBooking.bookingId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'dateFrom',
						fieldLabel:'<s:text name="exhibitionRoomBooking.dateFrom"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'dateTo',
						fieldLabel:'<s:text name="exhibitionRoomBooking.dateTo"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'price',
						fieldLabel:'<s:text name="exhibitionRoomBooking.price"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'total',
						fieldLabel:'<s:text name="exhibitionRoomBooking.total"/>'
					}
					,
					{
						flex:1,
						name:'consumerId',
						fieldLabel:'<s:text name="exhibitionRoomBooking.consumerId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'balance',
						fieldLabel:'<s:text name="exhibitionRoomBooking.balance"/>'
					}
					,
					{
						flex:1,
						name:'balanceTime',
						fieldLabel:'<s:text name="exhibitionRoomBooking.balanceTime"/>'
,xtype:'datefield',format: 'Y-m-d'					}
					,
					{
						flex:1,
						name:'balancePrice',
						fieldLabel:'<s:text name="exhibitionRoomBooking.balancePrice"/>'
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
					saveFormToDB(saveForm, 'produce/exhibitionRoomBooking!save',grid);
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

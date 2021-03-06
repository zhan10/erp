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
						fieldLabel:'<s:text name="booking.buildingId"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'code',
						fieldLabel:'<s:text name="booking.code"/>'
					}
					,
					{
						flex:1,
						name:'persons',
						fieldLabel:'<s:text name="booking.persons"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'bookingTime',
						fieldLabel:'<s:text name="booking.bookingTime"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'status',
						fieldLabel:'<s:text name="booking.status"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'consumerId',
						fieldLabel:'<s:text name="booking.consumerId"/>'
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
					saveFormToDB(saveForm, 'produce/booking!save',grid);
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

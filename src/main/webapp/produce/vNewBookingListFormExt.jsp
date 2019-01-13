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
			{itemId:'productType',name:'productType',hidden:true},{name:'productId',hidden:true},{name:'consumerId',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'status',
						itemId:'status',
						fieldLabel:'<s:text name="vNewBookingList.status"/>',
						xtype : 'combo',
						displayField : 'text',forceSelection:true,
						valueField : 'value',
						store : [ [ 0, '未支付' ], [ 1, '已支付' ] ]
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'code',
						itemId:'code',
						fieldLabel:'<s:text name="vNewBookingList.code"/>'
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
						name:'productName',
						itemId:'productName',
						fieldLabel:'<s:text name="vNewBookingList.productName"/>'
					}
					,
					{
						flex:1,
						name:'buildingName',
						itemId:'buildingName',
						fieldLabel:'<s:text name="vNewBookingList.buildingName"/>'
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
						itemId:'consumerName',
						fieldLabel:'<s:text name="vNewBookingList.consumerName"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'total',
						fieldLabel:'<s:text name="vNewBookingList.total"/>'
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
						name:'quantity',
						fieldLabel:'<s:text name="vNewBookingList.quantity"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'price',
						fieldLabel:'<s:text name="vNewBookingList.price"/>'
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
						name:'deposit',
						fieldLabel:'<s:text name="vNewBookingList.deposit"/>'
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'bookingTime',
						itemId:'bookingTime',
						fieldLabel:'<s:text name="vNewBookingList.bookingTime"/>',
						xtype:'datefield',
						format: 'Y-m-d H:i:s'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				itemId : 'dateType',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'dateFrom',
						itemId:'dateFrom',
						fieldLabel:'<s:text name="vNewBookingList.dateFrom"/>',
						xtype:'datetimefield',
						format: 'Y-m-d'		
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'dateTo',
						itemId:'dateTo',
						fieldLabel:'<s:text name="vNewBookingList.dateTo"/>',
						xtype:'datetimefield',
						format: 'Y-m-d'		
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				itemId : 'dateType1',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'dateFrom1',
						itemId:'dateFrom1',
						fieldLabel:'<s:text name="vNewBookingList.dateFrom"/>',
						xtype:'datefield',
						format: 'Y-m-d'		
					}
					,
					{
						flex:1,
						allowBlank:false,
						name:'dateTo1',
						itemId:'dateTo1',
						fieldLabel:'<s:text name="vNewBookingList.dateTo"/>',
						xtype:'datefield',
						format: 'Y-m-d'		
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
						name:'tel',
						itemId:'tel',
						fieldLabel:'<s:text name="vNewBookingList.tel"/>'
					}
					,
					{
						flex:1,
						name:'email',
						itemId:'email',
						fieldLabel:'<s:text name="vNewBookingList.email"/>'
					}
				]
			}
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				var type = saveForm.down('#productType').getValue();
				if(type!=3){
					saveForm.down('#dateFrom').setValue(form.down('#dateFrom1').getValue());
					saveForm.down('#dateTo').setValue(form.down('#dateTo1').getValue());
				}
				if (saveForm.getForm().isValid()) {
					saveFormToDB(saveForm, 'produce/newBooking!save',grid);
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
						fieldLabel:'<s:text name="vNewBookingList.cityName" />'
					},
					{
						flex:1,
						allowBlank:false,
						name:'buildingName',
						itemId:'buildingName',
						fieldLabel:'<s:text name="vNewBookingList.buildingName"/>'
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
						name:'floorName',
						itemId:'floorName',
						fieldLabel:'<s:text name="vNewBookingList.floorName" />'
					},
					{
						flex:1,
						allowBlank:false,
						name:'productName',
						itemId:'productName',
						fieldLabel:'<s:text name="vNewBookingList.productName"/>'
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
						itemId:'consumerName',
						fieldLabel:'<s:text name="vNewBookingList.consumerName" />'
					},
					{
						flex:1,
						allowBlank:false,
						name:'tel',
						itemId:'tel',
						fieldLabel:'<s:text name="vNewBookingList.tel"/>'
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
						name:'dateFrom',
						itemId:'dateFrom',
						fieldLabel:'<s:text name="vNewBookingList.dateFrom"/>',
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
						itemId:'serviceName',
						fieldLabel:'<s:text name="vNewBookingList.serviceName"/>'
					},
					{
						flex:1,
						allowBlank:false,
						name:'serviceTel',
						itemId:'serviceTel',
						fieldLabel:'<s:text name="vNewBookingList.serviceTel"/>'
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
					sendSms(saveForm, 'produce/vNewBookingList!sendSms',grid);
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

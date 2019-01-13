<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	form = Ext
			.widget(
					'form',
					{
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
								{
									itemId : 'id',
									name : 'id',
									hidden : true
								},{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												allowBlank : false,
												name : 'productType',
												itemId : 'productType',
												fieldLabel : '<s:text name="vBookingList.productType"/>',
												hidden:true
											}]
								},
								{
												flex : 1,
												xtype : 'combo',
												displayField : 'text',
												valueField : 'value',
												allowBlank : false,
												store : bookingStatusDs,
												itemId : 'status',
												name : 'status',
												fieldLabel : '<s:text name="vBookingList.status"/>',
												hidden:true
								},
								{
												flex : 1,
												allowBlank : false,
												name : 'bookingId',
												itemId : 'bookingId',
												fieldLabel : '<s:text name="vBookingList.bookingId"/>',
												hidden:true
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex:1,
												allowBlank:false,
												name:'state',
												itemId:'state',
												fieldLabel:'<s:text name="vBookingList.state"/>',
												xtype:'combobox',
												displayField : 'text',
												valueField : 'value',
												store: vBookingListStateDs
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'code',
												itemId : 'code',
												fieldLabel : '<s:text name="vBookingList.code"/>'
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												allowBlank : false,
												name : 'name',
												itemId : 'name',
												fieldLabel : '<s:text name="vBookingList.name"/>'
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'certificateCode',
												itemId : 'certificateCode',
												fieldLabel : '<s:text name="vBookingList.certificateCode"/>'
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												allowBlank : false,
												name : 'consumerName',
												itemId : 'consumerName',
												fieldLabel : '<s:text name="vBookingList.consumerName"/>'
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'badge',
												itemId : 'badge',
												fieldLabel : '<s:text name="vBookingList.badge"/>'
											} ]
								},{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												allowBlank : false,
												name : 'total',
												itemId : 'total',
												fieldLabel : '<s:text name="vBookingList.total"/>'
												
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'bookingTime',
												itemId : 'bookingTime',
												fieldLabel : '<s:text name="vBookingList.bookingTime"/>',
												xtype : 'datefield',
												format : 'Y-m-d H:i:s'
											} ]
								},{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												allowBlank : false,
												name : 'dateFrom',
												itemId : 'dateFrom',
												fieldLabel : '<s:text name="vBookingList.dateFrom"/>',
												xtype : 'datefield',
												format : 'Y-m-d H:i:s'
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'dateTo',
												itemId : 'dateTo',
												fieldLabel : '<s:text name="vBookingList.dateTo"/>',
												xtype : 'datefield',
												format : 'Y-m-d H:i:s'
											} ]
								}],	
						buttons : [
								{
									text : '发卡',
									hidden : true,
									itemId : 'btnRegister',
									handler : function() {
										var saveForm = this.up('form');
										var type = saveForm
												.down("#productType").getValue();
										if (saveForm.getForm().isValid()
												&& type == 1) {
											formRegister('produce/workbenchBooking!save',saveForm);
										} else if (saveForm.getForm().isValid()
												&& type == 2) {
											formRegister('produce/officeBooking!save',saveForm);
										} else if (saveForm.getForm().isValid()
												&& type == 3) {
											formRegister('produce/meetingRoomBooking!save',saveForm);
										} else if (saveForm.getForm().isValid()
												&& type == 4) {
											formRegister('produce/exhibitionRoomBooking!save',saveForm);
										} else if (saveForm.getForm().isValid()
												&& type == 5) {
											formRegister('produce/telRoomBooking!save',saveForm);
										} else if (saveForm.getForm().isValid()
												&& type == 6) {
											formRegister('produce/vipRoomBooking!save',saveForm);
										}
									}
								},
								{
									text : '保存',
									itemId : 'btnSave',
									handler : function() {
										var saveForm = this.up('form');
										var type = saveForm
												.down("#productType")
												.getValue();
										if (saveForm.getForm().isValid()
												&& type == 1) {
											saveFormToDB(
													saveForm,
													'produce/workbenchBooking!save',
													grid);
										} else if (saveForm.getForm().isValid()
												&& type == 2) {
											saveFormToDB(
													saveForm,
													'produce/officeBooking!save',
													grid);
										} else if (saveForm.getForm().isValid()
												&& type == 3) {
											saveFormToDB(
													saveForm,
													'produce/meetingRoomBooking!save',
													grid);
										} else if (saveForm.getForm().isValid()
												&& type == 4) {
											saveFormToDB(
													saveForm,
													'produce/exhibitionRoomBooking!save',
													grid);
										} else if (saveForm.getForm().isValid()
												&& type == 5) {
											saveFormToDB(
													saveForm,
													'produce/telRoomBooking!save',
													grid);
										} else if (saveForm.getForm().isValid()
												&& type == 6) {
											saveFormToDB(
													saveForm,
													'produce/vipRoomBooking!save',
													grid);
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

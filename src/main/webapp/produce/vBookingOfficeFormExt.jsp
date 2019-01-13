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
								},
								{
									name : 'floorId',
									hidden : true
								},
								{
									name : 'officeId',
									hidden : true
								},
								{
									name : 'consumerId',
									hidden : true
								},
								{
									name : 'bookingId',
									hidden : true
								},
								{
									name : 'buildingId',
									hidden : true
								},
								{
									name : 'areaId',
									hidden : true
								},
								{
									name : 'cityId',
									hidden : true
								},
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
												store : [ [ false, '未结算' ],
														[ true, '已结算' ] ],
												name : 'balance',
												fieldLabel : '<s:text name="vBookingOffice.balance"/>'
											},

											{
												flex : 1,
												allowBlank : false,
												name : 'code',
												fieldLabel : '<s:text name="vBookingOffice.code"/>'
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												name : 'buildingName',
												fieldLabel : '<s:text name="vBookingOffice.buildingName"/>'
											},
											{
												flex : 1,
												name : 'floorName',
												fieldLabel : '<s:text name="vBookingOffice.floorName"/>'
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
												fieldLabel : '<s:text name="vBookingOffice.dateFrom"/>',
												name : 'dateFrom'
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'dateTo',
												fieldLabel : '<s:text name="vBookingOffice.dateTo"/>'
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
												name : 'officeName',
												fieldLabel : '<s:text name="vBookingOffice.officeName"/>'
											},
											{
												flex : 1,
												name : 'consumerName',
												fieldLabel : '<s:text name="vBookingOffice.consumerName"/>'
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

												name : 'total',
												fieldLabel : '<s:text name="vBookingOffice.total"/>'
											},
											{
												flex : 1,
												name : 'price',
												fieldLabel : '<s:text name="vBookingOffice.price"/>'
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												name : 'balanceTime',
												fieldLabel : '<s:text name="vBookingOffice.balanceTime"/>'
											},
											{
												flex : 1,
												name : 'balancePrice',
												fieldLabel : '<s:text name="vBookingOffice.balancePrice"/>'
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												name : 'cityName',
												fieldLabel : '<s:text name="vBookingOffice.cityName"/>'
											},
											{
												flex : 1,
												name : 'areaName',
												fieldLabel : '<s:text name="vBookingOffice.areaName"/>'
											} ]
								} ],
						buttons : [
								{
									text : '关闭',
									itemId : 'btnClose',
									handler : function() {
										this.up('window').hide();
									}
								} ]
					});

	var balanceForm = Ext
			.widget(
					'form',
					{
						itemId : 'balanceForm',
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
								},
							
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [											
{
												flex : 1,
												name : 'consumerName',
												fieldLabel : '<s:text name="vBookingOffice.consumerName"/>'
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'code',
												fieldLabel : '<s:text name="vBookingOffice.code"/>'
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												name : 'buildingName',
												fieldLabel : '<s:text name="vBookingOffice.buildingName"/>'
											},
											{
												flex : 1,
												name : 'floorName',
												fieldLabel : '<s:text name="vBookingOffice.floorName"/>'
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
												name : 'officeName',
												fieldLabel : '<s:text name="vBookingOffice.officeName"/>'
											},{
												flex : 1,
												//allowBlank : false,
												name : 'consumerFund',
												fieldLabel : '<s:text name="consumer.fund"/>'
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
												allowBlank : false,
												fieldLabel : '<s:text name="vBookingOffice.dateFrom"/>',
												name : 'dateFrom'
											},
											{
												flex : 1,
												name : 'balanceTime',itemId:'balanceTime',
												fieldLabel : '<s:text name="vBookingOffice.balanceTime"/>'
											}]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												name : 'cityName',
												fieldLabel : '<s:text name="vBookingOffice.cityName"/>'
											},
											{
												flex : 1,
												name : 'areaName',
												fieldLabel : '<s:text name="vBookingOffice.areaName"/>'
											} ]
								} ],
						buttons : [
								
								{
									text : '结算',
									itemId : 'btnBalance',
									handler : function() {
										Ext.MessageBox
												.confirm(
														'订单结算',
														'您是否确认结算此订单，请仔细核对要结算的记录！',
														function(btn) {
															if (btn == 'yes') {
																Ext.Msg
																		.wait(
																				"请等候",
																				"保存数据",
																				"保存数据进行中...");
																				
																Ext.Ajax
																		.request({
																			url : 'produce/officeBooking!save',
																			timeout : 60000,
																			params : {
																				extJson : '{id:'
																						+ balanceForm
																								.down(
																										'#id')
																								.getValue()
																						+ ',balance:true,'
																						+ 'balanceTime:\''+ balanceForm
																								.down(
																										'#balanceTime')
																								.getValue()
																						+ '\'}'

																			},
																			method : 'post',
																			success : function(
																					response) {
																				var responseText = response.responseText;
																				if (responseText
																						.indexOf('topit_ext_id!') != 0) {
																					Ext.Msg
																							.alert(
																									'错误',
																									(response.responseText));
																				} else {
																					Ext.Msg
																							.alert(
																									'恭喜',
																									"订单已成功结算!",
																									function() {

																										sm
																												.getLastSelected()
																												.set(
																														'balance',
																														true);
																										//saveForm.updateRecord();
																										grid.getStore().remove(sm.getLastSelected());
																										balanceWin.hide();
																									});
																				}
																			},
																			failure : function(
																					response) {
																				Ext.Msg
																						.alert(
																								'错误',
																								(response.responseText));
																			}
																		});
															}
														});
									}///
								},	
								{
									text : '取消结算',
									itemId : 'btnCancelBalance',
									handler : function() {
										Ext.MessageBox
												.confirm(
														'订单取消结算',
														'您是否确认取消结算此订单，请仔细核对要取消结算的记录！',
														function(btn) {
															if (btn == 'yes') {
																Ext.Msg
																		.wait(
																				"请等候",
																				"保存数据",
																				"保存数据进行中...");
																				
																Ext.Ajax
																		.request({
																			url : 'produce/officeBooking!save',
																			timeout : 60000,
																			params : {
																				extJson : '{id:'
																						+ balanceForm
																								.down(
																										'#id')
																								.getValue()
																						+ ',balance:false,'
																						+ 'balanceTime:\'\'}'

																			},
																			method : 'post',
																			success : function(
																					response) {
																				var responseText = response.responseText;
																				if (responseText
																						.indexOf('topit_ext_id!') != 0) {
																					Ext.Msg
																							.alert(
																									'错误',
																									(response.responseText));
																				} else {
																					Ext.Msg
																							.alert(
																									'恭喜',
																									"订单已成功取消结算!",
																									function() {

																										sm
																												.getLastSelected()
																												.set(
																														'balance',
																														false);
																										//saveForm.updateRecord();								
																										balanceWin.hide();
																									});
																				}
																			},
																			failure : function(
																					response) {
																				Ext.Msg
																						.alert(
																								'错误',
																								(response.responseText));
																			}
																		});
															}
														});
									}
									
									///
								}, {
									text : '关闭',
									itemId : 'btnClose',
									handler : function() {
										this.up('window').hide();
									}
								} ]
					});
</script>

<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	//var formPass;
	var o;
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
									name : 'areaName',
									hidden : true
								},
								{
									name : 'consumerId',
									hidden : true
								},
								{
									name : 'areaId',
									hidden : true
								},
								{
									name : 'buildingId',
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
												store : bookingStatusDs,
												itemId : 'status',
												name : 'status',
												fieldLabel : '<s:text name="vBooking.status"/>'
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'code',
												itemId : 'code',
												fieldLabel : '<s:text name="vBooking.code"/>'
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'bookingTime',
												itemId : 'bookingTime',
												fieldLabel : '<s:text name="vBooking.bookingTime"/>'
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
												name : 'buildingName',
												itemId : 'buildingName',
												fieldLabel : '<s:text name="vBooking.buildingName"/>'
											},
											{
												flex : 1,
												allowBlank : false,
												name : 'cityName',
												itemId : 'cityName',
												fieldLabel : '<s:text name="vBooking.cityName"/>'
											},
											{
												xtype : 'container',
												layout : 'hbox',
												defaultType : 'textfield',
												items : [ {
													flex : 1,
													name : 'persons',
													itemId : 'persons',
													fieldLabel : '<s:text name="vBooking.persons"/>'
												} ]
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
												name : 'consumerName',
												itemId : 'consumerName',
												fieldLabel : '<s:text name="vBooking.consumerName"/>'
											},
											{
												flex : 1,
												name : 'tel',
												itemId : 'tel',
												fieldLabel : '<s:text name="vBooking.tel"/>'
											},
											{
												flex : 1,
												name : 'email',
												itemId : 'email',
												fieldLabel : '<s:text name="vBooking.email"/>'
											} ]
								},
								{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [{
											flex : 1,
											xtype : 'fieldcontainer',
											layout: 'hbox', 
											defaultType : 'textfield',
											items:[
												{
													flex :3,
													allowBlank : false,
													name : 'originalCost',
													itemId : 'originalCost',
													fieldLabel : '<s:text name="vBooking.originalCost"/>'
												},
												{
													flex : 2,
													labelWidth : 50,
													itemId : 'deposit',
													name : 'deposit',
													fieldLabel : '<s:text name="vBooking.deposit"/>'
												}
											 ]}
											,	
											{
												flex : 1,
												allowBlank : false,
												regex:/^\d+$/,
												regexText:'请输入正确的数据类型',
												name : 'total',
												id : 'total',
												fieldLabel : '<s:text name="vBooking.total"/>'
											},
											{
												flex : 1,
												name : 'amender',
												itemId:'amender',
												fieldLabel : '<s:text name="vBooking.amender"/>'
											} ,
											{
												name : 'amenderId',
												itemId:'amenderId',
												hidden : true
											}]
								},{
									xtype : 'container',
									layout : 'hbox',
									defaultType : 'textfield',
									items : [
											{
												flex : 1,
												allowBlank : false,
												name : 'amendTime',
												itemId : 'amendTime',
												//xtype:'datetimefield',
												//format: 'Y-m-d',
												fieldLabel : '<s:text name="vBooking.amendTime"/>'
											},
											{
												flex : 1,
												name : 'balanceTime',
												itemId : 'balanceTime',
												fieldLabel : '<s:text name="booking.balanceTime"/>'
											},
											{
												flex : 1,
												name : 'balancePrice',
												itemId : 'balancePrice',
												fieldLabel : '<s:text name="booking.balancePrice"/>'
											} ]
								}  , tabs ],
						buttons : [{
									text : '保存',
									itemId : 'btnSave',
									handler : function() {
									var saveForm = this.up('form');
									if (saveForm.getForm().isValid()) {
										saveVBookingFromToDB(saveForm, 'produce/booking!save',grid);
									}
								}
							},
								{
									text : '退回',
									hidden : true,
									itemId : 'btnRefuse',
									handler : fromReturn
								},
								{
									text : '结算',
									hidden : true,
									itemId : 'btnBalance',
									handler : formBalance
								},{
									text : '入住登记',
									hidden : true,
									itemId : 'btnExecute',
									handler : formExecute
								}, {
									text : '关闭',
									itemId : 'btnClose',
									handler : function() {
										this.up('window').hide();
									}
								} ]
					});
</script>

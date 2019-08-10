//   根据当前时间和随机数生成流水号
function randomNumber() {
	var now = new Date()
	var month = now.getMonth() + 1
	var day = now.getDate()
	var hour = now.getHours()
	var minutes = now.getMinutes()
	var seconds = now.getSeconds()
	return now.getFullYear().toString() + month.toString() + day + hour + minutes + seconds + (Math.round(Math.random() * 89 + 100)).toString()
}
function updateStatus(url,rec,title,content,status,succeedContent) {
	var id = rec.get("id");
	var timestamp = (new Date()).getTime();
	Ext.MessageBox.buttonText.yes = '是'
	Ext.MessageBox.confirm(title, content, function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : url,
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',status:'
							+ status
							+',updateTime:'
							+ timestamp
							+ ',data:'
							+ Ext.JSON.encode(rec.data)
							+ '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', succeedContent, function() {
							grid.getStore().load();								
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});
}
function setSummary(){
	var btn=Ext.create('Ext.Button', {
		id:'orderSum',
	    text: ' '
	});
	return btn;
}

function setTotal(status,bookingTime,buildingName,code,consumerName){
	Ext.Ajax.request({
		        type: "post",//数据发送的方式（post 或者 get）
		        url: "produce/vBooking!getTotal",//要发送的后台地址
		        params: {"status":status,
		        	     "bookingTime":bookingTime,
		        	     "buildingName":buildingName,
		        	     "code":code,
		        	     "consumerName":consumerName},
		        dataType: "json",//后台处理后返回的数据格式
		        success: function (datas) {
			    var responseText=Ext.decode(datas.responseText);
			    var tl=0;
			    for(var i=0;i<responseText.records.length;i++){
			    	tl+=(responseText.records[i]);
			    	tl=Math.round(parseFloat(tl)*100)/100;
			    }
			    Ext.getCmp("orderSum").setText("总价合计:"+tl);
				},
		        error: function (msg) {//ajax请求失败后触发的方法
			        alert("请求失败:"+msg);//弹出错误信息
			      }
	})
}

function gridBalance() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
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
						url : 'produce/booking!save',
						timeout : 60000,
						params : {
							extJson : '{id:'
								+ id
								+ ',status:'
								+ bookingStatusDs
								.findRecord(
										'text',
								'已结算')
								.get(
								'value')
								+ '}'
								
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
													'status',
													8);
											grid.getStore().remove(sm.getLastSelected());
											// saveForm.updateRecord();
											form
											.up(
											'window')
											.hide();
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
function gridPass() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox.confirm('订单审核', '您是否确认此订单，请仔细核对要审核的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/booking!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',status:'
							+ bookingStatusDs.findRecord('text', '已审批').get('value')
							+ '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单审批成功!", function() {
							sm.getLastSelected().set('status', 3);
							//saveForm.updateRecord();								
							saveForm.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});

}
function gridBack() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox.confirm('订单退回', '您是否确认退回此订单，请仔细核对记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/booking!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',status:'
							+ bookingStatusDs.findRecord('text', '已退回')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单退回成功!", function() {
							sm.getLastSelected().set('status', 4);
							//saveForm.updateRecord();								
							form.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});

}
function gridExecute() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox.confirm('订单执行', '您是否确认执行此订单，请仔细核对记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/booking!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',status:'
							+ bookingStatusDs.findRecord('text', '执行中')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单执行成功!", function() {
							sm.getLastSelected().set('status', 5);
							//saveForm.updateRecord();								
							form.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});

}
function gridSettled() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox.confirm('订单执行', '您是否确认执行此订单，请仔细核对记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/booking!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',status:'
							+ bookingStatusDs.findRecord('text', '执行中')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单执行成功!", function() {
							sm.getLastSelected().set('status', 5);
							//saveForm.updateRecord();								
							form.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});

}
//表单审批通过
function formPass() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('订单审核', '您是否确认此订单，请仔细核对要审核的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/booking!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',status:'
							+ bookingStatusDs.findRecord('text', '已审核')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单审批成功!", function() {
							sm.getLastSelected().set('status', 3);
							//saveForm.updateRecord();								
							saveForm.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});

}
function formBalance() {
		var saveForm = this.up('form');
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
											url : 'produce/booking!save',
											timeout : 60000,
											params : {
												extJson : '{id:'
														+ form.down('#id').getValue()
														+ ',status:'
														+ bookingStatusDs.findRecord('text','已结算').get('value')
														+ ',balanceTime:\''+ form.down('#balanceTime').getValue()
														+ '\',balancePrice:'+form.down('#balancePrice').getValue()
														+'}'

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
																						'status',
																						8);
																		grid.getStore().remove(sm.getLastSelected());
																		//saveForm.updateRecord();								
																		saveForm
																				.up(
																						'window')
																				.hide();
																	});
													setTotal(form.down('#status').getValue(),"","","","");//修改价格
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
function fromReturn() {
		var saveForm = this.up('form');
		Ext.MessageBox
				.confirm(
						'订单退回',
						'您是否确认退回此订单，请仔细核对退回的记录！',
						function(btn) {
							if (btn == 'yes') {
								Ext.Msg
										.wait(
												"请等候",
												"保存数据",
												"保存数据进行中...");
								Ext.Ajax
										.request({
											url : 'produce/booking!save',
											timeout : 60000,
											params : {
												extJson : '{id:'
														+ form
																.down(
																		'#id')
																.getValue()
														+ ',status:'
														+ bookingStatusDs
																.findRecord(
																		'text',
																		'已退回')
																.get(
																		'value')
														+ '}'

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
																	"订单已成功退回!",
																	function() {
																		sm
																				.getLastSelected()
																				.set(
																						'status',
																						4);
																		//saveForm.updateRecord();								
																		saveForm
																				.up(
																						'window')
																				.hide();
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
function formExecute() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('订单执行', '您是否确认此订单，请仔细核对要执行的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/booking!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#bookingId').getValue()
							+ ',status:'
							+ bookingStatusDs.findRecord('text', '执行中')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单执行成功!", function() {
							alert(form.down('#bookingId').getValue());
							sm.getLastSelected().set('status', 5);
							//saveForm.updateRecord();								
							saveForm.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});

}


function formSettled() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('订单执行', '您是否确认此订单，请仔细核对要执行的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/booking!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',status:'
							+ bookingStatusDs.findRecord('text', '执行中')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单执行成功!", function() {
							sm.getLastSelected().set('status', 5);
							//saveForm.updateRecord();								
							saveForm.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});

}
function formRegister(url,saveForm) {
	//var saveForm = this.up('form');
	Ext.MessageBox
			.confirm(
					'入驻登记',
					'您是否确认登记此条信息，请仔细核对要入驻登记的记录！',
					function(btn) {
						if (btn == 'yes') {
							Ext.Msg
									.wait(
											"请等候",
											"保存数据",
											"保存数据进行中...");
							Ext.Ajax
									.request({
										url : url,
										timeout : 60000,
										params : {
											extJson : '{id:'
													+ form.down('#id').getValue()
													+ ',state:'
													+ vBookingListStateDs.findRecord('text','已入驻').get('value')
													+ ',badge:'+ form.down('#badge').getValue()
													/*+ '\',balancePrice:'+form.down('#balancePrice').getValue()*/
													+'}'

										},
										method : 'post',
										success : function() {//alert(1);
											//var saveForm = this.up('form');
													Ext.Ajax.request({
														url : 'produce/booking!save',
														timeout : 60000,
														params : {
															extJson : '{id:'
																	+ form.down('#bookingId').getValue()
																	+ ',status:'
																	+ bookingStatusDs.findRecord('text', '执行中')
																			.get('value') + '}'
														},
														method : 'post',
														success : function(response) {
															var responseText = response.responseText;
															if (responseText.indexOf('topit_ext_id!') != 0) {
																alert(responseText);
																Ext.Msg.alert('错误', (response.responseText));
															} else {
																	sm.getLastSelected().set('status', 5);
															}
														},
														failure : function(response) {
															Ext.Msg.alert('错误', (response.responseText));
														}
													});
													Ext.Msg.alert('恭喜',"已入驻成功!",
															function() {
																sm.getLastSelected().set('state',5);
																grid.getStore().remove(sm.getLastSelected());
																saveForm.up('window').hide();
															});
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
function gridRegain() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox.confirm('活动恢复', '您是否恢复此活动到进行中，请仔细核对记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/marketing!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',status:'
							+ marketingStatusDs.findRecord('text', '进行中')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "活动执行成功!", function() {
							sm.getLastSelected().set('status', 2);
							grid.getStore().remove(sm.getLastSelected());
							//saveForm.updateRecord();								
							form.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});

}
function gridQuit() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox.confirm('活动停止', '您是否停止此活动，请仔细核对记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/marketing!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',status:'
							+ marketingStatusDs.findRecord('text', '暂停中')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "活动执行成功!", function() {
							sm.getLastSelected().set('status', 3);
							grid.getStore().remove(sm.getLastSelected());
							//saveForm.updateRecord();								
							form.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});
}
function gridOpen() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox.confirm('活动开始', '您是否开始此活动，若是开始此活动，则此活动的开始时间将变为当前时间，请仔细核对记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/marketing!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',status:'
							+ marketingStatusDs.findRecord('text', '进行中').get('value') 
							+ ',startTime:\''+Ext.Date.format(new Date(),'Y-m-d H:i:s')+'\'}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "操作成功!", function() {
							sm.getLastSelected().set('status', 2);
							//saveForm.updateRecord();
							grid.getStore().remove(sm.getLastSelected());
							form.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});
}

function gridDefer() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox
	.confirm(
			'活动延期',
			'您是否确认延期此活动，若是延期此活动，请修改活动结束时间！',
			function(btn) {
				if (btn == 'yes') {
					Ext.Msg
					.wait(
							"请等候",
							"保存数据",
					"保存数据进行中...");
					Ext.Ajax
					.request({
						url : 'produce/marketing!save',
						timeout : 60000,
						params : {
							extJson : '{id:'
								+ id
								+ ',status:'
								+ marketingStatusDs.findRecord('text', '进行中').get('value') 
								+ ',endTime:\''+Ext.Date.format(Ext.Date.add(new Date(form.down('#endTime').getValue())),'Y-m-d H:i:s')
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
										"活动已延期!",
										function() {
									sm.getLastSelected().set('status',2);
									grid.getStore().remove(sm.getLastSelected());
											// saveForm.updateRecord();
											form.up('window').hide();
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
function gridInvalid() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox.confirm('活动失效', '您是否把此活动设为无效，请仔细核对记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/marketing!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',statusBit:'
							+ marketingStatusBitDs.findRecord('text', '无效')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "操作成功!", function() {
							sm.getLastSelected().set('statusBit', 2);
							grid.getStore().remove(sm.getLastSelected());
							//saveForm.updateRecord();								
							form.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});
}
function gridEffective() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox.confirm('活动有效', '您是否把此活动设为有效，请仔细核对记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'produce/marketing!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ id
							+ ',statusBit:'
							+ marketingStatusBitDs.findRecord('text', '有效')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "操作成功!", function() {
							sm.getLastSelected().set('statusBit', 1);
							grid.getStore().remove(sm.getLastSelected());
							//saveForm.updateRecord();								
							form.up('window').hide();
						});
					}
				},
				failure : function(response) {
					Ext.Msg.alert('错误', (response.responseText));
				}
			});
		}
	});
}
//从ext form中保存记录（单条数据）,更新对应的grid,func:保存成功后的回调函数，用参数传入
function saveVBookingFromToDB(paramForm, url, paramGrid, func) {
	var saveFormJson = Ext.JSON.encode(paramForm.getForm().getValues());
	Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");
	Ext.Ajax.request({
		url : url,
		timeout : 60000,
		params : {
			extJson : saveFormJson
		},
		method : 'post',
		success : function(response) {
			var responseText = response.responseText;
			if (responseText.indexOf('topit_ext_id!') != 0) {
				Ext.Msg.alert('错误', (response.responseText));
			} else {
				Ext.Msg.alert('恭喜', "数据保存成功!", function() {
					if (paramForm.down('#id').getValue() == '') {
						// 新增记录
						paramForm.down('#id')
								.setValue(
										responseText.substring(13,
												responseText.length));						
						paramGrid.getStore().insert(0, paramForm.getValues());
						paramGrid.getStore().load();
					} else {
						paramForm.updateRecord();
						paramGrid.getStore().load();
					}
					paramForm.up('window').hide();
					paramGrid.getStore().load();
					if (typeof (func) != 'undefined')
						func();
					setTotal(paramForm.down('#status').getValue(),"","","","");//修改价格
				});
			}
		},

		failure : function(response) {
			Ext.Msg.alert('错误', (response.responseText));
		}
	});
}
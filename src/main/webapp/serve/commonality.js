function formCancel() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('订单取消', '您是否确认取消此订单，请仔细核对待支付的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'serve/vOrders!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',status:'
							+ vOrdersStatusDs.findRecord('text', '已取消')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单取消成功!", function() {
							sm.getLastSelected().set('status', 6);
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
function formDistribution() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('订单生产', '您是否确认此订单，请仔细核对要生产的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'serve/vOrders!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',status:'
							+ vOrdersStatusDs.findRecord('text', '待配送')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单生产成功!", function() {
							sm.getLastSelected().set('status', 2);
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
function formConduct() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('订单配送', '您是否确认此订单，请仔细核对要配送的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'serve/vOrders!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',status:'
							+ vOrdersStatusDs.findRecord('text', '配送中')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单配送中!", function() {
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
function formAccomplish() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('订单完成', '您是否确认此订单，请仔细核对要配送中的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'serve/vOrders!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',status:'
							+ vOrdersStatusDs.findRecord('text', '已完成')
									.get('value') + '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "订单已完成!", function() {
							sm.getLastSelected().set('status', 4);
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
function gridCancel() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox
	.confirm(
			'订单取消',
			'您是否确认取消此订单，请仔细核对待支付的记录！',
			function(btn) {
				if (btn == 'yes') {
					Ext.Msg
					.wait(
							"请等候",
							"保存数据",
					"保存数据进行中...");
					Ext.Ajax
					.request({
						url : 'serve/vOrders!save',
						timeout : 60000,
						params : {
							extJson : '{id:'
								+ id
								+ ',status:'
								+ vOrdersStatusDs
								.findRecord(
										'text',
								'已取消')
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
										"订单已取消!",
										function() {
											
											sm
											.getLastSelected()
											.set(
													'status',
													4);
											//grid.getStore().load();
											// saveForm.updateRecord();
											/*saveForm
											.up(
											'window')
											.hide();*/
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
function gridDistribution() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox
	.confirm(
			'订单生产',
			'您是否确认此订单，请仔细核对记录！',
			function(btn) {
				if (btn == 'yes') {
					Ext.Msg
					.wait(
							"请等候",
							"保存数据",
					"保存数据进行中...");
					Ext.Ajax
					.request({
						url : 'serve/vOrders!save',
						timeout : 60000,
						params : {
							extJson : '{id:'
								+ id
								+ ',status:'
								+ vOrdersStatusDs
								.findRecord(
										'text',
								'已生产')
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
										"订单已生产!",
										function() {
											
											sm
											.getLastSelected()
											.set(
													'status',
													2);
											//grid.getStore().load();
											// saveForm.updateRecord();
											/*saveForm
											.up(
											'window')
											.hide();*/
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
function gridConduct() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox
	.confirm(
			'订单配送',
			'您是否确认配送此订单，请仔细核对生产记录！',
			function(btn) {
				if (btn == 'yes') {
					Ext.Msg
					.wait(
							"请等候",
							"保存数据",
					"保存数据进行中...");
					Ext.Ajax
					.request({
						url : 'serve/vOrders!save',
						timeout : 60000,
						params : {
							extJson : '{id:'
								+ id
								+ ',status:'
								+ vOrdersStatusDs
								.findRecord(
										'text',
								'配送中')
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
										"订单配送中!",
										function() {
											
											sm
											.getLastSelected()
											.set(
													'status',
													3);
											//grid.getStore().load();
											// saveForm.updateRecord();
											/*saveForm
											.up(
											'window')
											.hide();*/
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
function gridAccomplish() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox
	.confirm(
			'完成订单',
			'您是否确认已完成此订单，请仔细核对要配送中的记录！',
			function(btn) {
				if (btn == 'yes') {
					Ext.Msg
					.wait(
							"请等候",
							"保存数据",
					"保存数据进行中...");
					Ext.Ajax
					.request({
						url : 'serve/vOrders!save',
						timeout : 60000,
						params : {
							extJson : '{id:'
								+ id
								+ ',status:'
								+ vOrdersStatusDs
								.findRecord(
										'text',
								'已完成')
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
										"订单待生产!",
										function() {
											
											sm
											.getLastSelected()
											.set(
													'status',
													5);
											// saveForm.updateRecord();
											/*saveForm
											.up(
											'window')
											.hide();*/
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
function gridDispose() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox
	.confirm(
			'提交处理',
			'您是否提交此服务，请仔细核对待处理的记录！',
			function(btn) {
				if (btn == 'yes') {
					Ext.Msg
					.wait(
							"请等候",
							"保存数据",
					"保存数据进行中...");
					Ext.Ajax
					.request({
						url : 'serve/serve!save',
						timeout : 60000,
						params : {
							extJson : '{id:'
								+ id
								+ ',state:'
								+ serveStateDs
								.findRecord(
										'text',
								'处理中')
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
										"提交处理完成!",
										function() {
											
											sm
											.getLastSelected()
											.set(
													'state',
													2);
											//grid.getStore().load();
											// saveForm.updateRecord();
											/*saveForm
											.up(
											'window')
											.hide();*/
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
function gridFinish() {
	var records = grid.getSelectionModel().getSelection();
	var id = records[0].get("id");
	Ext.MessageBox
	.confirm(
			'处理完成',
			'您是否确认此服务处理完成，请仔细核对处理中的记录！',
			function(btn) {
				if (btn == 'yes') {
					Ext.Msg
					.wait(
							"请等候",
							"保存数据",
					"保存数据进行中...");
					Ext.Ajax
					.request({
						url : 'serve/serve!save',
						timeout : 60000,
						params : {
							extJson : '{id:'
								+ id
								+ ',state:'
								+ serveStateDs
								.findRecord(
										'text',
								'已处理')
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
										"处理完成!",
										function() {
											
											sm
											.getLastSelected()
											.set(
													'state',
													3);
											//grid.getStore().load();
											// saveForm.updateRecord();
											/*saveForm
											.up(
											'window')
											.hide();*/
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
function formDispose() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('提交处理', '您是否提交此服务，请仔细核对待处理的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'serve/serve!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',state:'
							+ serveStateDs.findRecord('text', '处理中').get('value')
							+',memo:"'+form.down('#memo').getValue()+'"'
							+',amender:"'+form.down('#amender').getValue()+'"'
							+',result:"'+form.down('#result').getValue()+'"'
							+ '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "提交处理完成!", function() {
							sm.getLastSelected().set('state', 2);
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
function formFinish() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('处理完成', '您是否确认此服务处理完成，请仔细核对处理中的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'serve/serve!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',state:'
							+ serveStateDs.findRecord('text', '已处理').get('value')
							+',memo:"'+form.down('#memo').getValue()+'"'
							+',result:"'+form.down('#result').getValue()+'"'
							+ '}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "处理完成!", function() {
							sm.getLastSelected().set('state', 3);
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
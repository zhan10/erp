function formDispose() {//alert(1);
	var saveForm = this.up('form');
	Ext.MessageBox.confirm('处理完成', '您是否确认此订单处理完成，请仔细核对要执行处理的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'requirement/requirementBooking!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',status:'
							+ requirementBookingStatusDs.findRecord('text', '处理完成').get('value') 
							+ ',remark:\''
							+ form.down('#remark').getValue()
							+ '\'}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "需求处理完成!", function() {
							sm.getLastSelected().set('status', 2);
							//saveForm.updateRecord();
							sm.getLastSelected().set('remark', form.down('#remark').getValue())
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
function formConfirm() {//alert(1);
	var saveForm = this.up('form');
	var visitTime = saveForm.down('#visitTime').getValue();
	if(visitTime == null){
		return Ext.Msg.alert('错误', '参观时间不能为空！');
	}else{
		//var date = Ext.Date.add(new Date(visitTime), Ext.Date.HOUR, -8);
		visitTime = Ext.Date.format(visitTime,'Y-m-d H:i:s');
	}
	Ext.MessageBox.confirm('确定参观时间', '您是否确认参观时间，请仔细核对要执的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'order/vBookingVisit!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',state:'
							+ orderVisitDs.findRecord('text', '已确定').get('value')
							+ ',visitTime:\''
							+ visitTime
							+ '\',remark:\''
							+ form.down('#remark').getValue()
							+ '\'}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "确认参观时间完成!", function() {
							sm.getLastSelected().set('state', 1);
							//saveForm.updateRecord();
							sm.getLastSelected().set('visitTime', form.down('#visitTime').getValue())
							sm.getLastSelected().set('remark', form.down('#remark').getValue())
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
	Ext.MessageBox.confirm('参观完成', '您是否确认此订单参观完成，请仔细核对要执行的记录！', function(btn) {
		if (btn == 'yes') {
			Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
			Ext.Ajax.request({
				url : 'order/vBookingVisit!save',
				timeout : 60000,
				params : {
					extJson : '{id:'
							+ form.down('#id').getValue()
							+ ',state:'
							+ orderVisitDs.findRecord('text', '已完成').get('value') 
							+ ',opinion:\''
							+ saveForm.down('#opinion').getValue()
							+ '\'}'
				},
				method : 'post',
				success : function(response) {
					var responseText = response.responseText;
					if (responseText.indexOf('topit_ext_id!') != 0) {
						alert(responseText);
						Ext.Msg.alert('错误', (response.responseText));
					} else {
						Ext.Msg.alert('恭喜', "参观完成!", function() {
							sm.getLastSelected().set('state', 4);
							//saveForm.updateRecord();
							sm.getLastSelected().set('opinion', form.down('#opinion').getValue())
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
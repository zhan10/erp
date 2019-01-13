function delProductTypeFromDB(paramds, paramSm, url, func) {
		if (paramSm.getCount() < 1) {
			Ext.MessageBox.alert('提示', '请选择待删除的记录！');
		} else {
			Ext.MessageBox.confirm('删除记录', '您是否确认删除已选中的这' + paramSm.getCount()
					+ '条记录，此操作无法还原，请仔细核对要删除的记录！', function(btn) {
				if (btn == 'yes') {
					
					var delJsonStr = "";
					var r = paramSm.getSelection();
					for ( var i = 0; i < r.length; i++) {
						delJsonStr += r[i].data["id"] + ",";
					}
					delJsonStr = delJsonStr.substr(0, delJsonStr.length - 1);
					var arrSm = [];
					for(var i=0;i<r.length;i++){
						arrSm.push('a'+r[i].data["id"]);
						var itemobj = window.parent.parent.frames[1].Ext.getCmp(arrSm[i]);
						window.parent.parent.frames[1].item1.remove(itemobj);
					}
					for(var i=0;i<paramds.getCount();i++){}
					Ext.Ajax.request({
						url : url,
						timeout : 60000,
						params : {
							extJson : delJsonStr
						},
						method : 'post',
						success : function(response) {
							var responseText = response.responseText;
							if (responseText.indexOf('success!') != 0) {
								Ext.Msg.alert('错误', (response.responseText));
							} else {
								Ext.Msg.alert('恭喜', "成功删除"
										+ responseText.substring(8,
												responseText.length) + '条记录!',
										function() {
											for ( var i = 0; i < r.length; i++)
												paramds.remove(r[i]);
											if (typeof (func) != 'undefined')
												func();
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
	}
function saveProductTypeForm(paramForm,arr, url, paramGrid, func) {
	var saveFormJson = Ext.JSON.encode(paramForm.getForm().getValues());
	Ext.Msg.wait("请等候", "保存数据", "保存数据进行中...");
	Ext.Ajax.request({
		url : url,
		timeout : 60000,
		params : {
			list : arr,
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
						var id = paramForm.down('#id').getValue();
						var name = paramForm.down('#name').getValue();
						var itemAdd = {id:'a'+id,xtype:'label',html : '<br><a href="test/vProduct_manager?productId='+id+'" target="rightFrame"><img src="img/nav/mat5.png"  width=48,height=48/><br>'+name+'</a><br>'};
						window.parent.parent.frames[1].item1.add(itemAdd);
						paramGrid.getStore().insert(0, paramForm.getValues());
						paramGrid.getStore().load();
					} else {
						paramForm.updateRecord();
						paramGrid.getStore().load();
					}
					paramForm.up('window').hide();
					if (typeof (func) != 'undefined')
						func();
				});
			}
		},

		failure : function(response) {
			Ext.Msg.alert('错误', (response.responseText));
		}
	});
}
function setEquipment(){
	var equipments = (form.down('#equipment').getValue()+"").split(",");
	var equipment = [];
	for(var i=0;i<equipments.length;i++){
		equipment.push(eval(equipments[i]));
	}
	form.down('#equipment').setValue(equipment);
}
function setRoomNumber(){
	/*var roomNumbers = String(form.down('#roomNumber').getValue());
	var roomNumberArray = roomNumbers.substring(1, roomNumbers.length-1).split(",");*/
	var roomNumber = [];
	var roomNumberArray = (form.down('#roomNumber').getValue()+"").split(",");
	for(var i=0;i<roomNumberArray.length;i++){
		roomNumber.push(eval(roomNumberArray[i]));
	};
	var temp;
	for (var i = 0; i < roomNumber.length; i++) {
	    for (var j = i+1; j < roomNumber.length; j++) {
	         if (roomNumber[i] > roomNumber[j]) {
	             temp = roomNumber[i];
	             roomNumber[i] = roomNumber[j];
	             roomNumber[j] = temp;  // 两个数交换位置
	         }
	     }
	};
	form.down('#roomNumber').setValue(roomNumber);
}
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
			{itemId:'ordersCode',name:'ordersCode',hidden:true},
			{itemId:'status',name:'status',hidden:true},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						itemId:'name',
						name:'name',
						fieldLabel:'<s:text name="vErpOrders.name"/>'
					},{
						flex:1,
						allowBlank:false,
						name:'mobile',
						itemId:'mobile',
						fieldLabel:'<s:text name="vErpOrders.mobile"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'address',
						itemId:'address',
						fieldLabel:'<s:text name="vErpOrders.address"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex : 1,
						xtype : 'combo',
						displayField : 'name',
						valueField : 'id',
					    allowBlank : false,
						store : cb_users_ds,
						itemId:'uid',
						name : 'uid',
						fieldLabel : '<s:text name="vErpOrders.userName"/>',
						listeners : {
							select : function() {
								form.down('#code').setValue(this.findRecord('id',this.getValue()).get('code'));
							}
						}
					},{
						flex:1,
						allowBlank:false,
						itemId : 'code',
						name:'code',
						fieldLabel:'<s:text name="vErpOrders.code"/>'
					}
				]
			},{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						flex:1,
						allowBlank:false,
						name:'ordersMoney',
						fieldLabel:'<s:text name="vErpOrders.ordersMoney"/>'
					},{
						flex:1,
						allowBlank:false,
						itemId : 'cabinetQuantity',
						name:'cabinetQuantity',
						fieldLabel:'<s:text name="vErpOrders.cabinetQuantity"/>'
					}
				]
			},
			{
				xtype : 'container',
				layout : 'hbox',
				defaultType : 'textfield',
				items : [
					{
						xtype: 'textarea',
						flex : 1,
						name : 'memo',
						height:50,
						fieldLabel:'<s:text name="vErpOrders.memo"/>'
					}
				]
			},cabinet_grid
		],
		buttons : [ {
			text : '保存',
			itemId : 'btnSave',
			handler : function() {
				var saveForm = this.up('form');
				//用于判断是否可以提交
				var bl = true; 
				//表格数据
				var saveFormJson = saveForm.getForm().getValues();
				//柜子数据
				var jsonArray = new Array();
				for(var i=0;i<cabinet_ds.getCount();i++){
					var storeData = cabinet_ds.getAt(i).data;
					if(storeData.room==""||storeData.name==""||storeData.mainMater==""){
						Ext.Msg.alert('错误', '房间、柜体名称、主材不能为空');
						bl = false;
						return;
					}else{
						jsonArray.push(storeData);
					}
				}
				if(bl){
					//saveFormJson.status=6
					saveFormJson.cabinet=jsonArray
					if(saveForm.getForm().isValid()){
						saveDB(saveFormJson,saveForm ,'warehouse/erpwarehouse!save',grid);
						//alert(Ext.JSON.encode(saveFormJson))
					}	
				}
				
				/*
				//用于判断是否可以提交
				var bl = true; 
				var jsonArray = new Array();
				//订单id
				var id = saveForm.down('#id').getValue();
				//获取grid列表循环加上id
				for(var i=0;i<cabinet_ds.getCount();i++){
					var storeData = cabinet_ds.getAt(i).data;
					if(storeData.room==""||storeData.name==""||storeData.mainMater==""||storeData.decompose==""){
						Ext.Msg.alert('错误', '房间、柜体名称、主材、分解员不能为空');
						bl = false;
						return;
					}else{
						storeData["ordersId"]=id;
						jsonArray.push(storeData);
					}
				}
				if(bl){
					saveDB(jsonArray, saveForm,'comm/erpCabinet!save',grid);
					saveFormToDB(saveForm, 'produce/erpOrders!save',grid);
				}*/
			}
		}, {
		text : '关闭',
			itemId : 'btnClose',
			handler : function() {
				this.up('window').hide();
			}
			} ]
			});
	function saveDB(json,paramForm, url, paramGrid, func) {
		var saveFormJson = Ext.JSON.encode(json);
		//alert(saveFormJson)
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
						paramForm.up('window').hide();
						paramGrid.getStore().load();
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
</script>

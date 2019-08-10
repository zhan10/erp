<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : 'uid',dataIndex : 'uid',name : 'uid',width : 40,hidden : true}
		,{
			text : '<s:text name="vErpOrders.ordersCode" />',
			dataIndex:'ordersCode',
			name:'ordersCode',
			align : 'center',
			flex:1,
			renderer:function(val,record){
				var timestamp = (new Date()).getTime();
				var time=parseInt(record.record.data.updateTime)+259200000;
			
				if(time<timestamp){
					return '<span style="color:red">'+val+'</span>';
				}else{
					return '<span style="color:blue">'+val+'</span>';
				}
			}
		}
		,{
			text : '订单是否超时',
			dataIndex:'updateTime',
			name:'updateTime',
			align : 'center',
			flex:1,
			renderer : function(val) {
				var timestamp = (new Date()).getTime();
				var time = parseInt(val)+259200000;
				if(time<timestamp){
					return '<span style="color:red">超时</span>';
				}else{
					return '<span style="color:blue">未超时</span>';
				}
				
			}
		 }
		,{
			text : '<s:text name="vErpOrders.status" />',
			dataIndex:'status',
			name:'status',
			align : 'center',
			flex:1,
			renderer : function(val) {
				var ret = erpOrdersStatusDs.findRecord('value', val).get('text');
				return '<span style="color:blue">'+ret+'</span>';
			}
		 }
		,{text : '<s:text name="vErpOrders.name" />',dataIndex:'name',name:'name',align : 'center',flex:1}
		,{text : '<s:text name="vErpOrders.mobile" />',dataIndex:'mobile',name:'mobile',align : 'center',flex:1}
		,{text : '<s:text name="vErpOrders.address" />',dataIndex:'address',name:'address',align : 'center',flex:1}
		,{text : '<s:text name="vErpOrders.userName" />',dataIndex:'userName',name:'userName',align : 'center',flex:1}
		,{text : '<s:text name="vErpOrders.code" />',dataIndex:'code',name:'code',align : 'center',flex:1}
		,{text : '<s:text name="vErpOrders.ordersMoney" />',dataIndex:'ordersMoney',name:'ordersMoney',align : 'center',flex:1}
		,{text : '<s:text name="vErpOrders.cabinetQuantity" />',dataIndex:'cabinetQuantity',name:'cabinetQuantity',align : 'center',flex:1}
		,{text : '<s:text name="vErpOrders.memo" />',dataIndex:'memo',name:'memo',align : 'center',hidden : true,flex:1}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	} ,{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[{
			icon:'img/toolbar/post_go.gif',
			tooltip:'计划管理',
			handler : function(grid, rowIndex, colIndex) {
				var rec = grid.getStore().getAt(rowIndex);	
				var metals = getMetals(rec.get("id"))
				//存放不足的库存
				var d = "";
				for(var i=0;i<metals.sum;i++){
					//需要使用的材料数量
					var number =  metals.records[i].number
					//查询原材料所剩库存
					var mater = getMater(metals.records[i].materid)
					//原材料名称
					var materName = mater.records[0].matername
					//当前库存
					var materAtct = mater.records[0].atct
					if(number>materAtct){
						d += materName+","
					}
				}
				//提示标题
				var t = "库存不足";
				//提示内容
				var c = d+"以上库存物料不充足，请尽快安排采购。";
				//提示按钮
				var b = "强制排产";
				if(d.length<=0){
					t = "发送订单";
					c = "确认进行流程操作吗？（此操作无法撤回）"
					b = "是"
				}
				Ext.MessageBox.buttonText.yes = b
				Ext.MessageBox.confirm(t, c, function(btn) {
					if (btn == 'yes') {
						Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
						for(var i=0;i<metals.sum;i++){
							//需要使用的材料数量
							var number =  metals.records[i].number
							//查询原材料所剩库存
							var mater = getMater(metals.records[i].materid)
							//当前库存
							var materAtct = mater.records[0].atct
							Ext.Ajax.request({
								url : 'warehouse/erpOrders!updateAtct',
								timeout : 60000,
								params : {
									atct : materAtct-number,
									materid:metals.records[i].materid
								},
								async: false,
								method : 'post',
								success : function(response) {
									var responseText = response.responseText;
								},
								failure : function(response) {
									Ext.Msg.alert('错误', (response.responseText));
								}
							});
						}
						
						var status = erpOrdersStatusDs.findRecord('text', '制造中').get('value')
						var id = rec.get("id");
						var timestamp = (new Date()).getTime();
						Ext.Ajax.request({
							url : "warehouse/erpOrders!save",
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
									Ext.Msg.alert('恭喜', "发送成功", function() {
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
				/*var status = erpOrdersStatusDs.findRecord('text', '待排产').get('value')
				updateStatus("factory/erpOrders!save",rec,'发送计划','您是否确认发送此订单到计划管理，请仔细核对订单！',status,"订单发送成功!")*/
				/*if(rec.get("status")==2){
					var status = erpOrdersStatusDs.findRecord('text', '财务审核').get('value')
					updateStatus("warehouse/erpOrders!save",rec,'发送财务审核','您是否确认发送此订单到财务审核，请仔细核对订单！',status,"订单发送成功!")
				}else{
					var status = erpOrdersStatusDs.findRecord('text', '财务二审').get('value')
					updateStatus("warehouse/erpOrders!save",rec,'发送财务二审','您是否确认发送此订单到财务二审，请仔细核对订单！',status,"订单发送成功!")
				}*/
			}
		},{
			icon:'img/toolbar/drop-no.gif',
			tooltip:'Pass',
			handler : function(grid, rowIndex, colIndex) {
				var rec = grid.getStore().getAt(rowIndex);	
				var status = erpOrdersStatusDs.findRecord('text', '待排产').get('value')
				updateStatus("warehouse/erpOrders!save",rec,'驳回','您是否确认驳回此订单至待排产，请仔细核对订单！',status,"订单驳回成功!")
				/*if(rec.get("status")==2){
					var status = erpOrdersStatusDs.findRecord('text', '财务审核').get('value')
					updateStatus("plan/erpOrders!save",rec,'发送财务审核','您是否确认发送此订单到财务审核，请仔细核对订单！',status,"订单发送成功!")
				}else{
					var status = erpOrdersStatusDs.findRecord('text', '财务二审').get('value')
					updateStatus("plan/erpOrders!save",rec,'发送财务二审','您是否确认发送此订单到财务二审，请仔细核对订单！',status,"订单发送成功!")
				}*/
			}
		}]
	}];
	function getMetals(id){
		var json;
		Ext.Ajax.request({
			url : 'resolve/erpMetals!managerExt',
			timeout : 60000,
			params : {
				whereSql : ' and ordersId='+id
			},
			async: false,
			method : 'post',
			success : function(response) {
				var responseText = response.responseText;
				json = Ext.decode(responseText)
				//alert(responseText)
				/* Ext.MessageBox.confirm("库存不足", "asdfasdf", function(btn) {
					if (btn == 'yes') {
						Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
						
					}
				}); */
			},
			failure : function(response) {
				Ext.Msg.alert('错误', (response.responseText));
			}
		});
		return json
	}
	function getMater(materid){
		var json;
		Ext.Ajax.request({
			url : 'mater/mater!managerExt',
			timeout : 60000,
			params : {
				whereSql : ' and materid='+materid
			},
			async: false,
			method : 'post',
			success : function(response) {
				var responseText = response.responseText;
				json = Ext.decode(responseText)
				//alert(responseText)
				/* Ext.MessageBox.confirm("库存不足", "asdfasdf", function(btn) {
					if (btn == 'yes') {
						Ext.Msg.wait('请等候', '保存数据', '保存数据进行中...');
						
					}
				}); */
			},
			failure : function(response) {
				Ext.Msg.alert('错误', (response.responseText));
			}
		});
		return json
	}
	var mainColumns = columnOperators.concat(mainFields);
</script>

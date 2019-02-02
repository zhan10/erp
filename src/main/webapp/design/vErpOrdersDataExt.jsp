<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : 'uid',dataIndex : 'uid',name : 'uid',width : 40,hidden : true}
		,{text : '<s:text name="vErpOrders.ordersCode" />',dataIndex:'ordersCode',name:'ordersCode',align : 'center',flex:1}
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
			tooltip:'财务审核',
			handler : function(grid, rowIndex, colIndex) {
				var rec = grid.getStore().getAt(rowIndex);	
				if(rec.get("status")==2){
					var status = erpOrdersStatusDs.findRecord('text', '财务审核').get('value')
					updateStatus("design/erpOrders!save",rec,'发送财务审核','您是否确认发送此订单到财务审核，请仔细核对订单！',status,"订单发送成功!")
				}else{
					Ext.Msg.alert('错误', '操作错误，不能进行该操作！');
				}
			}
		}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

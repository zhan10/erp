<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : 'uid',dataIndex : 'uid',name : 'uid',width : 40,hidden : true}
		,{text : '<s:text name="vErpOrders.ordersCode" />',dataIndex:'ordersCode',name:'ordersCode',align : 'center',flex:1}
		,{text : '<s:text name="vErpOrders.status" />',dataIndex:'status',name:'status',align : 'center',flex:1}
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
	}/* ,{
		xtype:'actioncolumn',
		locked:true,
		width:50,
		items:[ {
			icon:'img/toolbar/edit.gif',
			tooltip:'修改',
			handler : function(grid, rowIndex, colIndex) {
				//sm.select(rowIndex);
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'product/erpOrders!delete');
		}
	}]
	} */];
	var mainColumns = columnOperators.concat(mainFields);
</script>

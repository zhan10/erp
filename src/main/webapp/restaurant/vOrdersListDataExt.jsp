<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vOrdersList.numbers" />',dataIndex:'numbers',name:'numbers',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.total" />',dataIndex:'total',name:'total',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.memo" />',dataIndex:'memo',name:'memo',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.recipeName" />',dataIndex:'recipeName',name:'recipeName',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.consumerName" />',dataIndex:'consumerName',name:'consumerName',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.address" />',dataIndex:'address',name:'address',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.arrTime" />',dataIndex:'arrTime',name:'arrTime',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="vOrdersList.ordersTime" />',dataIndex:'ordersTime',name:'ordersTime',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="vOrdersList.recipeId" />',dataIndex:'recipeId',name:'recipeId',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.bookingId" />',dataIndex:'bookingId',name:'bookingId',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.ordersId" />',dataIndex:'ordersId',name:'ordersId',align : 'center',width:100}
		,{text : '<s:text name="vOrdersList.status" />',dataIndex:'status',name:'status',align : 'center',width:100}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	},{
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'restaurant/ordersList!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

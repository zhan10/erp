<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="orders.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100}
		,{text : '<s:text name="orders.bookingId" />',dataIndex:'bookingId',name:'bookingId',align : 'center',width:100}
		,{text : '<s:text name="orders.ordersTime" />',dataIndex:'ordersTime',name:'ordersTime',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="orders.status" />',dataIndex:'status',name:'status',align : 'center',width:100}
		,{text : '<s:text name="orders.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100}
		,{text : '<s:text name="orders.total" />',dataIndex:'total',name:'total',align : 'center',width:100}
		,{text : '<s:text name="orders.address" />',dataIndex:'address',name:'address',align : 'center',width:100}
		,{text : '<s:text name="orders.arrTime" />',dataIndex:'arrTime',name:'arrTime',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="orders.memo" />',dataIndex:'memo',name:'memo',align : 'center',width:100}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'restaurant/ders!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="ordersList.ordersId" />',dataIndex:'ordersId',name:'ordersId',align : 'center',width:100}
		,{text : '<s:text name="ordersList.recipeId" />',dataIndex:'recipeId',name:'recipeId',align : 'center',width:100}
		,{text : '<s:text name="ordersList.numbers" />',dataIndex:'numbers',name:'numbers',align : 'center',width:100}
		,{text : '<s:text name="ordersList.total" />',dataIndex:'total',name:'total',align : 'center',width:100}
		,{text : '<s:text name="ordersList.memo" />',dataIndex:'memo',name:'memo',align : 'center',width:100}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'restaurant/dersList!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

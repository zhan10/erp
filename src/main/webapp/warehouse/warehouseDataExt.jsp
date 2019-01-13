<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="warehouse.serialNumber" />',dataIndex:'serialNumber',name:'serialNumber',align : 'center',width:100}
		,{
			text : '<s:text name="warehouse.type" />',
			dataIndex:'type',
			name:'type',
			align : 'center',
			width:100,
			renderer : function(val) {
				return warehouseTypeDs.findRecord('value', val).get('text');
			}
		}
		,{text : '<s:text name="warehouse.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="warehouse.remarks" />',dataIndex:'remarks',name:'remarks',align : 'center',flex:1}
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
				var rec = grid.getStore().getAt(rowIndex);	
				editWinByRec(win, winTitle+'——修改', rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'warehouse/warehouse!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

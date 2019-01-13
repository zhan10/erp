<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="booking.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100}
		,{text : '<s:text name="booking.code" />',dataIndex:'code',name:'code',align : 'center',width:100}
		,{text : '<s:text name="booking.persons" />',dataIndex:'persons',name:'persons',align : 'center',width:100}
		,{text : '<s:text name="booking.bookingTime" />',dataIndex:'bookingTime',name:'bookingTime',align : 'center',width:100}
		,{text : '<s:text name="booking.status" />',dataIndex:'status',name:'status',align : 'center',width:100}
		,{text : '<s:text name="booking.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'produce/oking!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

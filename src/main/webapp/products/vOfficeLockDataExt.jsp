<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vOfficeLock.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:200}
		,{text : '<s:text name="vOfficeLock.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:200}
		,{text : '<s:text name="vOfficeLock.productName" />',dataIndex:'productName',name:'productName',align : 'center',width:200}
		,{
			text : '<s:text name="vOfficeLock.lockFrom" />',
			dataIndex:'lockFrom',
			name:'lockFrom',
			align : 'center',
			width:200,
			xtype: 'datecolumn', 
			convert: convertDate
		 }
		,{
			text : '<s:text name="vOfficeLock.lockTo" />',
			dataIndex:'lockTo',
			name:'lockTo',
			align : 'center',
			width:100,
			xtype: 'datecolumn', 
			convert: convertDate,
			flex:1
		 }
		,{text : '<s:text name="vOfficeLock.productId" />',dataIndex:'productId',name:'productId',align : 'center',width:100,hidden:true}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'products/officeLock!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

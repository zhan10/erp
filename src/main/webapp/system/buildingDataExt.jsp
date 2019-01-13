<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="building.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="building.areaId" />',dataIndex:'areaId',name:'areaId',align : 'center',width:100}
		,{text : '<s:text name="building.circleId" />',dataIndex:'circleId',name:'circleId',align : 'center',width:100}
		,{text : '<s:text name="building.intro" />',dataIndex:'intro',name:'intro',align : 'center',width:100}
		,{text : '<s:text name="building.traffic" />',dataIndex:'traffic',name:'traffic',align : 'center',width:100}
		,{text : '<s:text name="building.pic" />',dataIndex:'pic',name:'pic',align : 'center',width:100}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'system/ilding!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : 'matetypeid',dataIndex : 'matetypeid',name : 'matetypeid',width : 40,hidden : true}
		,{text : '<s:text name="vInventory.materid" />',dataIndex : 'materid',name : 'materid',align : 'center',width : 100,flex:1}
		,{text : '<s:text name="vInventory.matername" />',dataIndex : 'matername',name : 'matername',align : 'center',width : 100,flex:1}
		,{
			text : '<s:text name="vInventory.type" />',
			dataIndex:'type',
			name:'type',
			align : 'center',
			width:100,
			flex:1,
			renderer : function(val) {
				if(val==1){
					return "入库";
				}else{
					return "出库";
				}
			}
		 }
		,{
			text : '<s:text name="vInventory.updateTime" />',
			dataIndex:'updateTime',
			name:'updateTime',
			align : 'center',
			width:150,
			convert : function(val){
				if(val == null){
					return val;
				}else{
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			}
		 }
		,{text : '<s:text name="vInventory.quantities" />',dataIndex:'quantities',name:'quantities',align : 'center',width:100,flex:1}
		,{text : '<s:text name="vInventory.principal" />',dataIndex:'principal',name:'principal',align : 'center',width:100,flex:1}
	];
	/* var columnOperators = [{
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'inventory/vInventory!delete');
		}
	}]
	}]; 
	var mainColumns = columnOperators.concat(mainFields);*/
	var mainColumns = mainFields;
</script>

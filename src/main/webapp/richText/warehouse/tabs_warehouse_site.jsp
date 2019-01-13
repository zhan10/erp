<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var warehouseSite_Fields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{
			text : '<s:text name="warehouseSite.wName" />',
			dataIndex:'wid',
			name:'wid',
			align : 'center',
			width:100,
			renderer : function(val) {
				return cb_warehouse_ds.findRecord('id', val).get('name');
			}
		}
		,{text : '<s:text name="warehouseSite.serialNumber" />',dataIndex:'serialNumber',name:'serialNumber',align : 'center',width:100}
		,{text : '<s:text name="warehouseSite.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="warehouseSite.remarks" />',dataIndex:'remarks',name:'remarks',align : 'center',flex:1}
	];
	var columnOperatorsSite = [{
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
				editWinByRec(siteWin, winTitle+'——库位修改', rec);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'warehouse/warehouseSite!delete');
		}
	}]
	}];
	var mainColumnsSite = columnOperatorsSite.concat(warehouseSite_Fields);
	
	var warehouseSite_ds = getDs(warehouseSite_Fields, 'warehouse/warehouseSite!managerExt', '',' order by id desc');
	warehouseSite_ds.pageSize=999;
	
	var warehouseSite_grid= Ext.create('Ext.grid.Panel', {
		id : 'warehouseSite_grid',
		store : warehouseSite_ds,
		margin : "5",
		//tbar : meetingRoom_tbar,		
		columns :  mainColumnsSite,
		columnLines : true,
		flex:1
	});
	
   
</script>

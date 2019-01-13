<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="vFloorLock.cityName" />',dataIndex:'cityName',name:'cityName',align : 'center',width:150,hidden:true}
		,{text : '<s:text name="vFloorLock.buildingName" />',dataIndex:'buildingName',name:'buildingName',align : 'center',width:150}
		,{text : '<s:text name="vFloorLock.floorName" />',dataIndex:'floorName',name:'floorName',align : 'center',width:150}
		,{
			text : '<s:text name="vFloorLock.lockFrom" />',
			dataIndex:'lockFrom',
			name:'lockFrom',
			align : 'center',
			width:300,
			convert : function(val){
				//var date = new Date(val);
				if(val == null){
					return val;
				}else{
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, 0);
				return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			}
		 }
		,{
			text : '<s:text name="vFloorLock.lockTo" />',
			dataIndex:'lockTo',
			name:'lockTo',
			align : 'center',
			width:150,
			convert : function(val){
				//var date = new Date(val);
				if(val == null){
					return val;
				}else{
				var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, 0);
				return Ext.Date.format(date,'Y-m-d H:i:s');
				}
			},
			flex:1
		 }
		,{text : '<s:text name="vFloorLock.floorId" />',dataIndex:'floorId',name:'floorId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vFloorLock.cityId" />',dataIndex:'cityId',name:'cityId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vFloorLock.buildingId" />',dataIndex:'buildingId',name:'buildingId',align : 'center',width:100,hidden:true}
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
				Ext.apply(cb_floors_ds.proxy.extraParams,{whereSql : ' and buildingId='+rec.get('buildingId')});
				cb_floors_ds.loadPage(1);
			}
		},{
			iconCls:'delete', 
			tooltip:'删除',
			handler : function(grid, rowIndex, colIndex) {
				grid.getSelectionModel().select(rowIndex);
				delFromDB(grid.getStore(), grid.getSelectionModel(),'visit/floorLock!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

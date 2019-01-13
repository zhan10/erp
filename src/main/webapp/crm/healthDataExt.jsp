<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="health.userId" />',dataIndex:'userId',name:'userId',align : 'center',width:100,hidden:true}
		,{text : '<s:text name="vHealth.name" />',dataIndex:'name',name:'name',align : 'center',width:100}
		,{text : '<s:text name="health.checkedTime" />',dataIndex:'checkedTime',name:'checkedTime',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="health.height" />',dataIndex:'height',name:'height',align : 'center',width:100}
		,{text : '<s:text name="health.weight" />',dataIndex:'weight',name:'weight',align : 'center',width:100}
		,{text : '<s:text name="health.diastolicPressure" />',dataIndex:'diastolicPressure',name:'diastolicPressure',align : 'center',width:100}
		,{text : '<s:text name="health.systolicPressure" />',dataIndex:'systolicPressure',name:'systolicPressure',align : 'center',width:100}
		,{text : '<s:text name="health.bodyFatRatio" />',dataIndex:'bodyFatRatio',name:'bodyFatRatio',align : 'center',width:100}
		,{text : '<s:text name="health.oxygenSaturation" />',dataIndex:'oxygenSaturation',name:'oxygenSaturation',align : 'center',width:100}
		,{text : '<s:text name="health.pulse" />',dataIndex:'pulse',name:'pulse',align : 'center',flex:1}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'crm/alth!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

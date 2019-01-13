<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="printRate.printFormat" />',dataIndex:'printFormat',name:'printFormat',align : 'center',flex:100,
			 renderer : function(val) {
				try {
					var ret = printFormatDs.findRecord('value', val).get('text');
					return ret;
					} catch (e) {
				}
			}} 	
		,{text : '<s:text name="printRate.paperFormat" />',dataIndex:'paperFormat',name:'paperFormat',align : 'center',flex:100,
			 renderer : function(val) {
				try {
					var ret = paperFormatDs.findRecord('value', val).get('text');
					return ret
					} catch (e) {
				}
			}} 
		,{text : '<s:text name="printRate.chargeUnit" />',dataIndex:'chargeUnit',name:'chargeUnit',align : 'center',flex:100,hidden:true}
		,{text : '<s:text name="printRate.chargeType" />',dataIndex:'chargeType',name:'chargeType',align : 'center',flex:100,
			renderer : function(val) {
				try {
					var ret = chargeTypesDs.findRecord('value', val).get('text');
					return ret;
					} catch (e) {
				}
			}} 	
		,{text : '<s:text name="printRate.price" />',dataIndex:'price',name:'price',align : 'center',flex:100}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'serve/printRate!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>

<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="printStatistics.printTime" />',
			dataIndex:'printTime',
			name:'printTime',
			align : 'center',
			flex:100,
			convert : function(val){
				//var date = new Date(val);
				if(val == null){
					return val;
				}else{
					var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
					return Ext.Date.format(date,'Y-m-d');
				}
			}
			}
		,{text : '<s:text name="printStatistics.printUser" />',dataIndex:'printUser',name:'printUser',align : 'center',flex:100,
			convert : function(val) {
				try {
					var ret = cb_consumer_ds.findRecord('id', val).get('name');
					return ret;
				} catch (e) {
				}
			}}
		,{text : '<s:text name="vPrintRecord.cardNumber" />',dataIndex:'cardNumber',name:'cardNumber',align : 'center',flex:100}
		,{text : '<s:text name="printStatistics.printFormat" />',dataIndex:'printFormat',name:'printFormat',align : 'center',flex:100,
			renderer : function(val) {
				try {
					var ret = printFormatDs.findRecord('value', val).get('text');
					return ret;
					} catch (e) {
				}
			}} 	
		,{text : '<s:text name="printStatistics.paperFormat" />',dataIndex:'paperFormat',name:'paperFormat',align : 'center',flex:100,
			renderer : function(val) {
				try {
					var ret = paperFormatDs.findRecord('value', val).get('text');
					return ret
					} catch (e) {
				}
			}} 		
		,{text : '<s:text name="printStatistics.printCount" />',dataIndex:'printCount',name:'printCount',align : 'center',flex:100}
		,{text : '<s:text name="printStatistics.price" />',dataIndex:'price',name:'price',align : 'center',flex:100}
		,{text : '<s:text name="printStatistics.priceTotal" />',dataIndex:'priceTotal',name:'priceTotal',align : 'center',flex:100}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	},/* {
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'serve/printStatistics!delete');
		} 
	}]*/
	];
	var mainColumns = columnOperators.concat(mainFields);
</script>

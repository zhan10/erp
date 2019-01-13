<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',align : 'center',width : 50,hidden : true}
		,{text : '<s:text name="receipt.timeEntry" />',dataIndex:'timeEntry',name:'timeEntry',align : 'center',width:200,convert : function(val){
			var date = Ext.Date.add(new Date(val), Ext.Date.HOUR, -8);
			return Ext.Date.format(date,'Y-m-d H:i:s');
		}}
		,{text : '<s:text name="receipt.accountNumber" />',dataIndex:'accountNumber',name:'accountNumber',align : 'center',width:100}
		,{text : '<s:text name="receipt.outTradeNo" />',dataIndex:'outTradeNo',name:'outTradeNo',align : 'center',width:100}
		,{text : '<s:text name="receipt.tradeNo" />',dataIndex:'tradeNo',name:'tradeNo',align : 'center',width:100}
		,{text : '<s:text name="receipt.city" />',dataIndex : 'city',name : 'city',align : 'center',width : 100}
		,{text : '<s:text name="receipt.serviceItems" />',dataIndex:'serviceItems',name:'serviceItems',align : 'center',width:100}
		,{text : '<s:text name="receipt.productName" />',dataIndex:'productName',name:'productName',align : 'center',width:100}
		,{text : '<s:text name="receipt.price" />',dataIndex:'price',name:'price',align : 'center',width:100}
		,{text : '<s:text name="receipt.amount" />',dataIndex:'amount',name:'amount',align : 'center',width:100}
		,{text : '<s:text name="receipt.receiptAmount" />',dataIndex:'receiptAmount',name:'receiptAmount',align : 'center',width:100}
		,{text : '<s:text name="receipt.accountBalance" />',dataIndex:'accountBalance',name:'accountBalance',align : 'center',width:100}
	];
	var columnOperators = [{
		xtype:'rownumberer',
		width:40
	}/* ,{
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'serve/serve!delete');
		}
	}]
	} */];
	var mainColumns = columnOperators.concat(mainFields);
</script>

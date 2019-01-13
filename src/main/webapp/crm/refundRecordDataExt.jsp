<%@ page contentType="text/html;charset=UTF-8"%>
<script>
	var mainFields = [
		{text : 'id',dataIndex : 'id',name : 'id',width : 40,hidden : true}
		,{text : '<s:text name="refundRecord.consumerId" />',dataIndex:'consumerId',name:'consumerId',align : 'center',width:100}
		,{text : '<s:text name="refundRecord.refundTime" />',dataIndex:'refundTime',name:'refundTime',align : 'center',width:100,xtype: 'datecolumn', convert: convertDate}
		,{text : '<s:text name="refundRecord.amount" />',dataIndex:'amount',name:'amount',align : 'center',width:100}
		,{text : '<s:text name="refundRecord.bookingId" />',dataIndex:'bookingId',name:'bookingId',align : 'center',width:100}
		,{text : '<s:text name="refundRecord.memo" />',dataIndex:'memo',name:'memo',align : 'center',width:100}
		,{text : '<s:text name="refundRecord.relatedId" />',dataIndex:'relatedId',name:'relatedId',align : 'center',width:100}
		,{text : '<s:text name="refundRecord.relatedType" />',dataIndex:'relatedType',name:'relatedType',align : 'center',width:100}
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
				delFromDB(grid.getStore(), grid.getSelectionModel(),'crm/fundRecord!delete');
		}
	}]
	}];
	var mainColumns = columnOperators.concat(mainFields);
</script>
